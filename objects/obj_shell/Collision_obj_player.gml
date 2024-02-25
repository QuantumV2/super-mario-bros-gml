if(!moving || (moving && other.is_jumping && !other.is_dead))
{
	moving = !moving
	x += image_xscale * 2
	hsp = (moving) ? ((other.x <= x) ? 2 : -2) : 0
	if(!moving)
	{
		scr_enemystomp()
	}
	else
	{
		global.scores[global.luigi] += 400
		audio_play_sound(kick, 10, false)
	}
}
else
{
	if(place_meeting(x + hsp, y, obj_player))
	{
		scr_player_get_hurt()
	}
}