if(keyboard_check_pressed(vk_enter)){
	if(choice == 1) global.twoplayer = true;
	room_goto(transition)	
}
var move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
if move != 0
	choice += move

choice = clamp(choice, 0, 1)

