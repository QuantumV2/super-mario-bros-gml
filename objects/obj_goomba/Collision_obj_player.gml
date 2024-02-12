if(other.y < y - 2 && !dead && other.is_jumping)
{
	audio_play_sound(stomp, 10, false)
	sprite_index = spr_goombadead
	dead = true
	global.scores[global.luigi] += 100
	alarm[0] = 25
}
else
{
	if(!dead && sprite_index != spr_goombadead && !other.frozen && !other.is_dead && !other.movefrozen)
	{
		scr_player_get_hurt()
	}
}