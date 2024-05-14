function scr_palswap_set(_array){
shader_set(shd_pal)
// why is this trycaught?
try
{

	// Set the uniform values
	var numColors = array_length(_array);
	var colorsToRep = shader_get_uniform(shd_pal, "u_ColorsToReplace");
	var repColors = shader_get_uniform(shd_pal, "u_ReplacementColors");

	shader_set_uniform_i(shader_get_uniform(shd_pal, "numColors"), numColors);

	var colToRepArr = []
	var repColArr = []

	for (var i = 0; i < numColors; i++)
	{
		var origColor = _array[i][0];
		var swapColor = _array[i][1];
    
		array_push(colToRepArr, origColor[0], origColor[1], origColor[2])
		array_push(repColArr, swapColor[0], swapColor[1], swapColor[2])
    

	}
	

	shader_set_uniform_f_array(colorsToRep, colToRepArr);
	shader_set_uniform_f_array(repColors, repColArr);

}
catch(ex){}
}