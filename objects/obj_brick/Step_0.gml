if(jumping)
{
	drawoffsety += offsetdir;

	// check for value bounds and change direction if necessary
	if (drawoffsety >= 7) offsetdir = -offsetdir;
	if (drawoffsety <= 0) {
		offsetdir = 1
		drawoffsety = 0
		jumping = false;
	}
}