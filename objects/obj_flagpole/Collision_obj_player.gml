if(player != noone) exit;
other.movefrozen = true
other.is_crouching = false
other.hsp = 0
other.frozen = true
other.x = x + 4
plrheight = other.y
obj_camera.timerfrozen = true
other.sprite_index = other.big ? spr_bigmario_climb : spr_mario_climb
other.image_xscale = 1
player = other.id
_score = global.scores[global.luigi]
audio_stop_all()
audio_play_sound(flagpole_sound, 10, false)

if(plrheight > 196) targetscore = 100
if(plrheight < 196) targetscore = 400
if(plrheight < 128) targetscore = 800
if(plrheight < 96) targetscore = 2000
if(plrheight < 64) targetscore = 5000
targetscoreNOTIMER = targetscore
targetscore += obj_camera.timer * 50