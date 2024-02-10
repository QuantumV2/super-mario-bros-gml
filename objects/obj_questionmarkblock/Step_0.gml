if(jumping)
{
	drawoffsety += offsetdir;

	// check for value bounds and change direction if necessary
	if (drawoffsety >= 7) offsetdir = -offsetdir;
	if(offsetdir < 0)
	{
		sprite_index = changetosprite
	}
	if (drawoffsety <= 0) {
		offsetdir = 1
		drawoffsety = 0
		jumping = false;
	}
}
scr_shine(0)