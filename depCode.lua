if player.moveDirect == "up" then
	player.y = player.y + player.moveSpeed * dt
elseif player.moveDirect == "down" then
	player.y = player.y - player.moveSpeed * dt
elseif player.moveDirect == "left" then
	player.x = player.x + player.moveSpeed * dt
elseif player.moveDirect == "right" then
	player.x = player.x - player.moveSpeed * dt
end