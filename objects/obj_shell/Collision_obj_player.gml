if(!moving || (moving && other.is_jumping && !other.is_dead && !other.frozen && !other.movefrozen))
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