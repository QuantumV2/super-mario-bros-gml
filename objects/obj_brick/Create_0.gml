if(abs(image_xscale) > 1|| abs(image_yscale) > 1)
{
	for (var j = y; j < y + (image_yscale * 16); j+=16) {
	    for (var i = x; i < x + (image_xscale * 16); i+=16) {
	        with(instance_create_layer(i, j, "Instances", object_index))
			{
				depth = other.depth
			}
	    }
	}
	instance_destroy(id, false)
}
drawoffsety = 0
offsetdir = 1
jumping = false
if(object_index == obj_brick)
{
	 sprite_index = array_contains(global.undergroundlevels, room) ? spr_underground_brick : spr_brick
}
changetosprite = sprite_index