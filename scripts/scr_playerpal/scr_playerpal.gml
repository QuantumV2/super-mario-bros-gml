// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerpal(){
	if(powerup != 1)
	{
		if(global.luigi)
		{
			palarray = [ [ [ 181,49,32 ],[ 255,254,255 ] ],[ [ 234,158,34 ],[ 234,158,34 ] ],[ [ 107,109,0 ],[ 56,135,0 ] ] ] 
		}
		else
		{
			palarray = [ [ [ 181,49,32 ],[ 181,49,32 ] ],[ [ 234,158,34 ],[ 234,158,34 ] ],[ [ 107,109,0 ],[ 107,109,0 ] ] ] 
		}
	}
	else
	{
		palarray = [ [ [ 181,49,32 ],[ 247,216,165 ] ],[ [ 234,158,34 ],[ 234,158,34 ] ],[ [ 107,109,0 ],[ 181,49,32 ] ] ] 
	}
}