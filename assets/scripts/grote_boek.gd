class_name Grote_Boek
extends Node

var kids: Array[String] #moet een array van kinderen worden?
@export var purchased_gifts: Array[Present_Resource] #todo: remove export

func add_gift(new_gift: Present_Resource) -> void:
	purchased_gifts.append(new_gift)
	
func remove_gift(index: int) -> void:
	purchased_gifts.remove_at(index)

func add_kid() -> void:
	#add kid info to book
	pass
	
