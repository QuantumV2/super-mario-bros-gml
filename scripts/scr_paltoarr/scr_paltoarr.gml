function scr_paltoarr(palette, frame)
{	
    var width = sprite_get_width(palette);
    var height = sprite_get_height(palette);
    var numColors = height;
    
    var colorArray = array_create(numColors);
    
    for (var i = 0; i < numColors; i++)
    {	
        var origColor = sprite_get_pixel(palette, 0, 0, i);
        var swapColor = sprite_get_pixel(palette, frame, 0, i);
        
        colorArray[i][0][0] = origColor[0];
        colorArray[i][0][1] = origColor[1];
        colorArray[i][0][2] = origColor[2];
        
        colorArray[i][1][0] = swapColor[0];
        colorArray[i][1][1] = swapColor[1];
        colorArray[i][1][2] = swapColor[2];
    }
    
    return colorArray;
}