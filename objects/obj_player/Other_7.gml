if(sprite_index = spr_mario_grow)
{
	big = true
	frozen = false
	vsp = 0
	is_jumping = false
	hsp = 0
	sprite_index = spr_bigmario_idle
}
if(sprite_index = spr_mario_shrink)
{
	big = false
	frozen = false
	vsp = 0
	hsp = 0
	sprite_index = spr_mario_idle
	obj_player.invisframes = 60 * 2;
}
if(sprite_index = spr_bigmario_firetransform)
{
	powerup = true
	frozen = false
	vsp = 0
	is_jumping = false
	hsp = 0
	sprite_index = spr_bigmario_idle
}