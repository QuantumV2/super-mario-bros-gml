
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
if(global.paused || frozen) exit;
if(invisframes > 0)
{
	is_dead = false
	invisframes--;
	//visible = irandom_range(0, 1)
}
/*if !visible && invisframes <= 0 { 
	visible = true
}*/
	

if instance_exists(obj_camera) && obj_camera.timer <= 100 && !hurryup {
	hurryup = 1
	audio_play_sound(hurry_up, 1000, false)
	audio_pause_sound(global.music)
} else if hurryup && !audio_is_playing(hurry_up) {
		audio_resume_sound(global.music)
		audio_sound_pitch(global.music, 1.5)
}
if y > room_height
	is_dead = true
if is_dead {
	sprite_index = spr_dead
	mask_index = spr_null
	if(!audio_is_playing(die_sound))
	{
		audio_play_sound(die_sound, 10, false)
	}
	vsp += grav
	if global.music || hurryup {
		hurryup = 0
		global.music = undefined
		audio_stop_all()
		vsp = -8.2
	}
	if vsp > -5.2
		y += vsp
	if y > room_height && vsp > 0
        { 
                global.lives = clamp(global.lives - 1, 0, global.lives)
				room_goto(transition)
        }
	exit
}

if(keyboard_check(ord("S")) && place_meeting(x, y + 1, obj_pipe) && pipe == noone)
{
	mask_index = spr_null
	vsp = 1
	ignorecollision = true
	depth = 300
	if(!audio_is_playing(pipe_sound))
	{
		audio_play_sound(pipe_sound, 10, false)
	}
	pipe = instance_place(x, y + 1, obj_pipe)
}

if(pipe != noone)
{
	x = pipe.x + 16
	if(y > pipe.y + 16)
	{
		pipe = noone
		room_goto(retro)
	}
}

// Get player input
move = keyboard_check(ord("D")) - keyboard_check(ord("A"));

// Set horizontal speed
//hsp = move * (keyboard_check(vk_shift) ? run_speed : walk_speed);

// Flip sprite based on movement direction
if (move != 0) image_xscale = move;

move_speed = (keyboard_check(vk_shift) ? run_speed : walk_speed)

/*if(move_speed > walk_speed && sprite_index == spr_walk){
	image_speed = 1.5
} else {
	image_speed = 1
}*/
image_speed = (hsp * move_speed) / 3.5

// Change sprites based on actions
if (is_dead) {
    sprite_index = spr_dead;
} else if (is_jumping && jump_initiated) {
    sprite_index = spr_jump;
} else if (hsp == 0) {
    sprite_index = spr_idle;
} else if ((move != 0 && hsp != 0) || (is_jumping && !jump_initiated)) {
    sprite_index = spr_walk;
} else if(abs(hsp - move) > 1.5 && move != 0 && abs(hsp) > .2 && sign(hsp) != sign(move)){
	sprite_index = spr_brake
}

// Update is_crouching status
var is_crouching = (keyboard_check(ord("S")) && !is_jumping) && big;

// Change sprite to crouch sprite if crouching
if (is_crouching || (keyboard_check(ord("S")) && is_jumping && big)) {
	frict = 0.3;
    sprite_index = spr_crouch;
}


// Update horizontal movement
if (!is_crouching && move != 0) {
    hsp = lerp(hsp, move * move_speed, accel);
} else if (is_crouching) {
    hsp = lerp(hsp, 0, frict); // Stop movement immediately when crouching
} else {
    // Apply friction when not moving
    if (hsp > 0 && move == 0) {
        hsp = max(0, hsp - frict); // Friction going right
    }
    if (hsp < 0 && move == 0) {
        hsp = min(0, hsp + frict); // Friction going left
    }
}

// Rest of your code...

// Jumping logic
if (keyboard_check_pressed(vk_space) && !is_jumping) {
    is_jumping = true;
    jump_initiated = true;
    vsp = jump_speed;
    is_crouching = false; // Reset crouching when jumping
    audio_play_sound(jump_sound, 10, false)
} else if (keyboard_check_released(vk_space) && is_jumping) {
    if (sign(vsp) == -1) vsp /= 2;
}


// Update vspeed with gravity
if (is_jumping) vsp += grav;

if(move_speed == run_speed && abs(hsp) >= walk_speed)
{
	accel = .02;
}
else
{
	accel = .04;
}

if(!is_dead)
{
if(big)
{
	frict = .03;
	if(sprite_index != spr_crouch)
	{
		mask_index = spr_bigmario_mask;
	}
	else
	{
		
		mask_index = spr_bigmario_crouchmask	
	}
	spr_idle = spr_bigmario_idle;
	spr_walk = spr_bigmario_run;
	spr_jump = spr_bigmario_jump;
	spr_brake = spr_bigmario_turn;	
}
else
{
	frict = .06;
	mask_index = spr_mario_mask;
	spr_idle = spr_mario_idle;
	spr_walk = spr_mario_run;
	spr_jump = spr_mario_jump;
	spr_dead = spr_mario_die;
	spr_brake = spr_mario_turn;
}
}

if (vsp > 0 && place_meeting(x, y + vsp, obj_solid)) {
jump_initiated = false;
}




var whole = floor(abs(hsp)); // the integer part of hsp
var fraction = abs(hsp) - whole; // the fractional part of hsp
var dir = sign(hsp); // the direction hsp is pointing

if(!ignorecollision)
{
for (var i = 0; i < whole; i++) {
    if (!place_meeting(x + dir, y, obj_solid)) {
        x += dir;
    } else {
        hsp = 0; // stop horizontal movement when colliding
        break;
    }
}
}

// check for any remaining fractional movement if we haven't already hit a solid
if (hsp != 0 && fraction > 0 && !place_meeting(x + dir, y, obj_solid)) {
    x += dir * fraction;
}

if(!ignorecollision)
{
// Vertical Collision
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
}

if !(place_meeting(x, y + 16, obj_solid))
{
    if(alarm[0] <= 0) alarm[0] = 4;
}


	
y += vsp;

