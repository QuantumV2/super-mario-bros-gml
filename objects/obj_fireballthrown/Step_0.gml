if(global.paused) exit;
x += hsp;

vsp += grav;
y += vsp;

if (place_meeting(x + hsp, y, obj_solid)) {
    instance_destroy()
}
if (place_meeting(x, y + vsp + 1, obj_solid)) {
	vsp = 3 * sign(-vsp)
}

if (!scr_onscreen()) {
    instance_destroy();
}