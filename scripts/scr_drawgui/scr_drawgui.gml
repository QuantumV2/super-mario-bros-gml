function scr_drawgui(){
	scr_palswap_set(palarray)
		draw_sprite(spr_topbar, 0, 0, 0)
		draw_set_font(global.font)
		draw_text(24, 16, plrname)
		if(room != transition)
		{
			draw_set_halign(fa_right)
			draw_text(232, 24, timer)
		}
		draw_set_halign(fa_center)
		draw_text(164, 24, string(global.world) + "-" + string(global.level))
		draw_set_halign(fa_left)
	shader_reset()
}