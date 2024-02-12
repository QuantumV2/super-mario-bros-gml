scr_drawgui()
if(room == transition)
{
	if(obj_transitionscreen.sprite_index == spr_gameover && global.twoplayer)
	{
		draw_text(104, 112, global.lives != [0,0] ? (global.lives[0] == 0 ? "MARIO" : "LUIGI") : "LUIGI")
	}
	else if(obj_transitionscreen.sprite_index != spr_gameover)
	{
		draw_text(135, 80, string(global.world) + "-" + string(global.level))
		draw_text(144, 112, string(global.lives[global.luigi]))
	}
}