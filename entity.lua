gr = love.graphics
rand = love.math.random

local entity = {
	time = 0,
	energy = 100,
	speed_range = {
		min = 20,
		max = 70
	},
	sight_range = {
		min = 50,
		max = 150
	},
	size_range = {
		min = 6,
		max = 20
	}
}

function entity:create(parent)
	self.__index = self
	local new_entity = setmetatable({}, self)

	new_entity.angle = rand(0, 3.14)
	new_entity.time = 0

	if parent ~= nil then
		new_entity.x, new_entity.y = parent.x, parent.y
		new_entity.speed = rand(parent.speed - 30, parent.speed + 30)
		new_entity.sight = rand(parent.sight - 30, parent.sight + 30)
		new_entity.size = rand(parent.size - 2, parent.size + 2)
		new_entity.energy = 100 + parent.energy / 5
	else
		local window_width, window_height = gr.getDimensions()
		new_entity.x, new_entity.y = rand(10, window_width - 10), rand(10, window_height - 10)
		new_entity.speed = rand(self.speed_range.min, self.speed_range.max)
		new_entity.sight = rand(self.sight_range.min, self.sight_range.max)
		new_entity.size = rand(self.size_range.min, self.size_range.max)
	end

	return new_entity
end

function entity:update(time)
	closest_food = {-1, -1}
	for i = 1, #food do
		local distance = ((self.x - food[i].x)^2 + (self.y - food[i].y)^2)^0.5

		if distance <= self.sight and (closest_food[1] == -1 or distance < closest_food[2]) then
			closest_food = {i, distance}
		end
	end

	local dt = time - self.time
	if closest_food[1] ~= -1 then
		if closest_food[2] > self.speed * dt then
			self.angle = math.atan2((food[closest_food[1]].y - self.y), (food[closest_food[1]].x - self.x))
			local distance_x = self.speed * math.cos(self.angle)
			local distance_y = self.speed * math.sin(self.angle)
			self.x = self.x + (distance_x * dt)
			self.y = self.y + (distance_y * dt)
		else
			--self.x = food[closest_food[1]].x
			--self.y = food[closest_food[1]].y
		end

		if closest_food[2] < self.size then
			self:eat(closest_food[1])
		end
	else
		local choice = rand(0, self.time % 3)

		if choice > 2 then
			self.angle = self.angle + rand(-100, 100) / 100
		end

		local distance_x = self.speed * math.cos(self.angle)
		local distance_y = self.speed * math.sin(self.angle)
		self.x = self.x + (distance_x * dt)
		self.y = self.y + (distance_y * dt)
	end

	local window_width, window_height = gr.getDimensions()
	if self.x < 0 then self.x = 0
	elseif self.x > window_width then self.x = window_width
	end
	if self.y < 0 then self.y = 0
	elseif self.y > window_height then self.y = window_height 
	end

	if math.floor(self.time) < math.floor(time) and active then
		if self.energy > 150 then
			table.insert(entities, self:create(self))
			self.energy = self.energy - 4
		end

		self.energy = self.energy - (self.speed / 15 + self.sight / 30 + self.size^2 / 45)
	end

	self.time = time
end

function entity:eat(index)
	table.remove(food, index)
	self.energy = self.energy + 50
end

function entity:colour()
	local r = (((self.speed - self.speed_range.min) / (self.speed_range.max - self.speed_range.min)) + 0.2) / 1.2
	local g = (((self.sight - self.sight_range.min) / (self.sight_range.max - self.sight_range.min)) + 0.2) / 1.2
	local b = (((self.size - self.size_range.min) / (self.size_range.max - self.size_range.min)) + 0.2) / 1.2
	return r, g, b
end

return entity
