if(other.y < y - 2 && !dead && other.is_jumping && !other.is_dead)
{
	audio_play_sound(stomp, 10, false)
	sprite_index = spr_goombadead
	instance_create_layer(x, y, "Instances", obj_shell)
	instance_destroy(id, false)
}
else
{
	if(!dead && sprite_index != spr_goombadead && !other.frozen && !other.is_dead && !other.movefrozen)
	{
		scr_player_get_hurt()
	}
}