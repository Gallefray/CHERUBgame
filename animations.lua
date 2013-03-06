
function playerDraw()
	love.graphics.setColor(255, 255, 255, 255)
	if player.moveDirect == "up" then -- or player.moveDirect == "upAndLeft" or player.moveDirect == "upAndRight" 
		q_player:setViewport(257, 0, 120, 48)
		love.graphics.drawq(tileset, q_player, player.x, player.y)
		-- player.w = 80 /screen.scale
		-- player.h = 48 /screen.scale

	elseif player.moveDirect == "down" then -- or player.moveDirect == "downAndLeft" or player.moveDirect == "downAndRight"
		q_player:setViewport(257, 128, 120, 48)
		love.graphics.drawq(tileset, q_player, player.x, player.y)
		-- player.w = 80 /screen.scale
		-- player.h = 48 /screen.scale

	elseif player.moveDirect == "left" then -- or player.moveDirect == "upAndLeft" or player.moveDirect == "downAndLeft" 
		q_player:setViewport(257, 256, 48, 120)
		love.graphics.drawq(tileset, q_player, player.x, player.y-30)
		-- player.w = 48 /screen.scale
		-- player.h = 80 /screen.scale

	elseif player.moveDirect == "right" then -- or player.moveDirect == "upAndRight" or player.moveDirect == "downAndRight" 
		q_player:setViewport(257, 384, 48, 120)
		love.graphics.drawq(tileset, q_player, player.x, player.y-30)
		-- player.w = 48 /screen.scale
		-- player.h = 80 /screen.scale
	end	
end