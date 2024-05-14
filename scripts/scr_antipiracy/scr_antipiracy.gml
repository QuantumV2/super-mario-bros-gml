if(!file_exists("smb.nes") || (file_exists("smb.nes") && md5_file("smb.nes") != "811b027eaf99c2def7b933c5208636de"))
{
	show_message(@"Unable to detect the ROM file, please ensure it's located in the same folder as this executable. If it exists, please ensure it's unmodified and its name is 'smb.nes'. 
	
The game will now shut down.	")
	game_end()
}
