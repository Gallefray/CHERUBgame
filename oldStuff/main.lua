require 'extendedMath'

function resources()
	q_wall = love.graphics.newQuad(0, 0, tile.tile, tile.tile, tile.w, tile.h)
	q_grass = love.graphics.newQuad(129, 0, tile.tile, tile.tile, tile.w, tile.h)
	q_player = love.graphics.newQuad(257, 0, 120, 48, tile.w, tile.h)
	q_note = love.graphics.newQuad(385, 0, 64, 72, tile.w, tile.h)

	tileset = love.graphics.newImage("data/tiles/TileSet.png")
	font1 = love.graphics.newFont("data/fonts/uni0553-webfont.ttf", 15)
end

function love.load()
	variables()
	resources()
	require 'animations'
end

function love.update(dt)
	print("")
	controls(dt)
	collisions(dt)
end

function love.draw()
	for each, blade in pairs(grass) do
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.drawq(tileset, q_grass, wall[1], wall[2])
	end
	for each, wall in pairs(walls) do
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.drawq(tileset, q_wall, wall[1], wall[2])
		print(player.y+player.h)
	end
	for every, note in pairs(notes) do
		love.graphics.setColor(255, 255, 255, 255)
		love.graphics.drawq(tileset, q_note, note[1], note[2])
		if note[3] == true then
			love.graphics.setColor(255, 255, 255, 255)
			love.graphics.setFont(font1)
			love.graphics.print("Press 'e' to read", note[1]-25, note[2]-20)
		end
	end

	playerDraw()
end

function variables()
	tile = {}
	tile.w = 1408
	tile.h = 896
	tile.tile = 128
	tile.tileDim = 128

	screen = {}
	screen.w = 1024
	screen.h = 768
	screen.scale = 0 -- 1
	screen.middleW = screen.w/2 -- /screen.scale
	screen.middleH = screen.h/2 -- /screen.scale

	level = 1

	player = {}
	player.moveDirect = "up"
	player.x = 400
	player.y = 300
	player.w = 120 -- /screen.scale
	player.h = 48 -- /screen.scale

	-- ENTITIES:
	walls = {{256, 256}}
	wallW = 128 -- /screen.scale
	wallH = 128 -- /screen.scale

	grass = {}

	doors = {}

	notes = {}
	noteW = 64 -- /screen.scale
	noteH = 72 -- /screen.scale
	table.insert(notes, {72, 72, false, "HALLO WORLD INNIT MUN, INNIT"})
end

function controls(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end 
	if love.keyboard.isDown("w") then
		player.w = 48 -- /screen.scale
		player.h = 120 -- /screen.scale
		player.y = player.y - 100 * dt
		player.moveDirect = "up"

	elseif love.keyboard.isDown("s") then
		player.w = 48 -- /screen.scale
		player.h = 120 -- /screen.scale
		player.y = player.y + 100 * dt
		player.moveDirect = "down"


	elseif love.keyboard.isDown("a") then
		player.w = 120 -- /screen.scale
		player.h = 48 -- /screen.scale
		player.x = player.x - 100 * dt
		player.moveDirect = "left"

	elseif love.keyboard.isDown("d") then
		player.w = 120 -- /screen.scale
		player.h = 48 -- /screen.scale
		player.x = player.x + 100 * dt
		player.moveDirect = "right"
	end
end

function collisions(dt)
	for every, note in pairs(notes) do
		if player.x+player.w > note[1] and player.x < note[1]+noteW and player.y+player.h > note[2] and player.y < note[2]+noteH then
			note[3] = true
		else
			note[3] = false
		end
	end
	for each, wall in pairs(walls) do
		if player.moveDirect == "up" or player.moveDirect == "down" then
			if player.y+player.h > wall[2] and player.y < wall[1]+128 then
				if player.moveDirect == "up" then
					player.y = player.y + 100 * dt

				elseif player.moveDirect == "down" then
					player.y = player.y - 100 * dt
				end
			end
		elseif player.moveDirect == "left" or player.moveDirect == "right" then
			if player.x+player.w > wall[1] and player.x < wall[1]+128 then
				if player.moveDirect == "left" then
					player.x = player.x + 100 * dt

				elseif player.moveDirect == "right" then
					player.x = player.x - 100 * dt
				end
			end
		end
	end
end






























