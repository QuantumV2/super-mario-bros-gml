function scr_drawgui(){
		draw_sprite(spr_topbar, 0, 0, 0)
		draw_set_font(global.font)
		draw_text(24, 16, plrname)
		draw_text(208, 24, timer)
		draw_set_halign(fa_center)
		draw_text(164, 24, string(global.world) + "-" + string(global.level))
		draw_set_halign(fa_left)
		if(room == transition)
		{
			draw_text(135, 79, string(global.world) + "-" + string(global.level))
			//144 112
			draw_text(144, 112, string(global.lives))
		}
}