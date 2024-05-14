if(moving)
{
	instance_destroy(other)
	if(scr_onscreen())
	{
		audio_play_sound(kick, 10, false)
	}
}