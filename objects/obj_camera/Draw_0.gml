if(!surface_exists(GUI_SURFACE)){
	GUI_SURFACE = surface_create(SCREENWIDTH, SCREENHEIGHT)
}
else{
	//if(room != transition && room != youwin)
	//{
	surface_set_target(GUI_SURFACE)	
	draw_clear_alpha(c_black,0);
	scr_drawgui()
	surface_reset_target()
	draw_surface(GUI_SURFACE, camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
	//}
}







