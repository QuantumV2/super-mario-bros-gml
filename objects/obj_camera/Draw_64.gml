scr_drawgui()
if(room == transition)
{
	draw_text(135, 80, string(global.world) + "-" + string(global.level))
	draw_text(144, 112, string(global.lives[global.luigi]))
}