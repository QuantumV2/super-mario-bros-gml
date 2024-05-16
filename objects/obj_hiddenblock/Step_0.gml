if(place_meeting(x, y - 2, obj_player) && obj_player.vsp < 0 && lock == false)
{
	lock = true
	obj_player.y = y + 16 + obj_player.sprite_height
	with(instance_create_layer(x, y, "Instances", obj_questionmarkblock)){
		object = other.object
	}
	instance_destroy()
}