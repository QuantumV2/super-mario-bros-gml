hsp = spd * movdir
var whole = floor(abs(hsp)); // the integer part of hsp
var fraction = abs(hsp) - whole; // the fractional part of hsp
var dir = sign(hsp); // the direction hsp is pointing

if (is_jumping) vsp += grav;

if(place_meeting(x, y, obj_questionmarkblock))
{
	hsp = 0
	movingfromblock = true;
	y -= .5
}
if(!place_meeting(x, y-1, obj_questionmarkblock) && place_meeting(x, y+1, obj_questionmarkblock) && movingfromblock)
{
	depth = 0
	movingfromblock = false
	is_jumping = true
}
for (var i = 0; i < whole; i++) {
    if (!place_meeting(x + dir, y, obj_solid) || place_meeting(x + dir, y, obj_solidfollowcam)) {
        x += dir;
    } else {
        movdir = -movdir;
        break;
    }
}

// check for any remaining fractional movement if we haven't already hit a solid
if ((hsp != 0 && fraction > 0 && !place_meeting(x + dir, y, obj_solid)) || place_meeting(x + dir, y, obj_solidfollowcam)) {
    x += dir * fraction;
}

if (place_meeting(x, y + vsp, obj_solid)) {
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
