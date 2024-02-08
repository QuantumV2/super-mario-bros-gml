function scr_overflow(value, minimal, maximum){
	if(value < minimal)
	{
		return maximum
	}
	else if(value > maximum)
	{
		return minimal
	}
	else
	{
		return value
	}
}