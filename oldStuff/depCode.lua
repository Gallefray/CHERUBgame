love.graphics.rectangle("fill", player.x, player.y, 8, 4)
love.graphics.rectangle("fill", wall[1], wall[2], 32, 32)

============================================================
elseif player.moveDirect == "upAndRight" then
	q_player:setViewport(257, 0, 120, 48)
	love.graphics.drawq(tileset, q_player, player.x-10, player.y+10, 0.785398163)

elseif player.moveDirect == "upAndLeft" then
	q_player:setViewport(257, 0, 120, 48)
	love.graphics.drawq(tileset, q_player, player.x-10, player.y+10, 2.53072742)

elseif player.moveDirect == "downAndRight" then
	q_player:setViewport(257, 0, 120, 48)
	love.graphics.drawq(tileset, q_player, player.x+10, player.y-10, 2.53072742)

elseif player.moveDirect == "downAndLeft" then
	q_player:setViewport(257, 128, 120, 48)
	love.graphics.drawq(tileset, q_player, player.x+10, player.y-10, 0.785398163)
end
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if love.keyboard.isDown("w") and love.keyboard.isDown("a") then
	player.y = player.y - 100 * dt
	player.x = player.x - 100 * dt
	player.moveDirect = "upAndLeft"

elseif love.keyboard.isDown("w") and love.keyboard.isDown("d") then
	player.y = player.y - 100 * dt
	player.x = player.x + 100 * dt
	player.moveDirect = "upAndRight"

elseif love.keyboard.isDown("s") and love.keyboard.isDown("a") then
	player.y = player.y + 100 * dt
	player.x = player.x - 100 * dt
	player.moveDirect = "downAndLeft"

elseif love.keyboard.isDown("s") and love.keyboard.isDown("d") then
	player.y = player.y + 100 * dt
	player.x = player.x + 100 * dt
	player.moveDirect = "downAndRight"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
elseif player.moveDirect == "upAndLeft" then
	player.y = player.y + 100 * dt
	player.x = player.x + 100 * dt

elseif player.moveDirect == "upAndRight" then
	player.y = player.y + 100 * dt
	player.x = player.x - 100 * dt

elseif player.moveDirect == "downAndLeft" then
	player.y = player.y - 100 * dt
	player.x = player.x + 100 * dt

elseif player.moveDirect == "downAndRight" then
	player.y = player.y - 100 * dt
	player.x = player.x - 100 * dt
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- YE OLDE COLLISIONS!
if player.moveDirect == "up" or player.moveDirect == "down" then -- weirder and weirder...
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
