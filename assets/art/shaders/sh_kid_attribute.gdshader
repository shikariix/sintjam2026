shader_type canvas_item;
render_mode unshaded;

uniform sampler2D noise_tex : repeat_enable;
uniform float wiggle_intensity = .5;

uniform vec2 cells = vec2(4, 4);
uniform vec2 current_cell = vec2(0, 0);

uniform sampler2D attribute_color_tex : repeat_enable;
uniform float attribute_color = .1;

varying vec4 vertex_color;
varying vec2 pixel_size_inverse;
varying vec2 cells_inverse;

void vertex() {
	vertex_color = COLOR;
	pixel_size_inverse = TEXTURE_PIXEL_SIZE;
	cells_inverse = vec2(1, 1) / cells;
}

void fragment() {
	float time = floor(TIME * 3.0) * .178 + vertex_color.r;
	vec2 noise = texture(noise_tex, UV * 3.0 + vec2(time, time * 1.3)).rg;
	vec2 uv = UV * cells_inverse + current_cell * cells_inverse;
	uv += (noise - vec2(.5, .5)) * 10.0 * wiggle_intensity * pixel_size_inverse;
	vec4 color = texture(TEXTURE, uv);
	
	color.rgb = texture(attribute_color_tex, vec2(-vertex_color.r, attribute_color)).rgb;
	
	COLOR = color;
	COLOR.a *= vertex_color.a;
}
