data:extend({{
  type = "container",
  inventory_size = 1,
  order = "a-b",
  name = "pnd-placer-up",
  icon = "__place-and-destroy__/graphics/placer_up.png",
  picture = {
    filename = "__place-and-destroy__/graphics/placer_up.png",
    priority = "extra-high",
    width = 48,
    height = 34,
    shift = {0.2, 0}
  },
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {hardness = 0.2, mining_time = 0.5, result = "pnd-placer"},
  max_health = 200,
  corpse = "small-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  allowed_effects = {"consumption", "speed", "pollution"},
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.03 / 3.5
  },
  energy_usage = "500kW"
}, {
  type = "container",
  inventory_size = 1,
  order = "a-b",
  name = "pnd-placer-down",
  icon = "__place-and-destroy__/graphics/placer_down.png",
  picture = {
    filename = "__place-and-destroy__/graphics/placer_down.png",
    priority = "extra-high",
    width = 48,
    height = 34,
    shift = {0.2, 0}
  },
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {hardness = 0.2, mining_time = 0.5, result = "pnd-placer"},
  max_health = 200,
  corpse = "small-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  allowed_effects = {"consumption", "speed", "pollution"},
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.03 / 3.5
  },
  energy_usage = "500kW"
}, {
  type = "container",
  inventory_size = 1,
  order = "a-b",
  name = "pnd-placer-left",
  icon = "__place-and-destroy__/graphics/placer_left.png",
  picture = {
    filename = "__place-and-destroy__/graphics/placer_left.png",
    priority = "extra-high",
    width = 48,
    height = 34,
    shift = {0.2, 0}
  },
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {hardness = 0.2, mining_time = 0.5, result = "pnd-placer"},
  max_health = 200,
  corpse = "small-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  allowed_effects = {"consumption", "speed", "pollution"},
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.03 / 3.5
  },
  energy_usage = "500kW"
}, {
  type = "container",
  inventory_size = 1,
  order = "a-b",
  name = "pnd-placer-right",
  icon = "__place-and-destroy__/graphics/placer_right.png",
  picture = {
    filename = "__place-and-destroy__/graphics/placer_right.png",
    priority = "extra-high",
    width = 48,
    height = 34,
    shift = {0.2, 0}
  },
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {hardness = 0.2, mining_time = 0.5, result = "pnd-placer"},
  max_health = 200,
  corpse = "small-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  allowed_effects = {"consumption", "speed", "pollution"},
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.03 / 3.5
  },
  energy_usage = "500kW"
}

, {
  type = "container",
  inventory_size = 1,
  order = "a-b",
  name = "pnd-destroyer",
  icon = "__place-and-destroy__/graphics/destroyer_up.png",
  picture = {
    filename = "__place-and-destroy__/graphics/destroyer_up.png",
    priority = "extra-high",
    width = 48,
    height = 34,
    shift = {0.2, 0}
  },
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {hardness = 0.2, mining_time = 0.5, result = "pnd-destroyer"},
  max_health = 200,
  corpse = "small-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  allowed_effects = {"consumption", "speed", "pollution"},
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.03 / 3.5
  },
  energy_usage = "500kW"
},


  {
    type = "assembling-machine",
    name = "pnd-placer-placeholder",
    icon = '__place-and-destroy__/graphics/placer_up.png',
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "pnd-placer"},
    max_health = 20,
    corpse = "small-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"oil-processing"},
    crafting_speed = 1,
    has_backer_name = true,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "420kW",
    ingredient_count = 4,
    animation =
    {
    north = 
    {
      filename = '__place-and-destroy__/graphics/placer_up.png',
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.2, 0}
      ,frame_count = 1, animation_speed = 0
    },
    east = 
    {
      filename = '__place-and-destroy__/graphics/placer_right.png',
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.2, 0}
      ,frame_count = 1, animation_speed = 0
    },
    south = 
    {
      filename = '__place-and-destroy__/graphics/placer_down.png',
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.2, 0}
      ,frame_count = 1, animation_speed = 0
    },
    west = 
    {
      filename = '__place-and-destroy__/graphics/placer_left.png',
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.2, 0}
      ,frame_count = 1, animation_speed = 0
    }
    },
    working_visualisations = {},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
    fluid_boxes = {},
    pipe_covers = pipecoverspictures()
  }

})