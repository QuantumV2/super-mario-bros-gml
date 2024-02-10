if(jumping)
{
	y += vsp
	vsp = approach(vsp, startposy, grav)
	if(y = startposy)
	{
		jumping = false
	}
	if(vsp < 0)
	{
		sprite_index = changetosprite	
	}
}