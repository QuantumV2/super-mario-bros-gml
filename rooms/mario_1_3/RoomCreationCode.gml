audio_stop_all()
global.music = audio_play_sound(overworld_theme, 9999, true)
if(obj_camera.alarm[0] <= 0) { obj_camera.alarm[0] = (60 * 0.4) }