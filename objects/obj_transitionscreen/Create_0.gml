audio_stop_all()
level = asset_get_index("mario_" + string(global.world) + "_" + string(global.level))
if(global.luigi)
{
	palarray = [ [ [ 181,49,32 ],[ 255,254,255 ] ],[ [ 234,158,34 ],[ 234,158,34 ] ],[ [ 107,109,0 ],[ 56,135,0 ] ] ] 
}
else
{
	palarray = [ [ [ 181,49,32 ],[ 181,49,32 ] ],[ [ 234,158,34 ],[ 234,158,34 ] ],[ [ 107,109,0 ],[ 107,109,0 ] ] ] 
}
if((global.lives[!global.luigi] == 0 && global.twoplayer) || (global.lives[global.luigi] == 0 && !global.twoplayer))
{
	sprite_index  = spr_gameover
	alarm_set(0, 60 * 3.77);
	audio_play_sound(game_over, 10, false)
}
else
{
	alarm_set(0, 60 * 2.5);	
}