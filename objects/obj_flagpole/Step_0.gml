if(instance_exists(player))
{
	obj_flag.y = approach(obj_flag.y, (y + (image_yscale * 16)) - 8, 2);
	var targetscore = 0
	if(other.plrheight > 196) targetscore = 100
	if(other.plrheight < 196) targetscore = 400
	if(other.plrheight < 128) targetscore = 800
	if(other.plrheight < 96) targetscore = 2000
	if(other.plrheight < 64) targetscore = 5000

	if(!instance_exists(obj_scoreparticle) && !scoreshown)
	{
		with(instance_create_layer(x, plrheight, "Instances", obj_scoreparticle))
		{
			targety = obj_flagpole.y
			scorenumber = targetscore
		}
		scoreshown = true
	}
	if(!playershouldwalk)
	{
		with(player)
		{
			if(place_meeting(x, y+2, obj_solid)){
				if(other.alarm[0] <= 0)
				{
					if !other.playershouldwalk
					{
						image_speed  = 0
						other.alarm[0] = 15
					}
				}
			}
			else
			{
				if(other.alarm[0] <= 0)
				{
					y += 2;
				}
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

				if(global.scores[global.luigi] < other._score + targetscore)
				{
					global.scores[global.luigi] += 10;	
				}
				if(global.scores[global.luigi] > other._score + targetscore)
				{
					global.scores[global.luigi] = other._score + targetscore
				}
				if(obj_camera.timer - 1 > -1) obj_camera.timer--;
				if(obj_camera.timer <= 0 && global.scores[global.luigi] >= other._score + targetscore)
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
}