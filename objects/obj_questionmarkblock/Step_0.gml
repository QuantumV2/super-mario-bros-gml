if(place_meeting(x, y + 1, obj_player) && sprite_index != spr_usedblock && sprite_index != spr_qbbounce && image_yscale > 0)
{
	sprite_index = spr_qbbounce
	mask_index = -1
	if(object == obj_powerup)
	{
		instance_create_layer(x + 8, y, "Instances", obj_powerup)
		audio_play_sound(power_up_appear, 10, false)
	}
	else
	{
		global.coins++;
		audio_play_sound(coin, 10, false)
	}
}
scr_shine(0)