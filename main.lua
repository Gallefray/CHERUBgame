function resources()
	font1 = love.graphics.newFont("data/fonts/uni0553-webfont.ttf", 20)
end

function love.load()
	resources()
	variables()
	require 'singlePlayerGameEng'
end

function love.update(dt)
	if level == 1 then
		gameLogic(dt)
		gameControls(dt)
		collisions(dt)
	end
end

function love.draw()
	love.graphics.setFont(font1)
	if level == 1 then
		drawMainGame()
	end
end

function variables()
	level = 1

	screen = {}
	screen.scale = 0
	screen.w = 800 -- /screen.scale -- 1024
	screen.h = 600 -- /screen.scale -- 768

	player = {}
	player.x = 400
	player.y = 300
	player.w = 32
	player.h = 32
	player.moveDirect = "up"
	player.moveSpeed = 64
	player.inventory = {}
	player.dialogOn = false

	diagText = "END"

	-- ent's
	walls = {{256, 256}}
	notes = {{128, 128, 0, "NOTEYNOTEY UGUU~"}}
end
