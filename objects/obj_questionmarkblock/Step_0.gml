if(place_meeting(x, y + 1, obj_player) && sprite_index != spr_usedblock && sprite_index != spr_qbbounce && image_yscale > 0)
{
	sprite_index = spr_qbbounce
	mask_index = -1
	if(object == obj_powerup)
	{
		instance_create_layer(x + 8, y-8, "Instances", obj_powerup)
		audio_play_sound(power_up_appear, 10, false)
	}
	else
	{
		audio_play_sound(coin, 10, false)
	}
}
switch(palselect)
{
	case 0:
		palarray = [ [ [ 230,156,33 ],[ 230,156,33 ] ],[ [ 230,156,33 ],[ 230,156,33 ] ],[ [ 230,156,33 ],[ 230,156,33 ] ] ] 
	break
	case 1:
		palarray = [ [ [ 230,156,33 ],[ 156,74,0 ] ],[ [ 230,156,33 ],[ 156,74,0 ] ],[ [ 230,156,33 ],[ 156,74,0 ] ] ] 
	break
	case 2:
		palarray = [ [ [ 230,156,33 ],[ 86,29,0 ] ],[ [ 230,156,33 ],[ 86,29,0 ] ],[ [ 230,156,33 ],[ 86,29,0 ] ] ] 
	break
}
if(alarm[0] <= 0) { alarm[0] = (16); }