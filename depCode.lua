if player.moveDirect == "up" then
	player.y = player.y + player.moveSpeed * dt
elseif player.moveDirect == "down" then
	player.y = player.y - player.moveSpeed * dt
elseif player.moveDirect == "left" then
	player.x = player.x + player.moveSpeed * dt
elseif player.moveDirect == "right" then
	player.x = player.x - player.moveSpeed * dt
end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if player.y <= wall[2]+16 then
	player.y = player.y - player.moveSpeed * NOM
elseif player.y >= wall[2]+16 then
	player.y = player.y + player.moveSpeed * NOM
end
if player.x <= wall[1]+16 then
	player.x = player.x - player.moveSpeed * NOM
elseif player.x >= wall[1]+16 then
	player.x = player.x + player.moveSpeed * NOM
end

====================================================================================================

-- All of this code could probably be optimised by having:
-- ...
if player.direct.up == true and player.direct.right == true then
	player.y = player.y + player.moveSpeed * NOM
	player.x = player.x - player.moveSpeed * NOM

elseif player.direct.up == true and player.direct.left == true then
	player.y = player.y + player.moveSpeed * NOM
	player.x = player.x + player.moveSpeed * NOM

elseif player.direct.left == false and player.direct.right == false and player.direct.up == true then
	player.y = player.y + player.moveSpeed * NOM

elseif player.direct.down == true and player.direct.right == true then
	player.y = player.y - player.moveSpeed * NOM
	player.x = player.x - player.moveSpeed * NOM

elseif player.direct.down == true and player.direct.left == true then
	player.y = player.y - player.moveSpeed * NOM
	player.x = player.x + player.moveSpeed * NOM

elseif player.direct.left == false and player.direct.right == false and player.direct.down == true then
	player.y = player.y - player.moveSpeed * NOM

elseif player.direct.left == true and player.direct.right == false and player.direct.down == true then

end

000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
