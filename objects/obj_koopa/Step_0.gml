if(dead) exit;
if(global.paused) exit;
if(scr_onscreen())
{
hsp = spd * movdir
}

if (is_jumping) vsp += grav


if (!place_meeting(x + sign(hsp), y, obj_solid) || place_meeting(x + sign(hsp), y, obj_solidfollowcam)) {
    x += hsp
} else {
    movdir = -movdir
	image_xscale = -image_xscale
}

if (place_meeting(x, y + vsp, obj_solid) && !place_meeting(x + sign(hsp), y, obj_solidfollowcam)) {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp);
    }

    vsp = 0;
    is_jumping = false;
}

if (!place_meeting(x, y + 16, obj_solid) && !place_meeting(x, y + 16, obj_solidfollowcam)) {
    is_jumping = true;
}

if(red && !place_meeting(x + sign(movdir), y + 4, obj_solid))
{
	    movdir = -movdir
		image_xscale = -image_xscale
}

if(place_meeting(x, y+4, obj_brick))
{
	if(instance_place(x, y+4, obj_brick).jumping)
	{
		instance_destroy()
	}
}
	
y += vsp;
