if(dir == 1)
{
	y += 1
	if(y > room_height)
	{
		y = 0
	}
}
else
{
	y -= 1
	if(y < 0)
	{
		y = room_height
	}
}

