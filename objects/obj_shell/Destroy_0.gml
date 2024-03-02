scr_enemystomp()
with(instance_create_layer(x, y, "Instances", obj_debris))
{
	image_speed = 0
	sprite_index = spr_koopa_shell
	image_yscale = -1
	grav = .1;
	vsp = -1;
}


