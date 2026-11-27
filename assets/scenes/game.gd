extends Node

#game script keeps track of current game state

@export var all_kids: Array[Kid_Data] 

@export var purchased_gifts: Array[Gift_Data] #todo: remove export

var grote_boek: Grote_Boek

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grote_boek = $GroteBoek
	grote_boek.init_kids_in_book(all_kids)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_gift(new_gift: Gift_Data) -> void:
	purchased_gifts.append(new_gift)
	
func remove_gift(index: int) -> void:
	purchased_gifts.remove_at(index)
