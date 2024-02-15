global.scores[global.luigi] += 100
with(instance_create_layer(x, y - 8, "Instances", obj_scoreparticle))
{
	scorenumber = 100
}
with(instance_create_layer(x, y, "Instances", obj_debris))
{
	image_speed = 0
	sprite_index = spr_goomba	
	image_yscale = -1
	grav = .1;
	vsp = -1;
}


