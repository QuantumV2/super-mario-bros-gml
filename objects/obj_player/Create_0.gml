depth = -9999

if(instance_number(object_index) > 1) instance_destroy(); 
// Speeds
hurryup = 0
walk_speed = (1 + 9.0/16);
run_speed = (2 + 9.0/16)	;
move_speed = 0;
//gravities
small_grav = (2.0/16);
medium_grav = (1.0/16 + 14.0/256);
big_grav = (2.0/16 + 8.0/256);

small_fall_grav = (7.0/16);
medium_fall_grav = (6.0/16);
big_fall_grav = (9.0/16);

jump_speed = -4.2;
big_jump_speed = -5.0
jumpbuf = 0;

move = 0;

camoffset = 0;
drawtxt = false;

// States
is_jumping = true;
is_crouching = false;
jump_initiated = false;
is_dead = false;

horbuttonind = [vk_left, undefined, vk_right]

airstreak = 0;
airstreakpoints = [100, 200, 400, 500, 800, 1000, 2000, 4000, 5000, 8000, -1]

// Sprites
spr_idle = spr_mario_idle;
spr_walk = spr_mario_run;
spr_jump = spr_mario_jump;
spr_dead = spr_mario_die;
spr_brake = spr_mario_turn;
spr_crouch = spr_bigmario_crouch


// Initialize physics
hsp = 0;
vsp = 0;
prevvsp = 0;

frict = (13.0/256);
//print(frict)
skid_frict = (1.0/16 + 10.0/256);
accel_normal = (9.0/256 + 8.0/(16*16*16));
accel_jump_small = (9 / 256 + 8 / (16*16*16))
accel_jump_big = (14 / 256 + 4 / (16*16*16))

runaccel = (14.0/256 + 4.0/(16*16*16));

frozen = false;
movefrozen = false;

target_door = "A"
target_room = -1

pipe = noone

ignorecollision = false

invisframes = 0;

uninterruptedmewingstreak = 0;

mask_index = spr_mario_mask

if(global.music == -1)
{
global.music = audio_play_sound(overworld_theme, 1000, true)
}
big = false

palarray = []

powerup = 1

throwfire = false

scr_playerpal()