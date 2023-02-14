local glm = require("glm")
local assets = require("assets")
local noise = require("noise")

local ngen = noise.new(1234);
noise.set_crater_chance(ngen, 0.8)
noise.set_crater_layers(ngen, 8)

function generate(tile, out)
	for i = 1, #tile do
		local info = tile[i]

		local crater = 0.0
		local coord = info.coord_3d * 800.0
		local val = noise.crater3(ngen, false, coord:unpack())
		crater = crater + val

		out[i].height = crater * 5000.0
		out[i].color = glm.mix(glm.vec3.new(1.0, 1.0, 1.0), glm.vec3.new(0.0, 0.0, 0.0), 1.0 - crater)
	end
end
