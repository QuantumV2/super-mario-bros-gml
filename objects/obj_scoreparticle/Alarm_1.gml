switch(scorenumber)
{
	case 100:
		image_index = 0
		break
	case 200:
		image_index = 1
		break
	case 400:
		image_index = 2
		break
	case 500:
		image_index = 3
		break
	case 800:
		image_index = 4
		break
	case 1000:
		image_index = 5
		break
	case 2000:
		image_index = 6
		break
	case 4000:
		image_index = 7
		break
	case 5000:
		image_index = 8
		break
	case 8000:
		image_index = 9
		break
	case -1:
		image_index = 10
		break
}
if(image_index == 10)
{
	global.lives[global.luigi]++	
}