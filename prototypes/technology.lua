local utils = require("utils")
--钢
utils.remove_packs("steel-processing",{"automation-science-pack"})
utils.set_prerequisites("steel-processing",{"space-science-pack"})
--太阳能
utils.remove_packs("solar-energy",{"logistic-science-pack"})
utils.set_count("solar-energy",50)
utils.set_prerequisites("solar-energy",{"steel-processing","automation-science-pack"})
--组装机
utils.remove_packs("automation",{"automation-science-pack"})
utils.set_prerequisites("automation",{"electronics"})


--各种调依赖
utils.set_prerequisites("space-science-pack", {})
utils.set_prerequisites("electronics", {"space-science-pack"})
utils.set_prerequisites("steam-power", {"space-science-pack"})
utils.set_prerequisites("logistic-system", {"logistic-robotics"})
utils.add_recipes("steel-processing",{"space-platform-foundation"})
utils.set_prerequisites("space-platform",{"processing-unit","electric-engine","low-density-structure"})
-- utils.remove_recipes("space-platform",{"metallic-astroid-crushing","carbonic-astroid-crushing","oxide-astroid-crushing"})
-- utils.add_recipes("space-science-pack",{"metallic-astroid-crushing","carbonic-astroid-crushing","oxide-astroid-crushing"})
utils.set_prerequisites("space-platform-thruster",{"space-platform"})
utils.set_prerequisites("rocket-silo",{"processing-unit","electric-engine","low-density-structure"})
utils.remove_recipes("space-platform-thruster",{"ice-melting"})
data.raw["technology"]["rocket-silo"]["effects"]={{
    type = "unlock-space-location",
    space_location = "mothership",
    use_icon_overlay_constant = true
}}
--化工&生物
data:extend({
    {
    type = "technology",
    name = "biomass-gathering",
    icon = "__spaceship-beginning__/graphics/icons/biomass-gathering.png",
    icon_size = 256,
    essential = true,
    effects = {},
    prerequisites = {"fluid-handling"},
    unit = {
        count = 100,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"space-science-pack", 1}
        },
        time = 30
    }
    },
    {
    type = "technology",
    name = "germiculture",
    icon = "__spaceship-beginning__/graphics/icons/bacteria-cultivation.png",
    icon_size = 64,
    essential = true,
    effects = {},
    prerequisites = {"biomass-gathering"},
    unit = nil,
    research_trigger={
        type="craft-fluid",
        fluid="organic-solution",
        amount=50
    }
    }
})

utils.add_recipes("biomass-gathering",{"ice-melting","oil-refinery","basic-oil-processing","solid-fuel-from-petroleum-gas"})
data.raw.technology["oil-processing"].enabled=false
data.raw.technology["oil-gathering"].enabled=false

utils.add_recipes("biomass-gathering",{"organic-solution-gathering","chemical-plant"})
utils.add_recipes("germiculture",{"bacteria-discovering","bacteria-cultivation","extracting-organic-solution-from-bacteria","carbon-astroid-natural-selecting","oil-bacteria-evolution","oil-bacteria-cultivation"})

utils.set_prerequisites("plastics",{"germiculture"})
utils.add_recipes("plastics",{"plastic-bacteria-cultivation"})
utils.set_prerequisites("sulfur-processing",{"germiculture"})
utils.add_recipes("sulfur-processing",{"sulfur-bacteria-cultivation","coal-synthesis"})

utils.set_prerequisites("flammables",{"biomass-gathering"})

--母星科技
data:extend{{
    type = "technology",
    name = "planet-discovery-nauvis",
    icons = util.technology_icon_constant_planet("__spaceship-beginning__/nauvis.png"),
    icon_size = 256,
    essential = true,
    effects = {},
    prerequisites = {"space-platform-thruster"},
    unit = {
        count = 1000,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"space-science-pack", 1}
        },
        time = 60
    }
}}
utils.set_prerequisites("uranium-mining", {"planet-discovery-nauvis"})
utils.add_prerequisites("captivity", {"planet-discovery-nauvis"})
utils.add_prerequisites("fish-breeding", {"planet-discovery-nauvis"})
utils.add_prerequisites("tree-seeding", {"planet-discovery-nauvis"})
utils.add_prerequisites("planet-discovery-aquilo", {"planet-discovery-nauvis"})
utils.add_recipes("uranium-mining", {"pitchblende"})
utils.set_trigger("uranium-processing", {type = "craft-item", item = "pitchblende",count=5})

--火星科技
utils.set_trigger("calcite-processing", {type = "craft-item", item = "calcite",count=5})
utils.set_prerequisites("tungsten-steel",{"foundry"})
utils.set_trigger("tungsten-steel",{type="craft-item",item="foundry",amount=1})
utils.set_trigger("tungsten-carbide",{type = "craft-item", item = "tungsten-ore",count=5})
data.raw.technology["big-mining-drill"].enabled=false
data.raw.technology["electric-mining-drill"].enabled=false
utils.add_recipes("planet-discovery-vulcanus",{"advanced-oxide-asteroid-crushing","advanced-metallic-asteroid-crushing","molten-tungsten-from-lava"})

--草星科技
utils.remove_recipes("rocket-turret",{"coal-synthesis"})
utils.add_recipes("planet-discovery-gleba",{"organic-asteroid-crushing"})
utils.set_trigger("agriculture",{type = "craft-item", item = "spoilage",count=20})
utils.set_trigger("jellynut",{type = "craft-item", item = "jellynut-seed",count=1})
utils.set_trigger("yumako",{type = "craft-item", item = "yumako-seed",count=1})
utils.set_trigger("heating-tower",{type = "craft-item", item = "pentapod-egg",count=1})
utils.add_recipes("bioflux",{"organic-solution-from-bioflux"})
--雷星科技
--回收产能
local scrap_4 = data.raw.technology["scrap-recycling-productivity"]

local scrap_3 = table.deepcopy(scrap_4)
scrap_3.max_level = nil
scrap_3.unit.count_formula = nil

local scrap_2 = table.deepcopy(scrap_3)

local scrap_1 = table.deepcopy(scrap_2)
scrap_1.upgrade = nil

scrap_1.name = scrap_1.name .. "-1"
scrap_2.name = scrap_2.name .. "-2"
scrap_3.name = scrap_3.name .. "-3"

scrap_1.unit.count = 100
scrap_2.unit.count = 250
scrap_3.unit.count = 500

scrap_1.prerequisites = {"recycling"}
scrap_2.prerequisites = {scrap_1.name}
scrap_3.prerequisites = {"production-science-pack", scrap_2.name}

scrap_4.unit.count_formula = "1.5^(L-3)*500"

utils.add_prerequisites("scrap-recycling-productivity", {scrap_3.name})

data:extend{scrap_1, scrap_2, scrap_3}

utils.add_recipes("recycling",{"metallic-asteroid-recycling"})
utils.remove_recipes("recycling",{"scrap-recycling"})
--冰星科技
utils.add_recipes("planet-discovery-aquilo",{"aquilo-asteroid-smelting-1","aquilo-asteroid-smelting-2","aquilo-asteroid-smelting-3"})
--加白瓶
for _, technology in pairs(data.raw.technology) do
    if technology.unit then
        utils.add_pack(technology.name,"space-science-pack")
    end
end