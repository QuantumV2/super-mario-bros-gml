if(player != noone) exit;
other.movefrozen = true
other.hsp = 0
//other.is_jumping = false
obj_camera.timerfrozen = true
other.image_xscale = 1
player = other.id
_score = global.scores[global.luigi]
audio_stop_all()
audio_play_sound(world_clear, 9999, false)
obj_castlebridge.alarm[0] = 60 / 5
visible = false
with(other)
{
			while(!place_meeting(x, y + 1, obj_solid))
			{
				y++
			}
}