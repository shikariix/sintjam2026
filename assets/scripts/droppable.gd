extends TextureRect

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Present_Resource
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	set_texture(data.texture)
