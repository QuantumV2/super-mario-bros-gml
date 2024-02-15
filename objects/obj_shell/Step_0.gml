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