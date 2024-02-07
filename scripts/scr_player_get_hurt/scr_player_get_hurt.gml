function scr_player_get_hurt(){
	if(obj_player.big)
	{
		obj_player.frozen = true
		obj_player.image_speed = 1
		obj_player.is_jumping = true
		obj_player.sprite_index = spr_mario_shrink
		audio_play_sound(pipe_sound, 10, false)
	}
	else
	{
		obj_player.is_dead = true
	}
}