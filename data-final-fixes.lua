require("config")

local function Make_Fake_Fluid(name)
	if name == "heavy-oil" or name == "light-oil" or name == "diesel" then
		local proxy = table.deepcopy(data.raw["item"]["solid-fuel"])
		proxy.name = "Diesel-Locomotive-"..name
		proxy.flags = {"hidden"}
		if FLUID_VALUES[name] then
			proxy.fuel_value = FLUID_VALUES[name].fuel_value
			proxy.fuel_acceleration_multiplier = FLUID_VALUES[name].fuel_acceleration_multiplier
			proxy.fuel_top_speed_multiplier = FLUID_VALUES[name].fuel_top_speed_multiplier
		else
			proxy.fuel_value = FLUID_VALUES["Invalid-Fuel"].fuel_value
			proxy.fuel_acceleration_multiplier = FLUID_VALUES["Invalid-Fuel"].fuel_acceleration_multiplier
			proxy.fuel_top_speed_multiplier = FLUID_VALUES["Invalid-Fuel"].fuel_top_speed_multiplier
		end
		if data.raw["fluid"][name].icon then
			proxy.icon = data.raw["fluid"][name].icon
		else
			proxy.icons = data.raw["fluid"][name].icons
		end
		proxy.stack_size = 4294967295
		proxy.fuel_category = "Diesel-Locomotive-fluid"
		proxy.order = "Diesel-Locomotive-"..name
		proxy.localised_name = {"", {"fluid-name."..name}}
		return proxy
	else 
		return nil
	end
end

local found_diesel = {false,""}
if settings.startup["Diesel-Locomotive-allow-diesel"].value then
	for name,_ in pairs(data.raw["fluid"]) do
		if string.find(string.lower(name), "diesel") then
			found_diesel = {true,name}
			FLUID_VALUES[name] = table.deepcopy(FLUID_VALUES["diesel"])
			break
		end
	end
end

local fake_fluids = {}
local fluid_filter = ""
local new_fake_fluid = nil
if not (settings.startup["Diesel-Locomotive-fuel-type"].value == "both-heavy-light") then
	if found_diesel[1] then
		fluid_filter = found_diesel[2]
	else
		fluid_filter = settings.startup["Diesel-Locomotive-fuel-type"].value
	end
	new_fake_fluid = Make_Fake_Fluid(fluid_filter)
	if new_fake_fluid ~= nil then
		table.insert(fake_fluids, new_fake_fluid)
	end
else
	for name,_ in pairs(data.raw["fluid"]) do
		if name == "heavy-oil" or name == "light-oil" then
			new_fake_fluid = Make_Fake_Fluid(name)
			if new_fake_fluid ~= nil then
				table.insert(fake_fluids, new_fake_fluid)
			end	
		end
	end
end

-- Fluid tanks
local tanks = {}
for i=0,63 do
	local pipe_connections = {}

	if i%64 >= 32 then
		table.insert(pipe_connections, {position = {-1.5, -0.5}})
	end

	if i%32 >= 16 then
		table.insert(pipe_connections, {position = {-1.5, 0.5}})
	end

	if i%16 >= 8 then
		table.insert(pipe_connections, {position = {-1.5, 1.5}})
	end

	if i%8 >= 4 then
		table.insert(pipe_connections, {position = {1.5, -0.5}})
	end

	if i%4 >= 2 then
		table.insert(pipe_connections, {position = {1.5, 0.5}})
	end

	if i%2 >= 1 then
		table.insert(pipe_connections, {position = {1.5, 1.5}})
	end

	local proxy_tank = table.deepcopy(data.raw["storage-tank"]["storage-tank"])
	proxy_tank.name = "Diesel-Locomotive-fluid-locomotive-proxy-tank-"..i
	proxy_tank.icon = "__core__/graphics/empty.png"
	proxy_tank.icon_size = 1
	proxy_tank.icon_mipmaps = 1
	proxy_tank.flags = {"placeable-neutral", "not-on-map"}
	proxy_tank.collision_mask = {}
	proxy_tank.selectable_in_game = false
	proxy_tank.minable = nil
	proxy_tank.next_upgrade = nil  -- Compatibility with other mods altering this value
	proxy_tank.max_health = nil
	proxy_tank.corpse = "small-remnants"
	proxy_tank.collision_box = {{-0.6, -1.6}, {0.6, 1.6}}
	proxy_tank.selection_box = {{-1, -1}, {1, 1}}
	proxy_tank.resistances = {}
	proxy_tank.fluid_box.pipe_covers = nil
	proxy_tank.fluid_box.pipe_connections = pipe_connections
	proxy_tank.fluid_box.base_area = TANK_CAPACITY / 100
	proxy_tank.fluid_box.filter = fluid_filter
	proxy_tank.two_direction_only = false
	proxy_tank.pictures.picture.sheets =
	{
		{
			filename = "__core__/graphics/empty.png",
			frames = 1,
			width = 1,
			height = 1,
			shift = util.by_pixel(0, 0),
			hr_version =
			{
				filename = "__core__/graphics/empty.png",
				frames = 1,
				width = 1,
				height = 1,
				shift = util.by_pixel(0, 0)
			}
		},
		{
			filename = "__core__/graphics/empty.png",
			frames = 1,
			width = 1,
			height = 1,
			shift = util.by_pixel(0, 0),
			hr_version =
			{
				filename = "__core__/graphics/empty.png",
				frames = 1,
				width = 1,
				height = 1,
				shift = util.by_pixel(0, 0)
			}
		}
	}
	proxy_tank.pictures.fluid_background.filename = "__core__/graphics/empty.png"
	proxy_tank.pictures.fluid_background.width = 1
	proxy_tank.pictures.fluid_background.height = 1
	proxy_tank.pictures.window_background.filename = "__core__/graphics/empty.png"
	proxy_tank.pictures.window_background.width = 1
	proxy_tank.pictures.window_background.height = 1
	proxy_tank.pictures.window_background.hr_version.filename = "__core__/graphics/empty.png"
	proxy_tank.pictures.window_background.hr_version.width = 1
	proxy_tank.pictures.window_background.hr_version.height = 1
	proxy_tank.pictures.flow_sprite.filename = "__core__/graphics/empty.png"
	proxy_tank.pictures.flow_sprite.width = 1
	proxy_tank.pictures.flow_sprite.height = 1
	proxy_tank.pictures.gas_flow.filename = "__core__/graphics/empty.png"
	proxy_tank.pictures.gas_flow.width = 1
	proxy_tank.pictures.gas_flow.height = 1
	proxy_tank.pictures.gas_flow.line_length = 1
	proxy_tank.pictures.gas_flow.frame_count = 1
	proxy_tank.pictures.gas_flow.animation_speed = 1
	proxy_tank.pictures.gas_flow.hr_version.filename = "__core__/graphics/empty.png"
	proxy_tank.pictures.gas_flow.hr_version.width = 1
	proxy_tank.pictures.gas_flow.hr_version.height = 1
	proxy_tank.pictures.gas_flow.hr_version.line_length = 1
	proxy_tank.pictures.gas_flow.hr_version.frame_count = 1
	proxy_tank.pictures.gas_flow.hr_version.animation_speed = 1
	proxy_tank.vehicle_impact_sound = nil
	proxy_tank.circuit_wire_connection_points = nil
	proxy_tank.circuit_connector_sprites = nil
	proxy_tank.circuit_wire_max_distance = 0
	proxy_tank.localised_name = "Hidden"
	proxy_tank.order = "Diesel-proxy-tank-"..i

	table.insert(tanks, proxy_tank)
end

data:extend(fake_fluids)
data:extend(tanks)