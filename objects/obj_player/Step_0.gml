if !global.forcepaused
{
	if(keyboard_check_pressed(vk_enter)){
		global.paused = !global.paused
		if(global.paused)
		{
			audio_pause_sound(global.music)	
		}
		else
		{
			audio_resume_sound(global.music)	
		}
		audio_play_sound(pause_sound, 10, false)
	}
}
if(global.paused) exit;

// Get player input
move = keyboard_check(ord("D")) - keyboard_check(ord("A"));

// Set horizontal speed
//hsp = move * (keyboard_check(vk_shift) ? run_speed : walk_speed);

// Flip sprite based on movement direction
if (move != 0) image_xscale = move;

move_speed = (keyboard_check(vk_shift) ? run_speed : walk_speed)

if(move_speed > walk_speed && sprite_index == spr_walk){
	image_speed = 1.5
} else {
	image_speed = 1
}



if move != 0 {
    //if (move == 1) hsp = min(move_speed, hsp + accel); //accelerate going right
    //if (move == -1) hsp = max(-move_speed, hsp - accel); //accelerate going left
	//hsp = move * move_speed;
	hsp = lerp(hsp, move * move_speed, accel);
}    else {
    if (hsp > 0 && move==0){
		hsp = max(0, hsp - frict); //friction going right
	}
    if (hsp < 0 && move==0) {
		hsp = min(0, hsp + frict); //friction going left
	}
}

// Jumping
if (keyboard_check_pressed(vk_space) && !is_jumping) {
    is_jumping = true;
    vsp = jump_speed;
	audio_play_sound(jump_sound, 10, false)
} else if (keyboard_check_released(vk_space) && is_jumping) {
    if(sign(vsp) == -1) vsp /= 2;
}

// Update vspeed with gravity
if (is_jumping) vsp += grav;

// Change sprites based on actions
if (is_dead) {
    sprite_index = spr_dead;
} else if (is_jumping) {
    sprite_index = spr_jump;
} else if (hsp == 0) {
    sprite_index = spr_idle;
} else if((sign(hsp) != sign(move)) && move != 0){
	sprite_index = spr_brake
} else {
    sprite_index = spr_walk;
}

var whole = floor(abs(hsp)); // the integer part of hsp
var fraction = abs(hsp) - whole; // the fractional part of hsp
var dir = sign(hsp); // the direction hsp is pointing

for (var i = 0; i < whole; i++) {
    if (!place_meeting(x + dir, y, obj_solid)) {
        x += dir;
    } else {
        hsp = 0; // stop horizontal movement when colliding
        break;
    }
}

// check for any remaining fractional movement if we haven't already hit a solid
if (hsp != 0 && fraction > 0 && !place_meeting(x + dir, y, obj_solid)) {
    x += dir * fraction;
}

// Vertical Collision
if (place_meeting(x, y + vsp, obj_solid)) {
    while (!place_meeting(x, y + sign(vsp), obj_solid)) {
        y += sign(vsp);
    }
	    
    vsp = 0;
    is_jumping = false;

}

if !(place_meeting(x, y + 16, obj_solid))
{
    if(alarm[0] <= 0) alarm[0] = 4;
}
	
y += vsp;
