
if(red)
{
	palarray = [ [ [ 230,156,33 ],[ 230,156,33 ] ],[ [ 255,255,255 ],[ 255,255,255 ] ],[ [ 12,147,0 ],[ 181,49,33 ] ] ] 

}
else
{
		palarray = [ [ [ 230,156,33 ],[ 230,156,33 ] ],[ [ 255,255,255 ],[ 255,255,255 ] ],[ [ 12,147,0 ],[ 12,147,0 ] ] ] 
}
if(!moving)
{
	if(alarm[0] <= 0 && alarm[1] <= 0 && !moving && hsp != 0) alarm[0] = (60 *4)
}


hsp = spd * movdir

if (is_jumping) vsp += grav


if(moving)
{
if (!place_meeting(x + sign(hsp), y, obj_solid)) {
    x += hsp
} else {
	movdir = -movdir
	audio_play_sound(bump_sound, 10, false)
}
}

if (place_meeting(x, y + vsp, obj_solid)) {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp);
    }

    vsp = 0;
    is_jumping = false;
}

if (!place_meeting(x, y + 16, obj_solid) ) {
    is_jumping = true;
}


if(place_meeting(x, y+4, obj_brick))
{
	if(instance_place(x, y+4, obj_brick).jumping)
	{
		instance_destroy()
	}
}
	
y += vsp;
