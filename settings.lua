data:extend({
	{
		type = "bool-setting",
		name = "Diesel-Locomotive-swap-graphics",
		description = "Diesel-Locomotive-swap-graphics",
		setting_type = "startup",
		default_value = true,
		order = "a"
	},
	{
		type = "string-setting",
		name = "Diesel-Locomotive-fuel-type",
		description = "Diesel-Locomotive-fuel-type",
		setting_type = "startup",
		allowed_values = {"both-heavy-light","heavy-oil","light-oil"},
		default_value = "both-heavy-light",
		order = "b"
	},
	{
		type = "bool-setting",
		name = "Diesel-Locomotive-allow-diesel",
		description = "Diesel-Locomotive-allow-diesel",
		setting_type = "startup",
		default_value = true,
		order = "c"
	}
})