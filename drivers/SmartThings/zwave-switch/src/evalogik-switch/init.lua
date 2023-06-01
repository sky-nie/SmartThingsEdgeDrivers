-- Copyright 2022 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
local capabilities = require "st.capabilities"
--- @type st.zwave.CommandClass
local cc = require "st.zwave.CommandClass"
--- @type st.zwave.CommandClass.CentralScene
local CentralScene = (require "st.zwave.CommandClass.CentralScene")({version=3})
--- @type st.zwave.CommandClass.SceneActivation
local SceneActivation = (require "st.zwave.CommandClass.SceneActivation")({ version=1 })
--- @type st.zwave.CommandClass.Association
local Association = (require "st.zwave.CommandClass.Association")({ version=1 })

local log = require "log"
local EVALOGIK_MANUFACTURER_ID = 0x0312
local EVALOGIK_ZKS31_PRODUCT_TYPE = 0x7000
local EVALOGIK_DIMMER_PRODUCT_ID = 0x7002

local function device_added(driver, device)
  for _, component in pairs(device.profile.components) do
    if component.id ~= "main" then
      device:emit_component_event(
        component,
        capabilities.button.supportedButtonValues(
         {"double", "pushed", "pushed_2x", "pushed_3x", "pushed_4x", "pushed_5x", "pushed_6x", "held", "down", "down_2x", "down_3x", "down_4x", "down_5x", "down_6x", "down_hold", "up", "up_2x", "up_3x", "up_4x", "up_5x", "up_6x", "up_hold"},
          { visibility = { displayed = false } }
        )
      )
      device:emit_component_event(
        component,
        capabilities.button.numberOfButtons({value = 5}, { visibility = { displayed = false } })
      )
    end
  end
  device:refresh()
end

local map_scene_number_to_component = {
  [1] = "button1",
  [2] = "button2",
  [3] = "button3",
  [4] = "button4",
  [5] = "button5"
}

local map_key_attribute_to_capability = {
  [CentralScene.key_attributes.KEY_PRESSED_1_TIME] = capabilities.button.button.pushed,
  [CentralScene.key_attributes.KEY_RELEASED] = capabilities.button.button.held,
  [CentralScene.key_attributes.KEY_HELD_DOWN] = capabilities.button.button.down_hold,
  [CentralScene.key_attributes.KEY_PRESSED_2_TIMES] = capabilities.button.button.double,
  [CentralScene.key_attributes.KEY_PRESSED_3_TIMES] = capabilities.button.button.pushed_3x,
  [CentralScene.key_attributes.KEY_PRESSED_4_TIMES] = capabilities.button.button.pushed_4x,
  [CentralScene.key_attributes.KEY_PRESSED_5_TIMES] = capabilities.button.button.pushed_5x
}

local function central_scene_notification_handler(self, device, cmd)
  if ( cmd.args.scene_number ~= nil and cmd.args.scene_number ~= 0 ) then
    local capability_attribute = map_key_attribute_to_capability[cmd.args.key_attributes]
    local additional_fields = {
      state_change = true
    }

    local event
    if capability_attribute ~= nil then
      event = capability_attribute(additional_fields)
    end

    if event ~= nil then
      -- device reports scene notifications from endpoint 0 (main) but central scene events have to be emitted for button components: 1,2,3
      local comp = device.profile.components[map_scene_number_to_component[cmd.args.scene_number]]
      if comp ~= nil then
        device:emit_component_event(comp, event)
      end
    end
  end
end

local function can_handle_evalogik_switch(opts, driver, device, ...)
  if device:id_match(
    EVALOGIK_MANUFACTURER_ID,
    EVALOGIK_ZKS31_PRODUCT_TYPE,
    EVALOGIK_DIMMER_PRODUCT_ID
  ) then
    return true
  end
  return false
end

local function scene_activation_handler(self, device, cmd)
  local scene_id = cmd.args.scene_id
  local event = scene_id % 2 == 0 and capabilities.button.button.held or capabilities.button.button.pushed
  device:emit_event_for_endpoint((scene_id + 1) // 2, event({state_change = true}))
  device:emit_event(event({state_change = true}))
end

local function component_to_endpoint(device, component_id)
  local ep_num = component_id:match("button(%d)")
  log.info("2.component_to_endpoint ep_num = ",ep_num)
  return { ep_num and tonumber(ep_num) }
end

local function endpoint_to_component(device, ep)
  log.info("2.endpoint_to_component ep = ",ep)
  local button_comp = string.format("button%d", ep)
  log.info("2.endpoint_to_component button_comp = ",button_comp)
  if device.profile.components[button_comp] ~= nil then
    log.info("2.endpoint_to_component return ",button_comp)
    return button_comp
  else
    log.info("2.endpoint_to_component return main")
    return "main"
  end
end

local function device_init(self, device)
  device:set_component_to_endpoint_fn(component_to_endpoint)
  device:set_endpoint_to_component_fn(endpoint_to_component)
end

local do_configure = function(self, device)
  device:refresh()
  device:send(Association:Set({grouping_identifier = 1, node_ids = {self.environment_info.hub_zwave_id}}))
end

local evalogik_switch = {
  NAME = "EVA LOGIK SWITCH",
  zwave_handlers = {
    [cc.CENTRAL_SCENE] = {
      [CentralScene.NOTIFICATION] = central_scene_notification_handler
    },
    [cc.SCENE_ACTIVATION] = {
      [SceneActivation.SET] = scene_activation_handler
    }
  },
  lifecycle_handlers = {
    doConfigure = do_configure,
    added = device_added
  },
  can_handle = can_handle_evalogik_switch
}

return evalogik_switch
