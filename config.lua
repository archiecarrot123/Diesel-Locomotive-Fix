-- For the values chosen, as of 0.17, solid fuel had its fuel value slashed to 12MJ with an accel mult of 1.2 and top speed mult of 1.05.  10x units of light oil or 20x units of heavy oil make 1 solid fuel, so for minimum balance, light oil should have a fuel value of 1.2MJ and heavy a value of 0.6MJ.  I gave them a little more than that as it makes sense for the conversion process from fluid to solid to have a little energy loss.

FLUID_VALUES = {}

FLUID_VALUES["heavy-oil"] = {  -- Heavy Oil: +0.15MJ fuel value, -0.1 Accel mult, same Top Speed mult
	fuel_value = "0.65MJ",
	fuel_acceleration_multiplier = 1.1,
	fuel_top_speed_multiplier = 1.05
}

FLUID_VALUES["light-oil"] = {  -- Light Oil: +0.15MJ fuel value, same Accel mult, +0.05 Top Speed mult
	fuel_value = "1.35MJ",
	fuel_acceleration_multiplier = 1.2,
	fuel_top_speed_multiplier = 1.1
}

-- For mod added diesel fuels.  This is only a stand-in for the fuel and will be copied into a separate entry with the actual mod added name for the fuel.  It should be noted that if more than one mod adds diesel fuel, only the first one found will be used.
FLUID_VALUES["diesel"] = {  -- Diesel Fuel: +0.2MJ fuel value, same Accel mult, +0.05 Top Speed mult
	fuel_value = "1.4MJ",
	fuel_acceleration_multiplier = 1.2,
	fuel_top_speed_multiplier = 1.1
}

-- For all other "invalid" fuel types
FLUID_VALUES["Invalid-Fuel"] = {
	fuel_value = "4.94065645841247E-324J",
	fuel_acceleration_multiplier = 0,
	fuel_top_speed_multiplier = 0
}

-- This is the tank capacity for the fluid locomotive.  The capacity chosen was to balance with the base locomotive filled with solid fuel: 3 slots x 50 per stack x 10 fluid used per solid fuel = 1500
TANK_CAPACITY = 1500


IDLE_TICK_BUFFER = 70

SLOW_UPDATE_TICK = 30

TICK_UPDATE = true
--[[ if this value is false, the train won't update fuel when idle, only when it is going to arrive or leave train stop.
	Affects performance, turn to false if your game start lagging ]]