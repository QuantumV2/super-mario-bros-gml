if(place_meeting(x, y - 8, obj_enemyparent)){
	instance_destroy(instance_place(x, y - 8, obj_enemyparent))	
}
if(place_meeting(x, y - 8, obj_coin)){
	with(instance_place(x, y - 8, obj_coin))
	{
		event_perform(ev_collision, obj_player)	
	}
}
for(var i = -2; i < 3; i++)
{
	if(i != 0)
	{
		with(instance_create_layer(x, y, "Instances", obj_debris))
		{
			hsp = i
		}
	}

}
