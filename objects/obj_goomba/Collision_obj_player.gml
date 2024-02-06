if(other.y < y && !dead)
{
	audio_play_sound(stomp, 10, false)
	sprite_index = spr_goombadead
	dead = true
	alarm[0] = 25
}
else
{
	if(!dead && sprite_index != spr_goombadead)
	{
		other.is_dead = true
	}
}