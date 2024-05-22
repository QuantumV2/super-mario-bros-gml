scr_playerpal()
var accel = accel_normal
var grav = 0
if (keyboard_check(ord("X")))
{
	if(move == sign(image_xscale))
	{
		if(hsp < (1 + 9/16))
		{
			accel = accel_jump_small
		}
		else
		{
			accel = accel_jump_big
		}
	}
	if(move != sign(image_xscale))
	{
		if(hsp >= (1 + 9/16))
		{
			hsp -= accel_jump_big
		}
		else
		{
			hsp -= accel_jump_small
		}
	}
}
if(hsp < 1)
{
	grav = keyboard_check(ord("X")) && vsp <= 0 ? small_grav : small_fall_grav
}
else if (hsp >= 1){
	grav = keyboard_check(ord("X")) && vsp <= 0 ? medium_grav : medium_fall_grav
}
else if(hsp >= (2 + 5/16))
{
	grav = keyboard_check(ord("X")) && vsp <= 0 ? big_grav : big_fall_grav
}
global.powerup[global.luigi] = [big, powerup]
if !global.forcepaused
{
	if(keyboard_check_pressed(vk_enter) && !frozen){
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
	visible = !visible
}
if !visible && invisframes <= 0 { 
	visible = true
}

if (place_meeting(x, y + vsp, obj_movingplatform) && !is_dead)
{
    var inst;
    inst = instance_place(x, y + vsp, obj_movingplatform);
    y = inst.y - (sprite_height / 2) + 1;
    is_jumping = false
    jump_initiated = false
    vsp = inst.dir;
}
if (place_meeting(x + hsp, y + 1, obj_movingplatformhor) && !is_dead)
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
	powerup = 0
	big = 0
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
		global.powerup[global.luigi] = [0, 0]
		
		instance_destroy()
		room_goto(transition)
    }
	exit
}
if(movefrozen) {}
else
{
	var dirbutton = 0
	if(hsp != 0)
	{
		dirbutton = keyboard_check(horbuttonind[sign(hsp) + 1])
	}
	if(keyboard_check(vk_down) && place_meeting(x, y + 1, obj_pipe) && pipe == noone && !is_jumping && !movefrozen)
	{
		if(!instance_place(x, y + 1, obj_pipe).vertical && hsp == 0)
		{
		audio_play_sound(pipe_sound, 10, false)
		ignorecollision = true
		pipe = instance_place(x, y + 1, obj_pipe)
		}
	}
	if(place_meeting(x + sign(hsp), y, obj_pipe) && dirbutton  && pipe == noone && !movefrozen)
	{

		if(instance_place(x + sign(hsp), y, obj_pipe).vertical)
		{
						while(!place_meeting(x, y + 1, obj_solid))
			{
				y++
			}
		audio_play_sound(pipe_sound, 10, false)
		image_xscale = abs(sign(hsp)) > 0 ? sign(hsp) : image_xscale 
		ignorecollision = true
		pipe = instance_place(x + sign(hsp), y, obj_pipe)
		}
	}
}

if(place_meeting(x, y - 1, obj_questionmarkblock) && !global.paused && !is_dead && prevvsp < 0)
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


if(place_meeting(x, y - 1, obj_brick) && !global.paused && !is_dead && !place_meeting(x, y - 1, obj_questionmarkblock) && prevvsp < 0)
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

if(airstreak > 0 && !is_jumping)
{
	airstreak = 0;	
}

if(pipe != noone)
{
	mask_index = spr_null
	movefrozen = true
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
			movefrozen = false
			room_goto(pipe.target_room)
			pipe = noone
		}
		vsp = 1
	}
	else if (pipe.vertical)
	{
		vsp = 0
		y = pipe.y + 32 - (sprite_height / 2)
		if(!audio_is_playing(pipe_sound))
		{
			ignorecollision = false
			depth = 0
			movefrozen = false
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
}
else if (!place_meeting(x, y, obj_exitpipe) && pipe == noone)
{
	ignorecollision = false
	depth = layer_get_depth("Instances")
}

if(!movefrozen) {
// Get player input
move = -(keyboard_check(vk_left) - keyboard_check(vk_right));

} else {
	move = 0
}
if(powerup == 1 && keyboard_check_pressed(ord("Z")) && instance_number(obj_fireballthrown) < 2 && !is_crouching && !movefrozen && !frozen)
{
	with(instance_create_layer(x, y, "Instances", obj_fireballthrown))
	{
		image_xscale = other.image_xscale	
	}
	throwfire = true
	audio_play_sound(fireball, 10, 0)
	alarm[2] = 10
}
// Set horizontal speed
//hsp = move * (keyboard_check(ord("Z")) ? run_speed : walk_speed);

// Flip sprite based on movement direction
if (move != 0 && !is_jumping) image_xscale =  move;

move_speed = (keyboard_check(ord("Z")) ? run_speed : walk_speed)


if(keyboard_check(vk_down) && big && !movefrozen && !frozen && !is_jumping){
	is_crouching = true	
}
if(!keyboard_check(vk_down) && !is_jumping)
{
	is_crouching = false	
}

// Change sprites based on actions
if (is_dead) {
    sprite_index = spr_dead;
} else if (is_jumping && jump_initiated && !is_crouching) {
    sprite_index = spr_jump;
} else if (hsp == 0 && !is_crouching) {
    sprite_index = spr_idle;
} else if ((move != 0 && hsp != 0) || (is_jumping && !jump_initiated)) {
    sprite_index = spr_walk;
} if(abs(hsp - move) > 1.5 && move != 0 && abs(hsp) > .2 && sign(hsp) != sign(move) && !is_jumping){
	sprite_index = spr_brake
} 

if(is_crouching) {
	sprite_index = spr_crouch
}

if(movefrozen) {}
else
{
if (is_crouching && !is_jumping) {
	move = 0
    hsp = lerp(hsp, 0, frict);
}
// Update horizontal movement
if ( move != 0) {
    hsp = lerp(hsp, move * move_speed, accel);
} else {
	var fricttouse = frict
	if (sign(hsp) != sign(move)) {
		fricttouse = skid_frict
    }
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
	if (keyboard_check_pressed(ord("X")) && (!is_jumping)) {
	    is_jumping = true;
	    jump_initiated = true;
	    vsp = hsp >= (2 + 5/16) ? big_jump_speed : jump_speed;
	    //is_crouching = false; // Reset crouching when jumping
	    var snd = big ? audio_play_sound(superjump_sound, 10, false) : audio_play_sound(jump_sound, 10, false)
	} else if (keyboard_check_released(ord("X")) && is_jumping) {
	    if (vsp >= -1) vsp = 0;
	}
}

if(vsp > .2 && !is_dead)
{
	vsp += 0.3
}

// Update vspeed with gravity

if (is_jumping && vsp < 4.0 && !ignorecollision) vsp += grav;
vsp = clamp(vsp, -4.0, 4.0)



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

if (vsp > 0 && (place_meeting(x, y + vsp, obj_solid))) {
jump_initiated = false;
}


var whole = floor(abs(hsp)); // the integer part of hsp
var fraction = abs(hsp) - whole; // the fractional part of hsp
var dir = sign(hsp); // the direction hsp is pointing

if(!ignorecollision)
{
	if(x + dir < obj_camera.camX + 8)
	{
		hsp = 0
	}
	else
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
}

// check for any remaining fractional movement if we haven't already hit a solid
if (hsp != 0 && fraction > 0 && !place_meeting(x + dir, y, obj_solid)) {
    if(x + dir < obj_camera.camX + 8) {
		hsp = 0
    } else {
        x += dir * fraction;
    }
}

prevvsp = vsp

if(!ignorecollision)
{
// Vertical Collision
if (place_meeting(x, y + vsp, obj_solid)) {
	if(!place_meeting(x, y + vsp, obj_movingplatform))
	{
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
}

if (place_meeting(x, y + vsp, obj_solid) && abs(vsp) > 0 && place_meeting(x + hsp, y, obj_solid) && !ignorecollision) {
	y -= vsp
	x += hsp
}

if !(place_meeting(x, y + 1, obj_solid)) 
{
    is_jumping = true;
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

if(!frozen)
{
image_speed = abs(hsp * move_speed) / 3.5
}
