var door = asset_get_index("obj_door" + string(target_door))
if(instance_exists(door))
{
	x = door.x
	y = (door.y + 8) - sprite_height
}
target_door = "A"
big = global.powerup[global.luigi]