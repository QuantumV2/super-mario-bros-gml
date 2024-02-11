
// Speeds
hurryup = 0
walk_speed = 1.9;
run_speed = 3.3;
move_speed = 0;
grav = 0.2;
jump_speed = -5.3;

move = 0;

// States
is_jumping = true;
jump_initiated = false;
is_dead = false;

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

frict = .06;
accel = .04;

frozen = false;
movefrozen = false;

target_door = "A"
target_room = -1

pipe = noone

ignorecollision = false

invisframes = 0;

mask_index = spr_mario_mask

if(global.music == -1)
{
global.music = audio_play_sound(overworld_theme, 1000, true)
}
big = false

palarray = []
spr_pal = spr_mariopal