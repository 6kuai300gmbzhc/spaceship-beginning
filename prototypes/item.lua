local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
data.raw["item"]["iron-bacteria"].order="b-e"
data:extend({
    {--生物溶剂
        type = "fluid",
        name = "organic-solution",
        icon = "__spaceplatform-block__/graphics/icons/organic-solution.png",
        subgroup = "fluid",
        order = "b-a-a",
        default_temperature = 40,
        max_temperature = 100,
        base_color = {0.48, 0.52, 0.15},
        flow_color = {0.48, 0.52, 0.15},
        auto_barrel = false
    },
    {--普通细菌
      type = "item",
      name = "bacteria",
      icon = "__spaceplatform-block__/graphics/icons/bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/bacteria.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-c[bacteria]",
      inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
      pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
      drop_sound = space_age_item_sounds.agriculture_inventory_move,
      stack_size = 50,
      default_import_location = "gleba",
      weight = 1 * kg,
      spoil_ticks = 1 * minute,
      spoil_result = "carbon"
    },
    {--塑料细菌
      type = "item",
      name = "plastic-bacteria",
      icon = "__spaceplatform-block__/graphics/icons/plastic-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/plastic-bacteria.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-f",
      inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
      pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
      drop_sound = space_age_item_sounds.agriculture_inventory_move,
      stack_size = 50,
      default_import_location = "gleba",
      weight = 1 * kg,
      spoil_ticks = 1 * minute,
      spoil_result = "bacteria"
    },
    {--硫细菌
      type = "item",
      name = "sulfur-bacteria",
      icon = "__spaceplatform-block__/graphics/icons/sulfur-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/sulfur-bacteria.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-g",
      inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
      pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
      drop_sound = space_age_item_sounds.agriculture_inventory_move,
      stack_size = 50,
      default_import_location = "gleba",
      weight = 1 * kg,
      spoil_ticks = 1 * minute,
      spoil_result = "bacteria"
    },
    {--油细菌
      type = "item",
      name = "oil-bacteria",
      icon = "__spaceplatform-block__/graphics/icons/oil-bacteria.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/oil-bacteria.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "agriculture-processes",
      order = "b[agriculture]-h",
      inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
      pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
      drop_sound = space_age_item_sounds.agriculture_inventory_move,
      stack_size = 50,
      default_import_location = "gleba",
      weight = 1 * kg,
      spoil_ticks = 1 * minute,
      spoil_result = "bacteria"
    },
    {--沥青铀矿
      type = "item",
      name = "pitchblende",
      icon = "__spaceplatform-block__/graphics/icons/pitchblende.png",
      pictures =
      {
        { size = 64, filename = "__spaceplatform-block__/graphics/icons/pitchblende.png", scale = 0.5, mipmap_count = 4 }
      },
      subgroup = "intermediate-product",
      order = "b-a",
      inventory_move_sound = {
        filename = "__base__/sound/item/resource-inventory-move.ogg",
        volume = 0.8
      },
      pick_sound = {
        filename = "__base__/sound/item/resource-inventory-pickup.ogg",
        volume = 0.6
      },
      drop_sound = {
        filename = "__base__/sound/item/resource-inventory-move.ogg",
        volume = 0.8
      },
      stack_size = 50,
      default_import_location = "nauvis",
      weight = 1 * kg
    },
    {--有机质星岩
      type="item",
      name="organic-asteroid-chunk",
      icon="__spaceplatform-block__/graphics/icons/organic-asteroid-chunk.png",
      subgroup="space-material",
      stack_size = 1,
      default_import_location = "nauvis",
      weight = 100 * kg,
      order="z-z-z",
      spoil_ticks = 5 * minute,
      spoil_to_trigger_result={
        items_per_trigger = 1,
        trigger = {
          action_delivery = {
            source_effects = {
              {
                affects_target = true,
                as_enemy = true,
                entity_name = "small-strafer-pentapod",
                find_non_colliding_position = true,
                non_colliding_fail_result = {
                  action_delivery = {
                    source_effects = {
                      {
                        affects_target = true,
                        as_enemy = true,
                        entity_name = "small-strafer-pentapod",
                        offset_deviation = {
                          {
                            -1,
                            -1
                          },
                          {
                            1,
                            1
                          }
                        },
                        show_in_tooltip = false,
                        type = "create-entity"
                      }
                    },
                    type = "instant"
                  },
                  type = "direct"
                },
                offset_deviation = {
                  {
                    -5,
                    -5
                  },
                  {
                    5,
                    5
                  }
                },
                show_in_tooltip = true,
                type = "create-entity"
              }
            },
            type = "instant"
          },
          type = "direct"
        }
      }
    },
    {--铀矿星岩
    type="item",
    name="uranium-asteroid-chunk",
    icon="__spaceplatform-block__/graphics/icons/uranium-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "nauvisorbit",
    weight = 100 * kg,
    order="z-z-z",
    },
    {--钨矿星岩
    type="item",
    name="tungsten-asteroid-chunk",
    icon="__spaceplatform-block__/graphics/icons/tungsten-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "vulcanus",
    weight = 100 * kg,
    order="z-z-z",
    },
    {--钬矿星岩
    type="item",
    name="holmium-asteroid-chunk",
    icon="__spaceplatform-block__/graphics/icons/holmium-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "fulgora",
    weight = 100 * kg,
    order="z-z-z",
    },
    {--冰星星岩
    type="item",
    name="aquilo-asteroid-chunk",
    icon="__spaceplatform-block__/graphics/icons/aquilo-asteroid-chunk.png",
    subgroup="space-material",
    stack_size = 1,
    default_import_location = "aquilo",
    weight = 100 * kg,
    order="z-z-z",
    }
})
local sol_silo=table.deepcopy(data.raw.item["rocket-silo"])
sol_silo.name="sol-rocket-silo"
sol_silo.place_result="sol-rocket-silo"
sol_silo.icon="__spaceplatform-block__/graphics/icons/sol-rocket-silo.png"
sol_silo.localised_description={"description.sol-rocket-silo"}
data:extend{sol_silo}
data.raw.item["iron-bacteria"].spoil_result="oil-bacteria"
data.raw.item["copper-bacteria"].spoil_result="oil-bacteria"
data.raw.item["rocket-silo"].weight=1000000
data.raw.item["sol-rocket-silo"].weight=1000000
data.raw["space-platform-starter-pack"]["space-platform-starter-pack"].icon="__spaceplatform-block__/graphics/icons/space-platform-hub.png"
local planet_platform={
  icon = "__space-age__/graphics/icons/space-platform-hub.png",
  name = "planet-platform",
  order = "a",
  subgroup = "planets",
  surface_properties = {
    ["day-night-cycle"] = 0,
    gravity = 0,
    ["magnetic-field"] = 0,
    pressure = 1
  },
  type = "surface"
}
data:extend{planet_platform}
local pack_pattern=table.deepcopy(data.raw["space-platform-starter-pack"]["space-platform-starter-pack"])
pack_pattern.create_electric_network = false
pack_pattern.hidden=true
pack_pattern.hidden_in_factoriopedia=true
pack_pattern.trigger={
  {
    action_delivery = {
      source_effects = {
        {
          entity_name = "substation",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
pack_pattern.surface="planet-platform"

--添加给平台准备的启动包
local normal_pack = table.deepcopy(pack_pattern)
normal_pack.name="normal-pack"
local mothership_pack=table.deepcopy(pack_pattern)
mothership_pack.hidden=false
mothership_pack.hidden_in_factoriopedia=false
mothership_pack.name="mothership-pack"
mothership_pack.icon="__base__/graphics/icons/satellite.png"
mothership_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "substation",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
local vulcanus_pack = table.deepcopy(pack_pattern)
vulcanus_pack.name="vulcanus-pack"
vulcanus_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "foundry",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
local nauvis_pack = table.deepcopy(pack_pattern)
nauvis_pack.name="nauvisorbit-pack"
nauvis_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "crash-site-spaceship",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
nauvis_pack.tiles={}
for i=-18,25 do
  for j=-7,7 do
    local tile=
    {
        position = {
          i,
          j
        },
        tile = "space-platform-foundation"
    }
    table.insert(nauvis_pack.tiles,tile)
  end
end
local gleba_pack = table.deepcopy(pack_pattern)
gleba_pack.name="gleba-pack"
for i=-6,6 do
  for j=-6,6 do
    local tile=
    {
        position = {
          i,
          j+12
        },
        tile = "space-platform-foundation"
    }
    if i>-6 and i<6 and j>-6 and j<6 then
      if i>0 then
        tile.tile="natural-jellynut-soil"
      else tile.tile="natural-yumako-soil"
      end
    end
    table.insert(gleba_pack.tiles,tile)
  end
end
local aquilo_pack = table.deepcopy(pack_pattern)
aquilo_pack.name="aquilo-pack"

aquilo_pack.trigger={
  { 
    action_delivery = {
      {
        source_effects = {
          {
            entity_name = "fusion-reactor",
            type = "create-entity",
            offsets={{x=-2,y=-2}}
          }
        },
        type = "instant"
      },
      {
        source_effects = {
          {
            entity_name = "biter-spawner",
            type = "create-entity",
            offsets={{x=2,y=2}},
            as_enemy=true
          }
        },
        type = "instant"
      }
    },
    type = "direct"
  }
}
local fulgora_pack = table.deepcopy(pack_pattern)
fulgora_pack.name="fulgora-pack"

fulgora_pack.trigger={
  { 
    action_delivery = {
      source_effects = {
        {
          entity_name = "electromagnetic-plant",
          type = "create-entity"
        }
      },
      type = "instant"
    },
    type = "direct"
  }
}
data:extend{
  mothership_pack,
  vulcanus_pack,
  nauvis_pack,
  gleba_pack,
  aquilo_pack,
  fulgora_pack,
  normal_pack
}
--太空种子
local cuttlepop_seed=table.deepcopy(data.raw.item["yumako-seed"])
cuttlepop_seed.name="cuttlepop-seed"
cuttlepop_seed.localised_description = {
  "item-description.cuttlepop-seed"
}
cuttlepop_seed.localised_name = {"item-name.cuttlepop-seed"}
cuttlepop_seed.order="a-c"
cuttlepop_seed.place_result="space-cuttlepop"
cuttlepop_seed.plant_result="space-cuttlepop"
cuttlepop_seed.icon="__spaceplatform-block__/graphics/icons/cuttlepop-seed.png"
cuttlepop_seed.pictures = {
  {
    filename = "__spaceplatform-block__/graphics/icons/cuttlepop-seed.png",
    mipmap_count = 4,
    scale = 0.5,
    size = 64
  }
}
local hairyclubnub_seed=table.deepcopy(data.raw.item["yumako-seed"])
hairyclubnub_seed.name="hairyclubnub-seed"
hairyclubnub_seed.localised_description = {
  "item-description.hairyclubnub-seed"
}
hairyclubnub_seed.localised_name = {"item-name.hairyclubnub-seed"}
hairyclubnub_seed.order="a-c"
hairyclubnub_seed.place_result="space-hairyclubnub"
hairyclubnub_seed.plant_result="space-hairyclubnub"
hairyclubnub_seed.icon="__spaceplatform-block__/graphics/icons/hairyclubnub-seed.png"
hairyclubnub_seed.pictures = {
  {
    filename = "__spaceplatform-block__/graphics/icons/hairyclubnub-seed.png",
    mipmap_count = 4,
    scale = 0.5,
    size = 64
  }
}
data:extend{
  cuttlepop_seed,hairyclubnub_seed
}
local scrap1 =table.deepcopy(data.raw.item.scrap)
scrap1.spoil_result="scrap"
scrap1.spoil_ticks=300
scrap1.name="scrap1"
scrap1.hidden=true
scrap1.hidden_in_factoriopedia=true
data:extend{scrap1}