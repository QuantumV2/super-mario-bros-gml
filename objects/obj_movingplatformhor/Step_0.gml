if(dir == 1)
{
x += 1
if(x > xstart + sprite_width)
{
	dir = -dir
}
}
else
{
x -= 1
if(x < xstart - sprite_width)
{
	dir = -dir
}
}

