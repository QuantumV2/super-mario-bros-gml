scr_palswap_set(palarray)
if(throwfire)
{
	if(hsp == 0 || (is_jumping && jump_initiated))
	{
		draw_sprite_ext(spr_firemario_throwfire, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha)
	}
	else
	{
		draw_sprite_ext(spr_firemario_throwfire_part, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha)
		draw_sprite_part_ext(sprite_index, image_index, 0, 24, 16, 8, x - (8 * image_xscale), y + 8, image_xscale, image_yscale, c_white, image_alpha)
	}
}
else
{
	draw_self()
}
//with(all)
//{
	//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
//}
shader_reset()