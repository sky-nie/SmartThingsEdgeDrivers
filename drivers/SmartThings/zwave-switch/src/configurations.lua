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

local devices = {
  AEOTEC_METERING_SWITCH = {
    MATCHING_MATRIX = {
      mfrs = 0x0086,
      product_types = {0x0003, 0x0103, 0x0203},
      product_ids = {0x0012, 0x0060, 0x0074, 0x004E}
    },
    CONFIGURATION = {
      {parameter_number = 80, size = 1, configuration_value = 2},
      {parameter_number = 101, size = 4, configuration_value = 12},
      {parameter_number = 111, size = 4, configuration_value = 300}
    }
  },
  AEOTEC_SMART_SWITCH_7 = {
    MATCHING_MATRIX = {
      mfrs = 0x0371,
      product_types = 0x0103,
      product_ids = 0x0017
    },
    CONFIGURATION = {
      {parameter_number = 21, size = 2, configuration_value = 2}
    }
  },
  FIBARO_WALL_PLUG_UK = {
    MATCHING_MATRIX = {
      mfrs = 0x010F,
      product_types = 0x1801,
      product_ids = 0x1000
    },
    CONFIGURATION = {
      {parameter_number = 11, size = 1, configuration_value = 2},
      {parameter_number = 13, size = 2, configuration_value = 300}
    }
  },
  GO_CONTROL_PLUG_IN_SWITCH = {
    MATCHING_MATRIX = {
      mfrs = 0x014F,
      product_types = 0x5053,
      product_ids = 0x3531
    },
    CONFIGURATION = {
      {parameter_number = 13, size = 2, configuration_value = 15}
    }
  },
  POPP_OUTDOOR_PLUG = {
    MATCHING_MATRIX = {
      mfrs = 0x0154,
      product_types = 0x0003,
      product_ids = 0x000A
    },
    CONFIGURATION = {
      {parameter_number = 25, size = 1, configuration_value = 1}
    }
  },
  AEON_SMART_STRIP = {
    MATCHING_MATRIX = {
      mfrs = 0x0086,
      product_types = 0x0003,
      product_ids = 0x000B
    },
    CONFIGURATION = {
      {parameter_number = 4, size = 1, configuration_value = 1},
      {parameter_number = 5, size = 2, configuration_value = 5},
      {parameter_number = 8, size = 2, configuration_value = 5},
      {parameter_number = 9, size = 2, configuration_value = 5},
      {parameter_number = 10, size = 2, configuration_value = 5},
      {parameter_number = 11, size = 2, configuration_value = 5},
      {parameter_number = 12, size = 1, configuration_value = 50},
      {parameter_number = 15, size = 1, configuration_value = 50},
      {parameter_number = 16, size = 1, configuration_value = 50},
      {parameter_number = 17, size = 1, configuration_value = 50},
      {parameter_number = 18, size = 1, configuration_value = 50},
      {parameter_number = 101, size = 4, configuration_value = 1},
      {parameter_number = 102, size = 4, configuration_value = 30976},
      {parameter_number = 111, size = 4, configuration_value = 900},
      {parameter_number = 112, size = 4, configuration_value = 90}
    }
  },
  AEOTEC_DUAL_NANO_SWITCH = {
    MATCHING_MATRIX = {
      mfrs = 0x0086,
      product_types = {0x0003, 0x0103, 0x0203},
      product_ids = 0x0084
    },
    CONFIGURATION = {
      {parameter_number = 255, size = 1, configuration_value = 0},
      {parameter_number = 4, size = 1, configuration_value = 1},
      {parameter_number = 80, size = 1, configuration_value = 2},
      {parameter_number = 101, size = 4, configuration_value = 2048},
      {parameter_number = 111, size = 4, configuration_value = 600},
      {parameter_number = 102, size = 4, configuration_value = 4096},
      {parameter_number = 112, size = 4, configuration_value = 600},
      {parameter_number = 90, size = 1, configuration_value = 1},
      {parameter_number = 91, size = 2, configuration_value = 20}
    }
  },
  EATON_RF_DIMMER = {
    MATCHING_MATRIX = {
      mfrs = 0x001A,
      product_types = 0x4449,
      product_ids = {0x0101, 0x0003}
    },
    CONFIGURATION = {
      {parameter_number = 7, size = 1, configuration_value = 1}
    }
  },
  HONEYWELL_DIMMER = {
    MATCHING_MATRIX = {
      mfrs = 0x0039,
      product_types = {0x4944, 0x5044},
      product_ids = {0x3033, 0x3038, 0x3130}
    },
    CONFIGURATION = {
      {parameter_number = 7, size = 1, configuration_value = 1},
      {parameter_number = 8, size = 2, configuration_value = 1},
      {parameter_number = 9, size = 1, configuration_value = 1},
      {parameter_number = 10, size = 2, configuration_value = 1}
    }
  },
  WYFY_TOUCH = {
    MATCHING_MATRIX = {
      mfrs = 0x015F,
      product_types = {0x3102, 0x3111, 0x3121, 0x3141},
      product_ids = {0x0201, 0x0202, 0x0204, 0x3111, 0x5102}
    },
    CONFIGURATION = {
      {parameter_number = 2, size = 1, configuration_value = 1}
    }
  },
  ZOOZ_SWITCH = {
    MATCHING_MATRIX = {
      mfrs = 0x027A,
      product_types = 0xA000,
      product_ids = 0xA003
    },
    CONFIGURATION = {
      {parameter_number = 2, size = 4, configuration_value = 10},
      {parameter_number = 3, size = 4, configuration_value = 600},
      {parameter_number = 4, size = 4, configuration_value = 600}
    }
  },
  AEOTEC_NANO_DIMMER = {
    MATCHING_MATRIX = {
      mfrs = 0x0086,
      product_types = {0x0003, 0x0103, 0x0203},
      product_ids = 0x006F
    },
    CONFIGURATION = {
      {parameter_number = 80, size = 1, configuration_value = 2},
      {parameter_number = 101, size = 4, configuration_value = 12},
      {parameter_number = 111, size = 4, configuration_value = 300},
      {parameter_number = 90, size = 1, configuration_value = 1},
      {parameter_number = 91, size = 2, configuration_value = 1},
      {parameter_number = 102, size = 1, configuration_value = 4},
      {parameter_number = 103, size = 1, configuration_value = 8},
      {parameter_number = 112, size = 4, configuration_value = 300},
      {parameter_number = 113, size = 4, configuration_value = 300}
    }
  },
  AEOTEC_DIMMER_SWITCH = {
    MATCHING_MATRIX = {
      mfrs = 0x0086,
      product_types = {0x0003, 0x0103, 0x0203},
      product_ids = {0x001B, 0x0063}
    },
    CONFIGURATION = {
      {parameter_number = 80, size = 1, configuration_value = 2},
      {parameter_number = 101, size = 4, configuration_value = 12},
      {parameter_number = 111, size = 4, configuration_value = 300}
    }
  },
  AEOTEC_SMART_SWITCH_AND_ILLUMINATOR = {
    MATCHING_MATRIX = {
      mfrs = 0x0086,
      product_types = {0x0003, 0x0103, 0x0203},
      product_ids = {0x004B, 0x0019, 0x0013, 0x0008}
    },
    CONFIGURATION = {
      {parameter_number = 101, size = 4, configuration_value = 8},   -- energy in kWh
      {parameter_number = 111, size = 4, configuration_value = 300}, -- every 5 min
      {parameter_number = 102, size = 4, configuration_value = 0},
      {parameter_number = 103, size = 4, configuration_value = 0}
    }
  },
  SWITCH_BINARY_PR = {
    MATCHING_MATRIX = {
      mfrs = 0x0312,
      product_types = {0xEE00, 0xA000, 0xBB00},
      product_ids = {0xEE01, 0xEE03, 0xA005, 0xBB01, 0xBB03}
    },
    CONFIGURATION = {
      {parameter_number = 1, size = 1, configuration_value = 0},
      {parameter_number = 2, size = 1, configuration_value = 0},
      {parameter_number = 4, size = 4, configuration_value = 0},
      {parameter_number = 6, size = 4, configuration_value = 0},
      {parameter_number = 8, size = 1, configuration_value = 2}
    }
  },
  SMARTPLUG_BINARY_PR = {
    MATCHING_MATRIX = {
      mfrs = 0x0312,
      product_types = {0xC000, 0xFF00, 0xAC01},
      product_ids = {0xC009, 0xFF0C, 0x4001}
    },
    CONFIGURATION = {
      {parameter_number = 1, size = 1, configuration_value = 0},
      {parameter_number = 2, size = 4, configuration_value = 0},
      {parameter_number = 4, size = 4, configuration_value = 0},
      {parameter_number = 6, size = 1, configuration_value = 2}
    }
  },
  SWITCH_LEVEL_PR = {
    MATCHING_MATRIX = {
      mfrs = 0x0312,
      product_types = {0xEE00, 0x0004, 0xBB00},
      product_ids = {0xEE02, 0xEE04, 0xBB02, 0xBB04}
    },
    CONFIGURATION = {
      {parameter_number = 1, size = 1, configuration_value = 0},
      {parameter_number = 2, size = 1, configuration_value = 0},
      {parameter_number = 4, size = 4, configuration_value = 0},
      {parameter_number = 6, size = 4, configuration_value = 0},
      {parameter_number = 8, size = 1, configuration_value = 2},
      {parameter_number = 9, size = 1, configuration_value = 1},
      {parameter_number = 10, size = 4, configuration_value = 4},
      {parameter_number = 11, size = 1, configuration_value = 10},
      {parameter_number = 12, size = 1, configuration_value = 99}
    }
  },
  SWITCH_LEVEL_PLUG_PR = {
    MATCHING_MATRIX = {
      mfrs = 0x0312,
      product_types = {0xFF07, 0xAC01},
      product_ids = {0xFF03, 0x4002}
    },
    CONFIGURATION = {
      {parameter_number = 2, size = 1, configuration_value = 0},
      {parameter_number = 4, size = 4, configuration_value = 0},
      {parameter_number = 6, size = 4, configuration_value = 0},
      {parameter_number = 7, size = 1, configuration_value = 2},
      {parameter_number = 8, size = 1, configuration_value = 2},
      {parameter_number = 9, size = 1, configuration_value = 2},
      {parameter_number = 10, size = 4, configuration_value = 4},
      {parameter_number = 11, size = 1, configuration_value = 10},
      {parameter_number = 12, size = 1, configuration_value = 99}
    }
  },
  SWITCH_LEVEL_PLUG_PR1 = {
    MATCHING_MATRIX = {
      mfrs = 0x0312,
      product_types = 0xFF00,
      product_ids = 0xFF0D
    },
    CONFIGURATION = {
      {parameter_number = 2, size = 1, configuration_value = 0},
      {parameter_number = 4, size = 4, configuration_value = 0},
      {parameter_number = 6, size = 4, configuration_value = 0},
      {parameter_number = 7, size = 1, configuration_value = 2},
      {parameter_number = 8, size = 1, configuration_value = 2},
      {parameter_number = 9, size = 1, configuration_value = 2},
      {parameter_number = 10, size = 4, configuration_value = 4},
      {parameter_number = 11, size = 1, configuration_value = 10},
      {parameter_number = 12, size = 1, configuration_value = 99}
    }
  },
  SKYNIE_DUAL_SWITCH = {
    MATCHING_MATRIX = {
      mfrs = 0x0312,
      product_types = {0xFF01, 0xAC01, 0xC000},
      product_ids = {0xFF97, 0x0097, 0xC007}
    },
    CONFIGURATION = {
      ledModeParam = {parameter_number = 1, size = 1, configuration_value = 0},
      autoOffIntervalLeftParam = {parameter_number = 2, size = 4, configuration_value = 0},
      autoOffIntervalRightParam = {parameter_number = 3, size = 4, configuration_value = 0},
      autoOnIntervalLeftParam = {parameter_number = 4, size = 4, configuration_value = 0},
      autoOnIntervalRightParam = {parameter_number = 5, size = 4, configuration_value = 0},
      powerFailureRecoveryParam = {parameter_number = 6, size = 1, configuration_value = 2},
      ledBrightnessParam = {parameter_number = 7, size = 1, configuration_value = 2}
    }
  },
  SWITCH_BINARY_IN_PR = {
    MATCHING_MATRIX = {
      mfrs = 0x0063,
      product_types = 0x5052,
      product_ids = 0x3139
    },
    CONFIGURATION = {
      {parameter_number = 3, size = 1, configuration_value = 1},
      {parameter_number = 41, size = 1, configuration_value = 0},
      {parameter_number = 42, size = 1, configuration_value = 0},
      {parameter_number = 84, size = 1, configuration_value = 0}
    }
  },
  EAVLOGIK_DIMMER_BUTTON = {
    MATCHING_MATRIX = {
      mfrs = 0x0312,
      product_types = 0x7000,
      product_ids = 0x7002
    },
    CONFIGURATION = {
      {parameter_number = 1, size = 1, configuration_value = 0},
      {parameter_number = 2, size = 1, configuration_value = 0},
      {parameter_number = 3, size = 1, configuration_value = 50},
      {parameter_number = 4, size = 1, configuration_value = 2},
      {parameter_number = 5, size = 1, configuration_value = 100},
      {parameter_number = 6, size = 1, configuration_value = 20},
      {parameter_number = 7, size = 1, configuration_value = 0},
      {parameter_number = 8, size = 1, configuration_value = 255},
      {parameter_number = 9, size = 1, configuration_value = 0},
      {parameter_number = 10, size = 1, configuration_value = 2},
      {parameter_number = 11, size = 1, configuration_value = 2},
      {parameter_number = 12, size = 1, configuration_value = 2},
      {parameter_number = 13, size = 1, configuration_value = 2},
      {parameter_number = 14, size = 4, configuration_value = 0},
      {parameter_number = 15, size = 4, configuration_value = 0},
      {parameter_number = 16, size = 1, configuration_value = 0},
      {parameter_number = 17, size = 1, configuration_value = 0},
      {parameter_number = 18, size = 1, configuration_value = 0},
      {parameter_number = 19, size = 1, configuration_value = 0},
      {parameter_number = 20, size = 1, configuration_value = 1},
      {parameter_number = 21, size = 1, configuration_value = 2},
      {parameter_number = 22, size = 1, configuration_value = 255},
      {parameter_number = 23, size = 1, configuration_value = 255},
      {parameter_number = 24, size = 1, configuration_value = 0},
      {parameter_number = 25, size = 1, configuration_value = 80}
    }
  }
}

local configurations = {}

configurations.get_device_configuration = function(zw_device)
  for _, device in pairs(devices) do
    if zw_device:id_match(
      device.MATCHING_MATRIX.mfrs,
      device.MATCHING_MATRIX.product_types,
      device.MATCHING_MATRIX.product_ids) then
      return device.CONFIGURATION
    end
  end
  return nil
end

return configurations
