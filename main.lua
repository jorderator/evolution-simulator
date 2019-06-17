gr = love.graphics
rand = love.math.random
entity_control = require("entity")

function love.load()
	initialise()
end

function initialise()
	food = {}
	entities = {}
	time = 0
	active = false

	make_entities(entities, 10)
end

function make_entities(entity_table, number)
	for i = 1, number do
		local temp_entity = entity_control:create()
		print("x: " .. temp_entity.x .. " y: " .. temp_entity.y)
		table.insert(entity_table, temp_entity)
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

	while #food < math.floor(time + 20) do
		local food_x, food_y = rand(10, window_width - 10), rand(10, window_height - 10)
		table.insert(food, {x = food_x, y = food_y})
	end
end

function love.draw()
	local window_width, window_height = gr.getDimensions()

	gr.setColor(0, 1, 0.2)
	for i, meal in pairs(food) do
		gr.circle("fill", meal.x, meal.y, 5)
	end

	gr.setColor(0.5, 0, 0.5)
	for k, entity in pairs(entities) do
		--print("other x: " .. entity.x .. " y: " .. entity.y)
		gr.circle("fill", entity.x, entity.y, entity.size)
	end
end
