extends TextureRect

##object can be picked up and moved around scene
##object can be dropped on specific spots on map
##dropping makes it disappear and connects it to information on map point

@export var present_data: Present_Resource

func _ready() -> void:
	set_texture(present_data.texture)
	
func _get_drag_data(at_position: Vector2) -> Variant:
	print(at_position)
	
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.size = Vector2(20,20)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	return present_data
