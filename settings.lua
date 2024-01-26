-- Startup
data:extend{
-- Vanilla
    {
        type = "bool-setting",
        name = "belt-resort",
        setting_type = "startup",
        default_value = false,
        order = "1a"
    },
    {
        type = "bool-setting",
        name = "+1-to-underground-length",
        setting_type = "startup",
        default_value = false,
        order = "1c"
    },
    {
        type = "int-setting",
        name = "pipe-to-ground-max-length",
        setting_type = "startup",
        default_value = 9,
        minimum_value = 2,
        maximum_value = 120,
        order = "aa"
    },
    {
        type = "int-setting",
        name = "underground-belt-max-length",
        setting_type = "startup",
        default_value = 4,
        minimum_value = 2,
        maximum_value = 120,
        order = "ca"
    },
    {
        type = "int-setting",
        name = "fast-underground-belt-max-length",
        setting_type = "startup",
        default_value = 6,
        minimum_value = 2,
        maximum_value = 120,
        order = "cb"
    },
    {
        type = "int-setting",
        name = "express-underground-belt-max-length",
        setting_type = "startup",
        default_value = 8,
        minimum_value = 2,
        maximum_value = 120,
        order = "cc"
    },
    {
        type = "int-setting",
        name = "transport-belt-speed",
        setting_type = "startup",
        default_value = 15,
        minimum_value = 2,
        maximum_value = 240,
        order = "ba"
    },
    {
        type = "int-setting",
        name = "fast-transport-belt-speed",
        setting_type = "startup",
        default_value = 30,
        minimum_value = 4,
        maximum_value = 240,
        order = "bb"
    },
    {
        type = "int-setting",
        name = "express-transport-belt-speed",
        setting_type = "startup",
        default_value = 45,
        minimum_value = 6,
        maximum_value = 240,
        order = "bc"
    }
}

if mods["space-exploration"] then
    data:extend{
        {
            type = "int-setting",
            name = "se-space-pipe-to-ground-max-length",
            setting_type = "startup",
            default_value = 12,
            minimum_value = 2,
            maximum_value = 120,
            order = "ab"
        },
        {
            type = "int-setting",
            name = "se-space-underground-belt-max-length",
            setting_type = "startup",
            default_value = 16,
            minimum_value = 2,
            maximum_value = 120,
            order = "cd"
        },
        {
            type = "int-setting",
            name = "se-deep-space-underground-belt-max-length",
            setting_type = "startup",
            default_value = 34,
            minimum_value = 2,
            maximum_value = 120,
            order = "cg"
        }
    }
end

if mods["Krastorio2"] then
    data:extend{
        {
            type = "int-setting",
            name = "kr-steel-pipe-to-ground-max-length",
            setting_type = "startup",
            default_value = 29,
            minimum_value = 2,
            maximum_value = 120,
            order = "ac"
        },
        {
            type = "int-setting",
            name = "kr-advanced-underground-belt-max-length",
            setting_type = "startup",
            default_value = 29,
            minimum_value = 2,
            maximum_value = 120,
            order = "ce"
        },
        {
            type = "int-setting",
            name = "kr-superior-underground-belt-max-length",
            setting_type = "startup",
            default_value = 39,
            minimum_value = 2,
            maximum_value = 120,
            order = "cf"
        },
        {
            type = "int-setting",
            name = "kr-advanced-transport-belt-speed",
            setting_type = "startup",
            default_value = 60,
            minimum_value = 8,
            maximum_value = 240,
            order = "bd"
        },
        {
            type = "int-setting",
            name = "kr-superior-transport-belt-speed",
            setting_type = "startup",
            default_value = 75,
            minimum_value = 10,
            maximum_value = 240,
            order = "be"
        }
    }
end

if mods["AdvancedBelts"] then
    data:extend{
        {
            type = "int-setting",
            name = "extreme-underground-max-length",
            setting_type = "startup",
            default_value = 10,
            minimum_value = 2,
            maximum_value = 120,
            order = "cg"
        },
        { 
            type = "int-setting",
            name = "ultimate-underground-max-length",
            setting_type = "startup",
            default_value = 12,
            minimum_value = 2,
            maximum_value = 120,
            order = "ch"
        },
        {
            type = "int-setting",
            name = "high-speed-underground-max-length",
            setting_type = "startup",
            default_value = 14,
            minimum_value = 2,
            maximum_value = 120,
            order = "ci"
        },
        {
            type = "int-setting",
            name = "extreme-belt-speed",
            setting_type = "startup",
            default_value = 60,
            minimum_value = 10,
            maximum_value = 240,
            order = "be"
        },
        {
            type = "int-setting",
            name = "ultimate-belt-speed",
            setting_type = "startup",
            default_value = 75,
            minimum_value = 10,
            maximum_value = 240,
            order = "bf"
        },
        {
            type = "int-setting",
            name = "high-speed-belt-speed",
            setting_type = "startup",
            default_value = 90,
            minimum_value = 10,
            maximum_value = 240,
            order = "bg"
        }
    }
end

if mods["exotic-industries"] then
    data:extend{
        {
            type = "int-setting",
            name = "ei_insulated-underground-pipe-max-length",
            setting_type = "startup",
            default_value = 10,
            minimum_value = 2,
            maximum_value = 120,
            order = "ad"
        },
        {
            type = "int-setting",
            name = "ei_neo-underground-max-length",
            setting_type = "startup",
            default_value = 17,
            minimum_value = 2,
            maximum_value = 120,
            order = "cj"
        },
        {
            type = "int-setting",
            name = "ei_neo-belt-speed",
            setting_type = "startup",
            default_value = 90,
            minimum_value = 10,
            maximum_value = 240,
            order = "bh"
        }
    }
end