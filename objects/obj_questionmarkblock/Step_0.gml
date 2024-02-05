if(place_meeting(x, y + 1, obj_player) && sprite_index != spr_usedblock && sprite_index != spr_qbbounce && image_yscale > 0)
{
	sprite_index = spr_qbbounce
	mask_index = -1
	audio_play_sound(bump_sound, 10, false)
}