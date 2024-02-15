obj_camera.timerfrozen = false
if((global.lives == [0,0] && global.twoplayer) || (global.lives[0] == 0 && !global.twoplayer))
{
	global.scores[global.luigi] = 0
	script_execute(init)
	game_restart()	
}
else
{
if (level == mario_1_2 && global.cutscene = 0)
{
		room_goto(asset_get_index(room_get_name(level) + "_cutscene"))
}
else
{
room_goto(level)
obj_camera.timer = 400
}
}
//room_goto(retro)