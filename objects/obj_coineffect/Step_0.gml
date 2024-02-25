y += vsp
vsp += grav

if(vsp > 0 && y > ystart - 8)
{
	with(instance_create_layer(x, y - 8, "Instances", obj_scoreparticle))
	{
		scorenumber = 200
	}
	instance_destroy()
}


