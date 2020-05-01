-- Make a copy of the base game's locomotive, then make the needed changes for this mod
local fluid_locomotive = table.deepcopy(data.raw["locomotive"]["locomotive"])
fluid_locomotive.name = "Diesel-Locomotive-fluid-locomotive"
fluid_locomotive.icon = "__Diesel-Locomotive-Fix__/graphics/icons/diesel-locomotive.png"
fluid_locomotive.minable.result = "Diesel-Locomotive-fluid-locomotive"
fluid_locomotive.burner.fuel_category = "Diesel-Locomotive-fluid"
fluid_locomotive.burner.fuel_inventory_size = 1
fluid_locomotive.color = {r = 1, g = 0.73, b = 0.07, a = 0.5}

local new_pictures_layers = 
{
	{
		slice = 4,
		priority = "very-low",
		width = 346,
		height = 248,
		direction_count = 256,
		allow_low_quality_rotation = true,
		filenames = {
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-01.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-02.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-03.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-04.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-05.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-06.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-07.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-08.png"
		},
		line_length = 4,
		lines_per_file = 8,
		shift = {1, -0.45},
	},
	{
		priority = "very-low",
		flags = { "mask" },
		slice = 4,
		width = 346,
		height = 248,
		direction_count = 256,
		allow_low_quality_rotation = true,
		filenames = {
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-mask-01.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-mask-02.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-mask-03.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-mask-04.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-mask-05.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-mask-06.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-mask-07.png",
			"__Diesel-Locomotive-Fix__/graphics/diesel-locomotive/diesel-locomotive-mask-08.png"
		},
		line_length = 4,
		lines_per_file = 8,
		shift = {1, -0.45},
		apply_runtime_tint = true,
	},
	{
		priority = "very-low",
		flags = { "shadow" },
		width = 253,
		height = 212,
		direction_count = 256,
		draw_as_shadow = true,
		allow_low_quality_rotation = true,
		filenames = {
			"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-01.png",
			"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-02.png",
			"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-03.png",
			"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-04.png",
			"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-05.png",
			"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-06.png",
			"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-07.png",
			"__base__/graphics/entity/diesel-locomotive/diesel-locomotive-shadow-08.png"
		},
		line_length = 4,
		lines_per_file = 8,
		shift = {1, 0.3}
	}
}

if settings.startup["Diesel-Locomotive-swap-graphics"].value then
	data.raw["locomotive"]["locomotive"].pictures.layers = new_pictures_layers
else
	fluid_locomotive.pictures.layers = new_pictures_layers
end

-- Add new locomotive to the game
data:extend({fluid_locomotive})
