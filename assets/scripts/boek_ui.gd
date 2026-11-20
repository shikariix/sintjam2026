class_name Boek_UI
extends PanelContainer

var is_open: bool

var kid_container_scene: Resource
var kid_grid_container: GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load kid_container for later use
	kid_container_scene = load("res://assets/scenes/kid_container.tscn")
	
	#find container for kid ui
	kid_grid_container = $GridContainer
	
	#make sure is_open is equal to whether the book is actually visible
	is_open = self.visible


func toggle_grote_boek() -> void:
	is_open = !is_open
	self.visible = is_open

func create_kid_UI() -> void:
	#pass data of kid into function
	var kid_container = kid_container_scene.instantiate()
	#fill info accordingly before adding as a child of grid container
	kid_grid_container.add_child(kid_container)
	
	pass
