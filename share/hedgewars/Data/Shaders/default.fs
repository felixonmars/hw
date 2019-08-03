#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D tex0;
uniform vec4 tint;
uniform bool tintAdd;
uniform bool enableTexture;

varying vec2 tex;


void main()
{
    if(enableTexture){
        if (tintAdd){
            vec4 tint_ = vec4(tint.xyz, 0.0);
            gl_FragColor = clamp(texture2D(tex0, tex) + tint_, 0.0, 1.1);
        }else{
            gl_FragColor = texture2D(tex0, tex) * tint;
        }
    }else{
        gl_FragColor = tint;
    }
}
