// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemydie(){
with(instance_create_layer(x, y, "Instances", obj_debris))
{
	if(variable_instance_exists(other, "palarray"))
	{
			palarray = other.palarray
	}
	image_speed = 0
	if(other.object_index != obj_koopa)
		sprite_index = other.sprite_index
	else
		sprite_index = spr_koopa_shell
	image_yscale = -1
	grav = .1;
	vsp = -1;
	hsp = -other.image_xscale * 2
}
}