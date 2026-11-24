shader_type canvas_item;
render_mode unshaded;

uniform sampler2D noise_tex : repeat_enable;
uniform float wiggle_intensity = .5;

uniform sampler2D skin_color_tex : repeat_enable;
uniform vec2 skin_color = vec2(0, 0);
uniform sampler2D shoes_color_tex : repeat_enable;
uniform vec2 shoes_color = vec2(0, 0);
uniform sampler2D shirt_color_tex : repeat_enable;
uniform vec2 shirt_color = vec2(0, 0);
uniform sampler2D pants_color_tex : repeat_enable;
uniform vec2 pants_color = vec2(0, 0);

varying vec4 vertex_color;
varying vec2 pixel_size_inverse;

void vertex() {
	vertex_color = COLOR;
	pixel_size_inverse = TEXTURE_PIXEL_SIZE;
}

void fragment() {
	float time = floor(TIME * 3.0) * .178 + vertex_color.r;
	vec2 noise = texture(noise_tex, UV * 3.0 + vec2(time, time * 1.3)).rg;
	vec2 uv = UV + (noise - vec2(.5, .5)) * 10.0 * wiggle_intensity * pixel_size_inverse;
	vec4 color = texture(TEXTURE, uv);
	
	// check which part it is based on rgb channel packing
	float is_shoes = step(.5, color.r);
	float is_shirt = step(.5, color.g);
	float is_pants = step(.5, color.b);
	float is_skin = step(2.5, is_shoes + is_shirt + is_pants);
	float is_eyes = clamp(1.0 - is_shoes - is_shirt - is_pants, 0, 1);
	
	// sample colormaps
	vec3 shoes = texture(shoes_color_tex, shoes_color - vec2(vertex_color.g, 0)).rgb;
	vec3 shirt = texture(shirt_color_tex, shirt_color - vec2(vertex_color.g, 0)).rgb;
	vec3 pants = texture(pants_color_tex, pants_color - vec2(vertex_color.g, 0)).rgb;
	vec3 skin = texture(skin_color_tex, skin_color - vec2(vertex_color.g * .4, 0)).rgb;
	
	// set correct color based on part
	color.rgb = mix(color.rgb, shoes, is_shoes);
	color.rgb = mix(color.rgb, shirt, is_shirt);
	color.rgb = mix(color.rgb, pants, is_pants);
	color.rgb = mix(color.rgb, skin, is_skin);
	
	COLOR = color;
	COLOR.a *= vertex_color.a * max(max(is_skin, is_eyes), vertex_color.b);
}
