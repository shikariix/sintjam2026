extends Node
class_name Display_Kid

@export var debug_data : Kid_Data
@export var base_material_src : Material
@export var hair_material_src : Material
@export var image_side : SIDE = SIDE.LEFT

@export_category("Kid node references")
@export var text_container : VBoxContainer
@export var kid_name : Label
@export var kid_sweetness : Label
@export var kid_request : Label
@export var kid_image_left : Control
@export var kid_image_right : Control
@export var kid_base_visuals : Array[TextureRect]
@export var kid_hair_visuals : Array[TextureRect]

var base_material : Material
var hair_material : Material

enum SIDE { LEFT = 0, RIGHT = 1 }

func _ready():
	if debug_data != null:
		_apply_kid_data(debug_data)
	
	# swap between left / right version of row in book scene
	if text_container != null:
		if image_side == SIDE.RIGHT:
			text_container.layout_direction = Control.LAYOUT_DIRECTION_RTL
	if kid_image_left != null:
		kid_image_left.visible = (image_side == SIDE.LEFT)
	if kid_image_right != null:
		kid_image_right.visible = (image_side == SIDE.RIGHT)

func _apply_kid_data(data : Kid_Data):
	# set text fields based on kid data (for book scene)
	if kid_name != null:
		kid_name.text = data.name
	if kid_sweetness != null:
		# sweetness text is based on the float in the kid data, and then picks the best comment for that
		kid_sweetness.text = data.name + Kid_Data.sweetness_comments[int(floor(data.sweetness * 1.1 * (Kid_Data.sweetness_comments.size() - 1)))]
	if kid_request != null:
		kid_request.text = '\"' + data.request + '\"'
	
	# set local materials, and set parameters based on kid data
	if base_material == null:
		base_material = base_material_src.duplicate()
		for visual : TextureRect in kid_base_visuals:
			visual.material = base_material
	if hair_material == null:
		hair_material = hair_material_src.duplicate()
		for visual : TextureRect in kid_hair_visuals:
			visual.material = hair_material
	
	base_material.set_shader_parameter('skin_color', Kid_Data.skincolor_coords[int(data.skin_color)])
	base_material.set_shader_parameter('shirt_color', Kid_Data.clothescolor_coords[int(data.shirt_color)])
	base_material.set_shader_parameter('pants_color', Kid_Data.clothescolor_coords[int(data.pants_color)])
	base_material.set_shader_parameter('shoes_color', Kid_Data.clothescolor_coords[int(data.shoes_color)])
	hair_material.set_shader_parameter('attribute_color', Kid_Data.haircolor_coords[int(data.hair_color)].y)
	hair_material.set_shader_parameter('current_cell', Kid_Data.hairstyle_coords[int(data.hair_style)])
