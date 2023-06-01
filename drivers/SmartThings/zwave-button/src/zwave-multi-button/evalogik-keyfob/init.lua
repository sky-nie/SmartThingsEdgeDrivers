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
--- @type st.zwave.CommandClass.Association
local Association = (require "st.zwave.CommandClass.Association")({ version=1 })

local ZWAVE_EVALOGIK_KEYFOB_FINGERPRINTS = {
  {mfr = 0x0312, prod = 0x7000, model = 0x7002} -- EVALOGIK DIMMER BUTTON
}

local function can_handle_evalogik_keyfob(opts, driver, device, ...)
  for _, fingerprint in ipairs(ZWAVE_EVALOGIK_KEYFOB_FINGERPRINTS) do
    if device:id_match(fingerprint.mfr, fingerprint.prod, fingerprint.model) then
      return true
    end
  end
  return false
end

local do_configure = function(self, device)
  device:refresh()
  device:send(Association:Set({grouping_identifier = 1, node_ids = {self.environment_info.hub_zwave_id}}))
end

local evalogik_keyfob = {
  NAME = "EvaLoggik keyfob",
  lifecycle_handlers = {
    doConfigure = do_configure
  },
  can_handle = can_handle_evalogik_keyfob,
}

return evalogik_keyfob
