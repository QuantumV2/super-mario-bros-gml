if(player != noone) exit;
other.movefrozen = true
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