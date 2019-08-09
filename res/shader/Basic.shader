#shader vertex
#version 330 core
layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texCoord;
///layout(location = 2) in vec2 SampleCoord;
out vec2 v_TexCoord;
void main()
{
	gl_Position = position;
	v_TexCoord = texCoord;
}

#shader fragment
#version 330 core

in vec2 v_TexCoord;
layout(location = 0) out vec4 color;
uniform sampler2D u_Texture;
uniform sampler2D colormap;
void main()
{

	float texColor = texture(u_Texture, v_TexCoord).r;
	vec4 samplecolor = texture(colormap, vec2(texColor,0.5));
	color.r = samplecolor.r;
	color.g = samplecolor.g;
	color.b = samplecolor.b;
}