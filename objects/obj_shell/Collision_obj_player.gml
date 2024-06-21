if(!moving || (moving && other.vsp > 0))
{
    moving = !moving
    //x += image_xscale * 2
    hsp = (moving) ? 2 : 0
	movdir = (other.x <= x) ? 1 : -1
    if(!moving)
    {
        scr_enemystomp()
    }
    else
    {
        global.scores[global.luigi] += 400
        audio_play_sound(kick, 10, false)
    }
}

if(moving && other.vsp == 0)
{
	scr_player_get_hurt()
}