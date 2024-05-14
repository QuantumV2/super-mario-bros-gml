function scr_onscreen(){
	return rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, camera_get_view_x(view_camera[0]) - 64, camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + SCREENWIDTH + 64, camera_get_view_y(view_camera[0]) + SCREENHEIGHT)
}