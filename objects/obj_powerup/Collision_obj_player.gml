other.frozen = true
other.image_speed = 1
other.y -= 8
other.sprite_index = spr_mario_grow
other.is_jumping = true
audio_play_sound(power_up, 10, false)
global.scores[global.luigi] += 1000
with(instance_create_layer(x, y - 8, "Instances", obj_scoreparticle))
{
	scorenumber = 1000
}
instance_destroy()