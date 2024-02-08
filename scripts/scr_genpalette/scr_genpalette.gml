function scr_genpalette()
{
	palselect = scr_overflow(palselect, 0, sprite_get_number(spr_pal) - 1)
	if (!palgenerated || palselect != prevpalselect)
	{
	    palarray = scr_paltoarr(spr_pal, palselect);
	    palgenerated = true;
	    prevpalselect = palselect; // Remember the previous value of palselect
	}
	print(palarray)
}

