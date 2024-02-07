if(place_meeting(x, y + 1, obj_player) && sprite_index != spr_brickbounce && !global.paused && image_yscale > 0)
{
	if(!instance_place(x, y + 1, obj_player).is_dead)
	{
		if(instance_place(x, y + 1, obj_player).big == false)
		{
			sprite_index = spr_brickbounce
			mask_index = spr_null
			audio_play_sound(bump_sound, 10, false)
		}
		else
		{
			audio_play_sound(break_block, 10, false)
			instance_destroy()
		}
	}
}
