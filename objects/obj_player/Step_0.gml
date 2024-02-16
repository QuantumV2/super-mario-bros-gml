global.powerup[global.luigi] = big
if !global.forcepaused
{
	if(keyboard_check_pressed(vk_enter)){
		global.paused = !global.paused
		if(global.paused)
		{
			audio_pause_all()
		}
		else
		{
			audio_resume_all()
		}
		audio_play_sound(pause_sound, 10, false)
	}
}
if(global.paused)
{
	image_speed = 0	
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

if (place_meeting(x, y + vsp, obj_movingplatform))
{
    var inst;
    inst = instance_place(x, y + vsp, obj_movingplatform);
    y = inst.y - (sprite_height / 2);
	is_jumping = false
	jump_initiated = false
    vsp = inst.dir;
}
if (place_meeting(x + hsp, y + 1, obj_movingplatformhor))
{

    var inst = instance_place(x + hsp, y + 1, obj_movingplatformhor);
    if(inst != noone)
    {
        x += inst.dir; 
    }
}

if(!is_dead)
{
if instance_exists(obj_camera) && obj_camera.timer <= 100 && !hurryup {
	hurryup = 1
	audio_play_sound(hurry_up, 1000, false)
	audio_pause_sound(global.music)
} else if hurryup && !audio_is_playing(hurry_up) {
		audio_resume_sound(global.music)
		audio_sound_pitch(global.music, 1.5)
}
}
if y > room_height && !is_dead && pipe == noone
	is_dead = true
if is_dead {
	obj_camera.timerfrozen = true
	sprite_index = spr_dead
	mask_index = spr_null
	vsp += grav
	if global.music || hurryup {
		hurryup = 0
		global.music = undefined
		audio_stop_all()
		audio_play_sound(die_sound, 10, false)
		vsp = -8.2
	}
	if vsp > -4.2
		y += vsp
	if y > room_height && vsp > 0 && !audio_is_playing(die_sound)
    { 
		
        global.lives[global.luigi] = clamp(global.lives[global.luigi] - 1, 0, global.lives[global.luigi])
		if(global.twoplayer && global.lives[!global.luigi] > 0) { global.luigi = !global.luigi; }
		global.powerup[global.luigi] = 0
		
		instance_destroy()
		room_goto(transition)
    }
	exit
}
if(movefrozen) {}
else
{
	if(keyboard_check(ord("S")) && place_meeting(x, y + 1, obj_pipe) && pipe == noone && !is_jumping)
	{
		if(!instance_place(x, y + 1, obj_pipe).vertical && move == 0)
		{
		audio_play_sound(pipe_sound, 10, false)
		pipe = instance_place(x, y + 1, obj_pipe)
		}
	}
	if(abs(hsp) > 0 && place_meeting(x + hsp, y, obj_pipe) && pipe == noone && !is_jumping)
	{
		if(instance_place(x + hsp, y, obj_pipe).vertical)
		{
		audio_play_sound(pipe_sound, 10, false)
		pipe = instance_place(x + hsp, y, obj_pipe)
		}
	}
}

if(place_meeting(x, y - 1, obj_questionmarkblock) && !global.paused && !is_dead)
{
	var qb = instance_place(x, y - 1, obj_questionmarkblock)
	with(qb)
	{
		if(!jumping && sprite_index != changetosprite)
			{
			jumping  = true
			//mask_index = -1
			if(object == obj_powerup || object == obj_oneup)
			{
				with(instance_create_layer(x + 8, y, "Instances", object))
				{
					depth = other.depth + 1
				}
				audio_play_sound(power_up_appear, 10, false)
			}
			else
			{
				global.coins++;
				with(instance_create_layer(x + 8, y, "Instances", obj_coineffect))
				{
					depth = other.depth + 1
				}
				audio_play_sound(coin, 10, false)
				global.scores[global.luigi] += 200

			}
		}
	}
}


if(place_meeting(x, y - 1, obj_brick) && !global.paused && !is_dead && !place_meeting(x, y - 1, obj_questionmarkblock))
{
	var brick = instance_place(x,  y - 1, obj_brick)
	if(!brick.jumping && brick.sprite_index != spr_usedblock)
	{
		if(!big || variable_instance_exists(brick, "object"))
		{
			brick.jumping = true
			//brick.mask_index = spr_null
			if(variable_instance_exists(brick, "object"))
			{
				with(brick)
				{
					changetosprite = spr_usedblock
					if(object == obj_powerup || object == obj_oneup)
					{
						with(instance_create_layer(x + 8, y, "Instances", object))
						{
							depth = other.depth + 1
						}
						audio_play_sound(power_up_appear, 10, false)
					}
					else
					{
						global.coins++;
						with(instance_create_layer(x + 8, y, "Instances", obj_coineffect))
						{
							depth = other.depth + 1
						}
						audio_play_sound(coin, 10, false)
						global.scores[global.luigi] += 200

					}
				}
			}
			else
			{
				audio_play_sound(bump_sound, 10, false)
			}
		}
		else
		{
			audio_play_sound(break_block, 10, false)
			global.scores[global.luigi] += 50
			instance_destroy(brick)
		}
	}
}


if(pipe != noone && !is_jumping)
{
	mask_index = spr_null
	camoffset = pipe.camoffset
	target_door = pipe.target_door
	ignorecollision = true
	depth = layer_get_depth("Tiles_1") + 1

	if(!pipe.vertical && move == 0)
	{
		hsp = 0
		x = pipe.x + 16
		if(!audio_is_playing(pipe_sound))
		{
			vsp = 0
			ignorecollision = false
			depth = 0
			room_goto(pipe.target_room)
			pipe = noone
		}
		vsp = 1
	}
	else if (pipe.vertical)
	{
		vsp = 0
		//y = pipe.y + (pipe.image_xscale * 16) + (sprite_height / 2)
		if(!audio_is_playing(pipe_sound))
		{
			ignorecollision = false
			depth = 0

			room_goto(pipe.target_room)
			pipe = noone
		}
		x += 1
	}
}

if(place_meeting(x, y, obj_exitpipe))
{
	hsp = 0
	vsp = 0
	ignorecollision = true
	depth = layer_get_depth("Tiles_1") + 1
	y += -1
	if(!audio_is_playing(pipe_sound))
	{
		audio_play_sound(pipe_sound, 10, false)	
	}
}
else if (!place_meeting(x, y, obj_exitpipe) && pipe == noone)
{
	ignorecollision = false
	depth = layer_get_depth("Instances")
}

if(!movefrozen) {
// Get player input
move = keyboard_check(ord("D")) - keyboard_check(ord("A"));

} else {
	move = 0
}

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

if(!frozen)
{
image_speed = abs(hsp * move_speed) / 3.5
}

// Change sprites based on actions
if (is_dead) {
    sprite_index = spr_dead;
} else if (is_jumping && jump_initiated) {
    sprite_index = spr_jump;
} else if (hsp == 0) {
    sprite_index = spr_idle;
} else if ((move != 0 && hsp != 0) || (is_jumping && !jump_initiated)) {
    sprite_index = spr_walk;
} if(abs(hsp - move) > 1.5 && move != 0 && abs(hsp) > .2 && sign(hsp) != sign(move) && !is_jumping){
	sprite_index = spr_brake
}
// Update is_crouching status
var is_crouching = (keyboard_check(ord("S")) && !is_jumping  && (abs(move) == 0 && !is_jumping)) && big  && !movefrozen && !frozen;

// Change sprite to crouch sprite if crouching
if (is_crouching || (keyboard_check(ord("S")) && is_jumping && big && !movefrozen && !frozen )) {
	frict = 0.2;
    sprite_index = spr_crouch;
}


if(movefrozen) {}
else
{
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
}

if(sprite_index == spr_jump && !is_jumping) { sprite_index = spr_walk; }

// Jumping logic
if(movefrozen) {}
else
{
	if (keyboard_check_pressed(vk_space) && !is_jumping) {
	    is_jumping = true;
	    jump_initiated = true;
	    vsp = jump_speed;
	    is_crouching = false; // Reset crouching when jumping
	    var snd = big ? audio_play_sound(superjump_sound, 10, false) : audio_play_sound(jump_sound, 10, false)
	} else if (keyboard_check_released(vk_space) && is_jumping) {
	    if (sign(vsp) == -1) vsp /= 2;
	}
}

if(vsp > .2 && !is_dead)
{
	vsp += 0.3
}

// Update vspeed with gravity

if (is_jumping && vsp < (grav * 6)) vsp += grav;


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
		vsp = 0
	}

}
}

if (place_meeting(x, y + vsp, obj_solid) && abs(vsp) > 0 && place_meeting(x + hsp, y, obj_solid) && !ignorecollision) {
	y -= vsp
	x += hsp
}

if !(place_meeting(x, y + 1, obj_solid)) && !(place_meeting(x, y + 2, obj_movingplatform)) 
{
    if(alarm[0] <= 0) alarm[0] = 4;
}


	
y += vsp;

if(string_ends_with(room_get_name(room), "_cutscene"))
{
	obj_camera.timerfrozen = true
	movefrozen = true
	hsp = 1
	if(place_meeting(x+1, y - 8, obj_solid)){
		if(!audio_is_playing(pipe_sound))
		{
			audio_stop_all()
		audio_play_sound(pipe_sound, 10, false)

		alarm_set(1, 60 * 0.79)
		}

	}
}