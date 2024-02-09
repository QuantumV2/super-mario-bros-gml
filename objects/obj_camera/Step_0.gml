
if(instance_exists(obj_player))
{
    var room_left = 0;
    var room_right = (room_width - camW) - 1;
    point = clamp(max(obj_player.x - (camW / 2) + offset, camera_get_view_x(view_camera[0])), room_left, room_right);
    camera_set_view_pos(view_camera[0], point, 0);
}
if timer <= 0
{
	obj_player.is_dead = true	
	timer = 300
}
if instance_number(obj_camera) > 1 { instance_destroy() } //prevent multiple cameras spawning

scr_shine(1)