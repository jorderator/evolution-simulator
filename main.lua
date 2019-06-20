gr = love.graphics
rand = love.math.random
entity_control = require("entity")

function love.load()
	properties = {
		initial_entities = 10,
		food_ratio = 200,
		food_growth = 10,
	}

	initialise()
end

function initialise()
	local window_width, window_height = gr.getDimensions()

	food = {}
	entities = {}
	time = 0
	active = false
	time_multiplier = 1

	properties.food_amount = math.floor((window_width / properties.food_ratio) * (window_height / properties.food_ratio))
	for i = 1, properties.food_amount do
		local food_x, food_y = rand(10, window_width - 10), rand(10, window_height - 10)
		table.insert(food, {x = food_x, y = food_y})
	end

	make_entities(properties.initial_entities)
end

function make_entities(number)
	for i = 1, number do
		local temp_entity = entity_control:create()
		table.insert(entities, temp_entity)
	end
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit(0)
	end
	if key == "r" then
		initialise()
	end
	if key == "space" then
		active = not active
	end
	if key == "." then
		time_multiplier = time_multiplier + 0.5
	end
	if key == "," then
		time_multiplier = time_multiplier - 0.5
	end
	if key == "/" then
		time_multiplier = 1
	end
end

function love.update(dt)
	local window_width, window_height = gr.getDimensions()
	if active then 
		dt = dt * time_multiplier
		time = time + dt 
	end

	for i, entity in pairs(entities) do
		entity:update(time)
	end

	if math.floor((time - dt) * (properties.food_amount / properties.food_growth)) < math.floor(time * (properties.food_amount / properties.food_growth)) and active then
		local food_x, food_y = rand(10, window_width - 10), rand(10, window_height - 10)
		table.insert(food, {x = food_x, y = food_y})
	end
end

function love.draw()
	local window_width, window_height = gr.getDimensions()

	gr.setColor(0, 1, 0.2)
	for i, meal in pairs(food) do
		gr.circle("line", meal.x, meal.y, 5)
	end

	for k, entity in pairs(entities) do
		gr.setColor(entity:colour())
		gr.circle("fill", entity.x, entity.y, entity.size)
	end
end
