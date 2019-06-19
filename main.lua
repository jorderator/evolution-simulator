gr = love.graphics
rand = love.math.random
entity_control = require("entity")

function love.load()
	properties = {
		initial_entities = 10,
		food_ratio = 200
	}

	initialise()
end

function initialise()
	local window_width, window_height = gr.getDimensions()

	food = {}
	entities = {}
	time = 0
	active = false

	properties.food_amount = math.floor((window_width / properties.food_ratio) * (window_height / properties.food_ratio))

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
end

function love.update(dt)
	local window_width, window_height = gr.getDimensions()
	if active then time = time + dt end

	while #food < math.floor(time * (properties.food_amount / 40) + properties.food_amount) do
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
