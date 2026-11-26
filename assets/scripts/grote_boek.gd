class_name Grote_Boek
extends Node

@export var all_kids: Array[Kid_Data] 
@export var purchased_gifts: Array[Present_Resource] #todo: remove export

var book_UI: Boek_UI

func _ready() -> void:
	book_UI = $UI_Boek
	

func toggle_book(new_state: bool) -> void:
	book_UI.toggle_grote_boek(new_state)

func add_gift(new_gift: Present_Resource) -> void:
	purchased_gifts.append(new_gift)
	
func remove_gift(index: int) -> void:
	purchased_gifts.remove_at(index)

func add_kid() -> void:
	#add kid info to book
	pass
	
