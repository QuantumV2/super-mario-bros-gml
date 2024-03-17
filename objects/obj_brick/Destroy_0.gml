for(var i = -2; i < 3; i++)
{
	if(i != 0)
	{
		with(instance_create_layer(x, y, "Instances", obj_debris))
		{
			hsp = i
		}
	}

}
