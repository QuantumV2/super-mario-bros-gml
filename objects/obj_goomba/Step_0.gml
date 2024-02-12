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
	
y += vsp;
