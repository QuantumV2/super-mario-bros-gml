if(scr_onscreen())
{
if (is_jumping) vsp += grav
if(moving)
{
	if (!place_meeting(x + hsp, y, obj_solid) || place_meeting(x + hsp, y, obj_solidfollowcam)) {
		x += hsp
	} else {
	    hsp = -hsp
		audio_play_sound(bump_sound, 10, false)
	}
}
else
{
	if(alarm[0] <= 0 && alarm[1] <= 0 && !moving && hsp != 0) alarm[0] = (60 /4)
}
if (place_meeting(x, y + vsp, obj_solid)) {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp);
    }
	    
	if(vsp > 0)
	{
	    vsp = 0;
	    is_jumping = false;
	}
	else
	{
		vsp = grav
	}

}
if (!place_meeting(x, y + 16, obj_solid) && !place_meeting(x, y + 16, obj_solidfollowcam)) {
    is_jumping = true;
}

}