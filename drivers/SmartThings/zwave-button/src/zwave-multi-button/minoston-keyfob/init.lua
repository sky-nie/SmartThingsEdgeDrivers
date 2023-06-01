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

local ZWAVE_MINOSTON_KEYFOB_FINGERPRINTS = {
  {mfr = 0x0312, prod = 0x0924, model = 0xD001} -- Minoston Wallmote
}

local function can_handle_minoston_keyfob(opts, driver, device, ...)
  for _, fingerprint in ipairs(ZWAVE_MINOSTON_KEYFOB_FINGERPRINTS) do
    if device:id_match(fingerprint.mfr, fingerprint.prod, fingerprint.model) then
      return true
    end
  end
  return false
end

local do_configure = function(self, device)
  device:refresh()
end

local minoston_keyfob = {
  NAME = "Minoston keyfob",
  lifecycle_handlers = {
    doConfigure = do_configure
  },
  can_handle = can_handle_minoston_keyfob,
}

return minoston_keyfob
