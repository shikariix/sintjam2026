extends Node

@export var debug_data : Kid_Data
@export var basematerial : Material
@export var hairmaterial : Material

func _ready():
	if debug_data != null:
		_apply_kid_data(debug_data)

func _apply_kid_data(data : Kid_Data):
	basematerial.set_shader_parameter('skin_color', Kid_Data.skincolor_coords[int(data.skin_color)])
	basematerial.set_shader_parameter('shirt_color', Kid_Data.clothescolor_coords[int(data.shirt_color)])
	basematerial.set_shader_parameter('pants_color', Kid_Data.clothescolor_coords[int(data.pants_color)])
	basematerial.set_shader_parameter('shoes_color', Kid_Data.clothescolor_coords[int(data.shoes_color)])
	hairmaterial.set_shader_parameter('attribute_color', Kid_Data.haircolor_coords[int(data.hair_color)].y)
	hairmaterial.set_shader_parameter('current_cell', Kid_Data.hairstyle_coords[int(data.hair_style)])
