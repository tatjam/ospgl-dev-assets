local glm = require("glm")
local assets = require("assets")
local noise = require("noise")

local fn = noise.new(10545)
noise.set_fractal_gain(fn, 0.64)
noise.set_frequency(fn, 0.15)
noise.set_fractal_octaves(fn, 14)

local grass = glm.vec3.new(0.196, 0.275, 0.027)
local grass1 = glm.vec3.new(0.347, 0.420, 0.255)
local desert = glm.vec3.new(0.480, 0.347, 0.255)
local snow = glm.vec3.new(0.5, 0.5, 0.5)
local rock = glm.vec3.new(0.298, 0.373, 0.288)

function continent_generator(coord)
    noise.set_fractal_octaves(fn, 5)
	return noise.perlin_fractal3(fn, (coord * 80.0):unpack())
end

function mountain_generator(coord)
    noise.set_fractal_octaves(fn, 5)
    local hs = noise.perlin_fractal3(fn, (coord * 270.0):unpack())
    return math.pow(hs, 4.0) * 25.0
end

function generate(tile, out)

	for i = 1, #tile do
		local info = tile[i]

		local continents = continent_generator(info.coord_3d)
		local mountain = mountain_generator(info.coord_3d)
		local h = continents * 15000.0 + mountain * 8000.0 - 2591.0

		local rmix = noise.perlin3(fn, (info.coord_3d * 100.0):unpack()) +
			noise.perlin3(fn, (info.coord_3d * 4000.0):unpack()) * 0.25;
		rmix = (rmix + 1.0) * 0.5;

		out[i].height = h + 2000.0
		out[i].color = grass * rmix + desert * (1.0 - rmix)
 	end
end

