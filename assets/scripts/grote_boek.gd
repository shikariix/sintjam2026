class_name Grote_Boek
extends Node

var book_UI: Boek_UI

func _ready() -> void:
	book_UI = $UI_Boek
	

func toggle_book(new_state: bool) -> void:
	book_UI.toggle_grote_boek(new_state)

func add_kid() -> void:
	#add kid info to book
	pass
	
func init_kids_in_book(kids: Array[Kid_Data]) -> void:
	book_UI.display_kids_info(kids)
		
