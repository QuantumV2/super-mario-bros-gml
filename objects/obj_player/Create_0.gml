// Speeds
walk_speed = 1.6;
run_speed = 2.3;
grav = 0.2;
jump_speed = -5.2;

move = 0;

// States
is_jumping = false;
is_dead = false;

// Sprites
spr_idle = spr_mario_idle;
spr_walk = spr_mario_run;
spr_jump = spr_mario_jump;
spr_dead = spr_mario_die;
spr_brake = spr_mario_turn;

// Initialize physics
hsp = 0;
vsp = 0;

frict = .1; 

global.music = audio_play_sound(overworld_theme, 1000, true)