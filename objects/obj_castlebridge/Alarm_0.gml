if(image_xscale > 0)
{
image_xscale -= 1
if(!audio_is_playing(break_block)){
	audio_play_sound(break_block, 10, false)
}
alarm[0] = 60 / 6
}
else
{
	instance_destroy()
}