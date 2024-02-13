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

if(place_meeting(x, y+4, obj_brick))
{
	if(instance_place(x, y+4, obj_brick).jumping)
	{
		global.scores[global.luigi] += 100
		with(instance_create_layer(x, y - 8, "Instances", obj_scoreparticle))
		{
			scorenumber = 100
		}
		with(instance_create_layer(x, y, "Instances", obj_debris))
		{
			image_speed = 0
			sprite_index = spr_goomba	
			image_yscale = -1
			grav = .1;
			vsp = -1;
		}
		instance_destroy()
	}
}
	
y += vsp;
