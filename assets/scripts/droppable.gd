extends Control

var texture_for_drop: TextureRect

func _ready() -> void:
	texture_for_drop = $HBoxContainer/TextureRect_DroppedObject

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Gift_Data
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	texture_for_drop.set_texture(data.texture)
