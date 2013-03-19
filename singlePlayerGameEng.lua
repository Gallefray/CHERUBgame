function drawMainGame()
	for each, wall in pairs(walls) do  -- Look into sprite batches?
		love.graphics.setColor(0, 0, 255, 255)
		love.graphics.rectangle("fill", wall[1], wall[2], 32, 32)
	end
	for each, note in pairs(notes) do
		love.graphics.setColor(255, 0, 255, 255) -- eh, tried to make it yellow. Pink will have to do :P
		love.graphics.rectangle("fill", note[1], note[2], 32, 32)
		if note[3] == 1 then
			love.graphics.setColor(255, 255, 255, 255)
			love.graphics.print("Press 'e' to read", note[1]-64, note[2]-32)
		elseif note[3] == 2 then
			diagText = note[4]
		end
	end

	-- player
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
	if not string.find(diagText, "END") then
		dialog(diagText)
	end
end

function gameLogic(dt)
end


function gameControls(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end

	if player.dialogOn == false then
		if love.keyboard.isDown("lshift") then
			player.moveSpeed = 128
		else
			player.moveSpeed = 64
		end

		if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
			player.y = player.y - player.moveSpeed * dt
			player.moveDirect = "up"
		end
		if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
			player.y = player.y + player.moveSpeed * dt
			player.moveDirect = "down"
		end
		if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
			player.x = player.x - player.moveSpeed * dt
			player.moveDirect = "left"
		end
		if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
			player.x = player.x + player.moveSpeed * dt
			player.moveDirect = "right"
		end
		if love.keyboard.isDown("e") then
			for each, note in pairs(notes) do
				if note[3] == 1 then
					note[3] = 2
					player.dialogOn = true
				end
			end
		end
	end

	function love.keypressed(drunkenKey)
		if drunkenKey == "return" then
			print("WOOWOOOWOOOWOOOWOO")
			diagText = "END"
			player.dialogOn = false
		end
	end
end

function collisions(dt)
	if player.dialogOn == false then
		for each, wall in pairs(walls) do
			-- print("running")
			if player.y < wall[2]+32 and player.y+32 > wall[2] and player.x < wall[1]+32 and player.x+32 > wall[1] then
				if player.y <= wall[2]+16 then
					player.y = player.y - player.moveSpeed * dt
				elseif player.y >= wall[2]+16 then
					player.y = player.y + player.moveSpeed * dt
				end
				if player.x <= wall[1]+16 then
					player.x = player.x - player.moveSpeed * dt
				elseif player.x >= wall[1]+16 then
					player.x = player.x + player.moveSpeed * dt
				end
			end
		end
		for each, note in pairs(notes) do
			if note ~= 2 then
				if player.y < note[2]+32 and player.y+32 > note[2] and player.x < note[1]+32 and player.x+32 > note[1] then
						note[3] = 1
				else
					note[3] = 0
				end
			end
		end
	end
end

function dialog(...)
	player.dialogOn = true
	-- blank out the peripheral background
	love.graphics.setColor(0, 0, 0, 225)
	love.graphics.rectangle("fill", 0, 0, screen.w, screen.h)

	love.graphics.setColor(0, 0, 255, 75)
	love.graphics.rectangle("fill", screen.w/5, screen.h/5, screen.w/1.8, screen.h/1.8)

	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print(..., screen.w/4.5, screen.h/4.5)
end