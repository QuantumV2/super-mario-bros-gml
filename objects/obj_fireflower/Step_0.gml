if(global.paused) exit;

if(place_meeting(x, y, obj_brick))
{
	movingfromblock = true;
	y -= .5
}
if(!place_meeting(x, y-1, obj_brick) && place_meeting(x, y+1, obj_brick) && movingfromblock)
{
	depth = obj_player.depth
	movingfromblock = false
}
