y += vsp
vsp += grav

if(vsp > 0)
{
	with(instance_create_layer(x, y - 8, "Instances", obj_scoreparticle))
	{
		scorenumber = 200
	}
	instance_destroy()
}


