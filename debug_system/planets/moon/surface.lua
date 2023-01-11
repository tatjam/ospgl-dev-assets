local glm = require("glm")
local assets = require("assets")
local noiseg = require("noise")

local ngen = noiseg.new(1234);

function generate(tile, out)

	for i = 1, #tile do
		local info = tile[i]

		local noisyness = ngen:get_perlin((info.coord_3d * 10.0):unpack())
		local noise0 = ngen:get_perlin_fractal((info.coord_3d * 1000.0):unpack())


		out[i].height = noise0 * 5000.0 * glm.abs(noisyness);
		out[i].color = glm.vec3.new(0.3, 0.3, 0.3);
	end

end

