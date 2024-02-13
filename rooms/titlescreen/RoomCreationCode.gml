window_set_size(256*4, 240*4)
//window_set_fullscreen(true)
if (os_type == os_unknown)
{
    var _info = os_get_info();
    
    if (_info[? "NES"])
    {
        print("what??")
    }
}