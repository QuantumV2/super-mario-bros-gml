if(jumping)
{
	y += vsp
	vsp = approach(vsp, startposy, grav)
	if(y >= startposy)
	{
		y = startposy
		vsp = -2
		jumping = false
	}
}