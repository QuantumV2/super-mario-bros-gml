scr_shine(0)
if(instance_exists(player))
{
	player.frozen = false
	player.sprite_index = player.spr_walk
	player.hsp = 1.8
	with(player)
	{
		if(place_meeting(x+1, y - 8, obj_solid)){
			sprite_index  = spr_idle
			global.paused = true
			global.forcepaused = true
			other.drawtxt = true
			if(!audio_is_playing(world_clear))
			{
				if(global.level < 4) global.level++;
				else {
					global.world++; 
					global.level = 1;
				}
				obj_camera.timerfrozen = false
				room_goto(transition)
				obj_camera.timer = 400
				obj_camera.alarm[0] = (60 * 0.4)
				global.forcepaused = false
				global.paused = false
				target_door = "A"
				instance_destroy()
			}
		}
	}
}