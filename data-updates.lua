local function scale_speed(ptype, name, setting)
	local prototype = data.raw[ptype][name]
	if not prototype then return end
	prototype.speed = settings.startup[setting].value * (1+1/3)/10 / 64 --items per second
end

local function scale_undergound_distance(name, setting)
	local prototype = data.raw["underground-belt"][name]
	if not prototype then return end
	if settings.startup["+1-to-underground-length"].value then
		prototype.max_distance = settings.startup[setting].value + 1
	else
		prototype.max_distance = settings.startup[setting].value
	end
end

local function scale_pipe_distance(name, setting)
	local prototype = data.raw["pipe-to-ground"][name]
	if not prototype then return end
	if settings.startup["+1-to-underground-length"].value then
		prototype.fluid_box.pipe_connections[2].max_underground_distance = settings.startup[setting].value + 1
	else
		prototype.fluid_box.pipe_connections[2].max_underground_distance = settings.startup[setting].value
	end
end

local function resort_belt(myitem)
	data.raw["item"][myitem].subgroup = "transport-belt"
	data.raw["transport-belt"][myitem].subgroup = "transport-belt"
end

local function resort_underground(myitem)
	data.raw["item"][myitem].subgroup = "underground-belt"
	data.raw["underground-belt"][myitem].subgroup = "underground-belt"
end

local function resort_splitter(myitem)
	data.raw["item"][myitem].subgroup = "splitter"
	data.raw["splitter"][myitem].subgroup = "splitter"
end

data:extend{
    {
      type = "item-subgroup",
      name = "underground-belt",
      group = "logistics",
      order = "b[belt]-b"
    },
    {
        type = "item-subgroup",
        name = "splitter",
        group = "logistics",
        order = "b[belt]-c"
    }
}

--Vanilla
	--Belt speed
	scale_speed("transport-belt", "transport-belt", "transport-belt-speed")	
	scale_speed("transport-belt", "fast-transport-belt", "fast-transport-belt-speed")
	scale_speed("transport-belt", "express-transport-belt", "express-transport-belt-speed")
	--Underground belt speed
	scale_speed("underground-belt", "underground-belt", "transport-belt-speed")
	scale_speed("underground-belt", "fast-underground-belt", "fast-transport-belt-speed")
	scale_speed("underground-belt", "express-underground-belt", "express-transport-belt-speed")
	--Splitter belt speed
	scale_speed("splitter", "splitter", "transport-belt-speed")
	scale_speed("splitter", "fast-splitter", "fast-transport-belt-speed")
	scale_speed("splitter", "express-splitter", "express-transport-belt-speed")
	--Vanilla Loaders
	scale_speed("loader", "loader", "transport-belt-speed")
	scale_speed("loader", "fast-loader", "fast-transport-belt-speed")
	scale_speed("loader", "express-loader", "express-transport-belt-speed")

	--Underground belt length
	scale_undergound_distance("underground-belt", "underground-belt-max-length")
	scale_undergound_distance("fast-underground-belt", "fast-underground-belt-max-length")
	scale_undergound_distance("express-underground-belt", "express-underground-belt-max-length")

	--Pipe to ground
	scale_pipe_distance("pipe-to-ground", "pipe-to-ground-max-length")

	if mods["aai-loaders"] then --AAi Vanilla Loaders
		--aai loader belt speeds
		scale_speed("loader-1x1", "aai-loader", "transport-belt-speed")
		scale_speed("loader-1x1", "aai-fast-loader", "fast-transport-belt-speed")
		scale_speed("loader-1x1", "aai-express-loader", "express-transport-belt-speed")
	end
	if mods["miniloader"] then --Miniloader Vanilla Loaders
		--miniloader belt speeds
		scale_speed("loader-1x1", "miniloader-loader", "transport-belt-speed")
		scale_speed("loader-1x1", "miniloader-fast-loader", "fast-transport-belt-speed")
		scale_speed("loader-1x1", "miniloader-express-loader", "express-transport-belt-speed")
		scale_speed("loader-1x1", "filter-miniloader-loader", "transport-belt-speed")
		scale_speed("loader-1x1", "filter-miniloader-fast-loader", "fast-transport-belt-speed")
		scale_speed("loader-1x1", "filter-miniloader-express-loader", "express-transport-belt-speed")
	end
	if mods["Krastorio2"] then --Krastorio2 Vanilla loaders
		scale_speed("loader-1x1", "kr-loader", "transport-belt-speed")
		scale_speed("loader-1x1", "kr-fast-loader", "fast-transport-belt-speed")
		scale_speed("loader-1x1", "kr-express-loader", "express-transport-belt-speed")
	end
	if mods["deadlock-beltboxes-loaders"] then --Deadlock stacking belt boxes and laoders https://mods.factorio.com/mod/deadlock-beltboxes-loaders/changelog
		scale_speed("loader-1x1", "transport-belt-loader", "transport-belt-speed")
		scale_speed("loader-1x1", "fast-transport-belt-loader", "fast-transport-belt-speed")
		scale_speed("loader-1x1", "express-transport-belt-loader", "express-transport-belt-speed")
	end
	if mods["exotic-industries-loaders"] then --Exotic Industries loaders
		scale_speed("loader-1x1", "ei_loader", "transport-belt-speed")
		scale_speed("loader-1x1", "ei_fast-loader", "fast-transport-belt-speed")
		scale_speed("loader-1x1", "ei_express-loader", "express-transport-belt-speed")
	end



	if settings.startup["belt-resort"].value then
		--underground belts
		resort_underground("underground-belt")
		resort_underground("fast-underground-belt")
		resort_underground("express-underground-belt")
		--splitters
		resort_splitter("splitter")
		resort_splitter("fast-splitter")
		resort_splitter("express-splitter")
	end

if mods["space-exploration"] then --Space Exploration
	local deepSpaceVariants = {"black","blue","cyan","green","magenta","red","white","yellow"}
		-- Set fast_replaceable_group for space transport belt, underground transport belt and splitter, deep space belt, and variants
	data.raw["transport-belt"]["se-space-transport-belt"].fast_replaceable_group = "transport-belt"
	data.raw["underground-belt"]["se-space-underground-belt"].fast_replaceable_group = "transport-belt"
	data.raw["splitter"]["se-space-splitter"].fast_replaceable_group = "transport-belt"
	for _, variant in pairs(deepSpaceVariants) do
		if data.raw["transport-belt"]["se-deep-space-transport-belt-" .. variant] then
			data.raw["transport-belt"]["se-deep-space-transport-belt-" .. variant].fast_replaceable_group = "transport-belt"
		end

		if data.raw["splitter"]["se-deep-space-splitter-" .. variant] then
			data.raw["splitter"]["se-deep-space-splitter-" .. variant].fast_replaceable_group = "transport-belt"
		end

		if data.raw["underground-belt"]["se-deep-space-underground-belt-" .. variant] then
			data.raw["underground-belt"]["se-deep-space-underground-belt-" .. variant].fast_replaceable_group = "transport-belt"
		end
	end
	
	--Pipe to ground length
	scale_pipe_distance("se-space-pipe-to-ground", "se-space-pipe-to-ground-max-length")
	
	--Space belt speed
	--Space exploration handles Deep Space belt speeds
	scale_speed("transport-belt", "se-space-transport-belt", "express-transport-belt-speed")
	scale_speed("underground-belt", "se-space-underground-belt", "express-transport-belt-speed")
	scale_speed("splitter", "se-space-splitter", "express-transport-belt-speed")
	if mods["aai-loaders"] then --AAi loaders
		scale_speed("loader-1x1", "aai-se-space-loader", "express-transport-belt-speed")
	end
	if mods["Krastorio2"] then --Krastorio2 loaders
		scale_speed("loader-1x1", "kr-se-loader", "express-transport-belt-speed")
	end
	if mods["miniloader"] then --miniloaders
		scale_speed("loader-1x1", "space-miniloader-loader", "express-transport-belt-speed")
		scale_speed("loader-1x1", "space-filter-miniloader-loader", "express-transport-belt-speed")
	end
	if mods["deadlock-beltboxes-loaders"] then
		scale_speed("loader-1x1", "se-space-transport-belt-loader", "express-transport-belt-speed")
	end
	--Underground length
	scale_undergound_distance("se-space-underground-belt", "se-space-underground-belt-max-length")
	if settings.startup["belt-resort"].value then
		--underground belts
		resort_underground("se-space-underground-belt")
		--splitters
		resort_splitter("se-space-splitter")
	end
	--Deep space length
	for _, variant in pairs(deepSpaceVariants) do
		if data.raw["underground-belt"]["se-deep-space-underground-belt-" .. variant] then
			scale_undergound_distance("se-deep-space-underground-belt-" .. variant, "se-deep-space-underground-belt-max-length")
		end
	end
end

if mods["Krastorio2"] then --Krastorio2
	--Belt speed
	scale_speed("transport-belt", "kr-advanced-transport-belt", "kr-advanced-transport-belt-speed")
	scale_speed("transport-belt", "kr-superior-transport-belt", "kr-superior-transport-belt-speed")
	--Underground belt speed
	scale_speed("underground-belt", "kr-advanced-underground-belt", "kr-advanced-transport-belt-speed")
	scale_speed("underground-belt", "kr-superior-underground-belt", "kr-superior-transport-belt-speed")
	--Splitter belt speed
	scale_speed("splitter", "kr-advanced-splitter", "kr-advanced-transport-belt-speed")
	scale_speed("splitter", "kr-superior-splitter", "kr-superior-transport-belt-speed")
	--Underground length
	scale_undergound_distance("kr-advanced-underground-belt", "kr-advanced-underground-belt-max-length")
	scale_undergound_distance("kr-superior-underground-belt", "kr-superior-underground-belt-max-length")
	--Pipe to ground length
	scale_pipe_distance("kr-steel-pipe-to-ground", "kr-steel-pipe-to-ground-max-length")
	--Loader belt speed
	scale_speed("loader-1x1", "kr-advanced-loader", "kr-advanced-transport-belt-speed")
	scale_speed("loader-1x1", "kr-superior-loader", "kr-superior-transport-belt-speed")

	if mods["aai-loaders"] then --AAi krastorio2 loader belt speed
		scale_speed("loader-1x1", "aai-kr-advanced-loader", "kr-advanced-transport-belt-speed")
		scale_speed("loader-1x1", "aai-kr-superior-loader", "kr-superior-transport-belt-speed")
	end
	if mods["miniloader"] then --miniloader Krastorio2 loader belt speed
		scale_speed("loader-1x1", "miniloader-advanced-loader", "kr-advanced-transport-belt-speed")
		scale_speed("loader-1x1", "filter-miniloader-advanced-loader", "kr-advanced-transport-belt-speed")
		scale_speed("loader-1x1", "miniloader-superior-loader", "kr-superior-transport-belt-speed")
		scale_speed("loader-1x1", "filter-miniloader-superior-loader", "kr-superior-transport-belt-speed")
	end
	if mods["deadlock-beltboxes-loaders"] then --Deadlock stacking belt boxes and loaders https://mods.factorio.com/mod/deadlock-beltboxes-loaders/changelog
		scale_speed("loader-1x1", "kr-advanced-transport-belt-loader", "kr-advanced-transport-belt-speed")
		scale_speed("loader-1x1", "kr-superior-transport-belt-loader", "kr-superior-transport-belt-speed")
	end

	--sorting
	if mods["boblogistics"] then
		return
	else
		if settings.startup["belt-resort"].value then
			--underground belts
			resort_underground("kr-advanced-underground-belt")
			resort_underground("kr-superior-underground-belt")
			--splitters
			resort_splitter("kr-advanced-splitter")
			resort_splitter("kr-superior-splitter")
		end
	end
end

if mods["AdvancedBelts"] then --Advanced Belts
	--Belts Speed
	scale_speed("transport-belt", "extreme-belt", "extreme-belt-speed")
	scale_speed("transport-belt", "ultimate-belt", "ultimate-belt-speed")
	scale_speed("transport-belt", "high-speed-belt", "high-speed-belt-speed")
	--Underground Speed
	scale_speed("underground-belt", "extreme-underground", "extreme-belt-speed")
	scale_speed("underground-belt", "ultimate-underground", "ultimate-belt-speed")
	scale_speed("underground-belt", "high-speed-underground", "high-speed-belt-speed")
	--Splitters Speed
	scale_speed("splitter", "extreme-splitter", "extreme-belt-speed")
	scale_speed("splitter", "ultimate-splitter", "ultimate-belt-speed")
	scale_speed("splitter", "high-speed-splitter", "high-speed-belt-speed")
	--Underground length
	scale_undergound_distance("extreme-underground", "extreme-underground-max-length")
	scale_undergound_distance("ultimate-underground", "ultimate-underground-max-length")
	scale_undergound_distance("high-speed-underground", "high-speed-underground-max-length")

	if mods["aai-loaders"] then --AAi loaders Speed
		scale_speed("loader-1x1", "aai-extreme-loader", "extreme-belt-speed")
		scale_speed("loader-1x1", "aai-ultimate-loader", "ultimate-belt-speed")
		scale_speed("loader-1x1", "aai-high-speed-loader", "high-speed-belt-speed")
	end
	if settings.startup["belt-resort"].value then
		--underground belts
		resort_underground("extreme-underground")
		resort_underground("ultimate-underground")
		resort_underground("high-speed-underground")
		--splitters
		resort_splitter("extreme-splitter")
		resort_splitter("ultimate-splitter")
		resort_splitter("high-speed-splitter")
		
		if mods["space-exploration"] then
			resort_belt("extreme-belt")
			resort_belt("ultimate-belt")
			resort_belt("high-speed-belt")
		end
	end
end

if mods["exotic-industries"] then --Exotic Industries 
	--Belt Speed
	scale_speed("transport-belt", "ei_neo-belt", "ei_neo-belt-speed")
	--Underground Speed
	scale_speed("underground-belt", "ei_neo-underground-belt", "ei_neo-belt-speed")
	--Splitter Speed
	scale_speed("splitter", "ei_neo-splitter", "ei_neo-belt-speed")

	--Underground length
	scale_undergound_distance("ei_neo-underground-belt", "ei_neo-underground-max-length")

	--Underground Pipe length
	scale_pipe_distance("ei_insulated-underground-pipe", "ei_insulated-underground-pipe-max-length")

	if mods["exotic-industries-loaders"] then --Loader Speed
	scale_speed("loader-1x1", "ei_neo-loader", "ei_neo-belt-speed")
	end
	if settings.startup["belt-resort"].value then
		--underground belts
		resort_underground("ei_neo-underground-belt")
		--splitters
		resort_splitter("ei_neo-splitter")
	end
end