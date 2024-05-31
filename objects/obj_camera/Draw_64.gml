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
		draw_text(global.lives[global.luigi] < 10 ? 144 : 144-8, 112, global.lives[global.luigi] < 10 ? string(global.lives[global.luigi]) : "♕" + string_char_at( string(global.lives[global.luigi]), string_length(string(global.lives[global.luigi])) - 1 ))
	}
}