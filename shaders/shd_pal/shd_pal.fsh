varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_ColorsToReplace[3];
uniform vec3 u_ReplacementColors[3];
uniform float percis;
uniform int numColors;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 colorToReplace = texColor.rgb * 255.0;

    for (int i = 0; i < numColors; i++) {
        vec3 colorDiff = abs(colorToReplace - u_ColorsToReplace[i]);
        if (colorDiff.r <= 0.3 && colorDiff.g <= 0.3 && colorDiff.b <= 0.3) {
            texColor.rgb = u_ReplacementColors[i] / 255.0;
            break;
        }
    }
    
    gl_FragColor = texColor;
}