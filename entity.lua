gr = love.graphics
rand = love.math.random

local entity = {
	speed_range = {
		min = 20,
		max = 200
	},
	sight_range = {
		min = 100,
		max = 300
	},
	size_range = {
		min = 6,
		max = 20
	}
}

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
		new_entity.speed = rand(self.speed_range.min, self.speed_range.max)
		new_entity.sight = rand(self.sight_range.min, self.sight_range.max)
		new_entity.size = rand(self.size_range.min, self.size_range.max)
	end

	return new_entity
end

function entity:colour()
	local r = ((self.speed - self.speed_range.min) / (self.speed_range.max - self.speed_range.min) - 0.2) / 0.8
	local g = ((self.sight - self.sight_range.min) / (self.sight_range.max - self.sight_range.min) - 0.2) / 0.8
	local b = ((self.size - self.size_range.min) / (self.size_range.max - self.size_range.min) - 0.2) / 0.8
	return r, g, b
end

return entity
