if(place_meeting(x, y - 2, obj_player) && obj_player.vsp < 0 && lock == false)
{
	lock = true
	with(obj_player){
		while(place_meeting(x,y,obj_hiddenblock))
			y++
	}
	with(instance_create_layer(x, y, "Instances", obj_questionmarkblock)){
		object = other.object
	}
	instance_destroy()
}