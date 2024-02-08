function sprite_get_pixel(sprite, frame, _x, _y)
{
    var surface = surface_create(sprite_get_width(sprite), sprite_get_height(sprite));
    if (surface_exists(surface))
    {
        surface_set_target(surface);
        draw_sprite(sprite, frame, 0, 0);
        surface_reset_target();
        var pixel = surface_getpixel(surface, _x, _y);
        var red = pixel & 255;
        var green = (pixel >> 8) & 255;
        var blue = (pixel >> 16) & 255;
        return [red, green, blue];
    }
    return [-1, -1, -1]; // Return [-1, -1, -1] if the sprite surface doesn't exist
}