if(other.y < y && !dead && other.is_jumping && !other.is_dead && other.prevvsp > 0)
{
	audio_play_sound(stomp, 10, false)
	sprite_index = spr_goombadead
	dead = true
	scr_enemystomp()
	alarm[0] = 25
}
else
{
	if(!dead && sprite_index != spr_goombadead && !other.frozen && !other.is_dead && !other.movefrozen)
	{
		scr_player_get_hurt()
		//instance_destroy()
	}
}