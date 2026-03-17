varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;

void main()
{
    vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Blue-green tint
    col.r *= 0.6;
    col.g *= 0.85;
    col.b *= 1.2;
    
    // Subtle wave shimmer
    float wave = sin(v_vTexcoord.y * 20.0 + u_time * 2.0) * 0.03;
    col.rgb += wave;
    
    gl_FragColor = col;
}