init()

//window_set_fullscreen(true)
if (os_type == os_unknown)
{
    var _info = os_get_info();
    
    if (_info[? "NES"])
    {
        print("what??")
    }
}