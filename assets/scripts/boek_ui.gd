class_name Boek_UI
extends Control

var is_open: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#make sure is_open is equal to whether the book is actually visible
	is_open = self.visible


func toggle_grote_boek() -> void:
	is_open = !is_open
	self.visible = is_open


func _on_close_button_button_up() -> void:
	pass # Replace with function body.
