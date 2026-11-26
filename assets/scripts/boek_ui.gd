class_name Boek_UI
extends Control

var is_open: bool

var kid_UI_nodes: Array[Display_Kid]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#make sure is_open is equal to whether the book is actually visible
	is_open = self.visible
	
	#make array of the nodes that will display kid data
	var kid_nodes = find_children("Kid_*", "Display_Kid")
	for kid in kid_nodes:
		kid_UI_nodes.append(kid as Display_Kid)

func toggle_grote_boek(new_state: bool) -> void:
	is_open = new_state
	self.visible = is_open

func display_kids_info(kids: Array[Kid_Data]) -> void:
	for i in kid_UI_nodes.size():
		kid_UI_nodes[i]._apply_kid_data(kids[i])
	pass
