function scr_shine(_alarm){
if(global.paused) exit;
switch(palselect)
{
	case 0:
		palarray = [ [ [ 230,156,33 ],[ 230,156,33 ] ],[ [ 230,156,33 ],[ 230,156,33 ] ],[ [ 0,0,0 ],[ 0,0,0 ] ] ] 
	break
	case 1:
		palarray = [ [ [ 230,156,33 ],[ 156,74,0 ] ],[ [ 230,156,33 ],[ 156,74,0 ] ],[ [ 0,0,0 ],[ 0,0,0 ] ] ] 
	break
	case 2:
		palarray = [ [ [ 230,156,33 ],[ 86,29,0 ] ],[ [ 230,156,33 ],[ 86,29,0 ] ],[ [ 0,0,0 ],[ 0,0,0 ] ] ] 
	break

}
if(array_contains(global.undergroundlevels, room))
{
	palarray[2][1] = [0, 123, 140]
}
if(room != transition)
{
	if(alarm[_alarm] <= 0) { alarm[_alarm] = (60/5); }
}
else
{
	palselect = 0	
}
}