shader_type canvas_item;
render_mode unshaded;

uniform sampler2D noise_tex : repeat_enable;
uniform float wiggle_intensity = .5;

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
	COLOR = texture(TEXTURE, uv);
	COLOR.a *= vertex_color.a;
}
