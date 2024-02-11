if(instance_exists(player))
{
	obj_flag.y = approach(obj_flag.y, (y + (image_yscale * 16)) - 8, 2);
	if(!playershouldwalk)
	{
		with(player)
		{
			if(place_meeting(x, y+8, obj_solid)){
				other.playershouldwalk = true
				x += 8
				audio_stop_all()
				audio_play_sound(stage_clear, 9999, false)
			}
			else
			{
				y += 2;
			}
		}
	}
	
	if(playershouldwalk){
		player.frozen = false
		player.sprite_index = player.spr_walk
		player.hsp = 1.8
		with(player)
		{
			if(place_meeting(x+1, y - 8, obj_solid)){
				depth = layer_get_depth("Tiles_1") + 1
				global.paused = true
				global.forcepaused = true
				obj_camera.timer--;
				if(obj_camera.timer <= 0)
				{
					if(global.level < 4) global.level++;
					else {
						global.world++; 
						global.level = 1;
					}
					obj_camera.timerfrozen = false
					room_goto(transition)
					global.forcepaused = false
					global.paused = false
					target_door = "A"
					if(global.twoplayer) { global.luigi = !global.luigi; }
					instance_destroy()
				}
			}
		}
	}
}