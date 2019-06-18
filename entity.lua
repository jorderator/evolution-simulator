gr = love.graphics
rand = love.math.random

local entity = {}

function entity:create(parent)
	self.__index = self
	local new_entity = setmetatable({}, self)

	if parent ~= nil then
		new_entity.x, new_entity.y = parent.x, parent.y
		new_entity.speed = rand(parent.speed - 30, parent.speed + 30)
		new_entity.sight = rand(parent.sight - 30, parent.sight + 30)
		new_entity.size = rand(parent.size - 2, parent.size + 2)
	else
		local window_width, window_height = gr.getDimensions()
		new_entity.x, new_entity.y = rand(10, window_width - 10), rand(10, window_height - 10)
		new_entity.speed = rand(20, 200)
		new_entity.sight = rand(100, 300)
		new_entity.size = rand(6, 20)
	end

	return new_entity
end

return entity
