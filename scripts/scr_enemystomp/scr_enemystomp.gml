// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemystomp(){
	if(obj_player.airstreak < 11)
	{
	obj_player.airstreak++
	}
	global.scores[global.luigi] += obj_player.airstreakpoints[obj_player.airstreak - 1] > 0 ? obj_player.airstreakpoints[obj_player.airstreak - 1] : 0 
	if(obj_player.airstreakpoints[obj_player.airstreak - 1] == -1)
	{
		global.lives[global.luigi]++	
	}
	with(instance_create_layer(x, y - 8, "Instances", obj_scoreparticle))
	{
		scorenumber = obj_player.airstreakpoints[obj_player.airstreak - 1]
	}	
}