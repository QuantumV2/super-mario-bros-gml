if(!moving || (moving && other.is_jumping && !other.is_dead))
{
	moving = !moving
	hsp = (moving) ? ((other.x <= x) ? 2 : -2) : 0
	if(!moving)
	{
		global.scores[global.luigi] += 100
		with(instance_create_layer(x, y - 8, "Instances", obj_scoreparticle))
		{
			scorenumber = 100
		}	
	}
	else
	{
		audio_play_sound(kick, 10, false)
	}
}
else
{
	scr_player_get_hurt()
}