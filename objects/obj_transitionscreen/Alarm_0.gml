if (level == mario_1_2 && global.cutscene = 0)
{
		room_goto(asset_get_index(room_get_name(level) + "_cutscene"))
}
else
{
room_goto(level)
}
//room_goto(retro)