timer = 400
alarm_set(0, 60 * 0.4)
plrname = global.luigi ? "LUIGI" : "MARIO"

if(instance_exists(obj_player))
{
	camoffset = obj_player.camoffset
}