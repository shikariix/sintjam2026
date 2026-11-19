class_name Valid_Coordinates
extends Resource

@export var name : String
@export var coordinates : Array[Vector2]

func _init(p_name = "", p_coordinates = [] as Array[Vector2]):
	name = p_name
	coordinates = p_coordinates
