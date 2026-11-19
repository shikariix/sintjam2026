extends Node

@export var basematerial : Material
@export var hairmaterial : Material
@export var skin_coords : Valid_Coordinates
@export var shirt_coords : Valid_Coordinates
@export var hair_coords : Valid_Coordinates

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_generate_random_kid()

func _generate_random_kid():
	var skin : Vector2 = skin_coords.coordinates[randi_range(0, skin_coords.coordinates.size() - 1)]
	var shirt : Vector2 = shirt_coords.coordinates[randi_range(0, shirt_coords.coordinates.size() - 1)]
	var pants : Vector2 = shirt_coords.coordinates[randi_range(0, shirt_coords.coordinates.size() - 1)]
	var shoes : Vector2 = shirt_coords.coordinates[randi_range(0, shirt_coords.coordinates.size() - 1)]
	basematerial.set_shader_parameter('skin_color', skin)
	basematerial.set_shader_parameter('shirt_color', shirt)
	basematerial.set_shader_parameter('pants_color', pants)
	basematerial.set_shader_parameter('shoes_color', shoes)
	var hair : float = hair_coords.coordinates[randi_range(0, hair_coords.coordinates.size() - 1)].y
	var hair_cell : Vector2 = Vector2(0, 0)
	hair_cell.x = randi_range(0, 3)
	hair_cell.y = randi_range(0, 3)
	hairmaterial.set_shader_parameter('attribute_color', hair)
	hairmaterial.set_shader_parameter('current_cell', hair_cell)
	
	
