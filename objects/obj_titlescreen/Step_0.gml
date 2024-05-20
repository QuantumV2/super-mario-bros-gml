
if(keyboard_check_pressed(vk_enter)){
	if(choice == 1) global.twoplayer = true;
	room_goto(transition)	
}
if(keyboard_check_pressed(vk_up))
{
	choice--;	
}
if(keyboard_check_pressed(vk_down))
{
	choice++;	
}
choice = clamp(choice, 0, 1)

