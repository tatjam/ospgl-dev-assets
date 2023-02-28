require("game_database")

local locale =
{
{"en", "es"},
-- Manufacturers
{"rocket_factory", "Rocket Factory", "Rocket Factory"},
-- Parts
{"capsule_name", "Comfy Room Mk. 1", "Sala cómoda Mk. 1"},
{"capsule_description",
    "Allows a single crew member to enjoy space",
    "Permite a una sola persona disfrutar del espacio exterior"},

{"decoupler_name", "BC1", "BC1"},
{"decoupler_description",
    "Explodes in a controlled manner, separating the vehicle",
    "Su explosión controlada permite la separación del vehículo"},

{"engine_name", "FS1", "FS1"},
{"engine_description",
    "Allows intake of propellants, mixing and igniting them, to produce thrust",
    "Genera empuje gracias a la entrada y combustión de combustibles"},

{"fuel_tank_name", "FC1", "FC1"},
{"fuel_tank_description",
    "Stores arbitrary liquids or gases. Contains two internal tanks, meant to kept oxidizer and fuel separated",
    "Almacena líquidos y gases en dos tanque separados, pensados para mantener el comustible y oxidante fuera de contacto"},

{"rcs_block_name", "ME1", "ME1"},
{"rcs_block_description",
    "A module with many engines attached to it for attitude control in the vacuum of space",
    "Un modulo con varios motores para permitir el control del vehículo en el vacío"},
}

function load(database)
	
	database:add_part("parts/capsule/part_capsule.toml")
	database:add_part("parts/engine/part_engine.toml")
	database:add_part("parts/fuel_tank/part_fuel_tank.toml")
	database:add_part("parts/rcs_block/part_rcs_block.toml")
	database:add_part("parts/decoupler/part_decoupler.toml")

	database:load_locale(locale)

end 
