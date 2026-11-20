class_name Kid_Data
extends Resource

@export var name : String

@export_category("visuals")
@export var hair_style : HAIRSTYLE
@export var hair_color : HAIRCOLOR
@export var skin_color : SKINCOLOR
@export var shirt_color : CLOTHESCOLOR
@export var pants_color : CLOTHESCOLOR
@export var shoes_color : CLOTHESCOLOR
# enums keys and matching coordinates at bottom of script for ease of adding new properties

func _init( p_name = "", 
			p_hair_style = HAIRSTYLE.DIAGONAL, 
			p_hair_color = HAIRCOLOR.WHITE, 
			p_skin_color = SKINCOLOR.RUST, 
			p_shirt_color = CLOTHESCOLOR.WHITE, 
			p_pants_color = CLOTHESCOLOR.WHITE, 
			p_shoes_color = CLOTHESCOLOR.WHITE ):
	name = p_name
	hair_style = p_hair_style
	hair_color = p_hair_color
	skin_color = p_skin_color
	shirt_color = p_shirt_color
	pants_color = p_pants_color
	shoes_color = p_shoes_color



# ENUMS AND MATCHING VECTORS
enum HAIRCOLOR { WHITE = 0, RED = 1, GINGER = 2, BLONDE = 3, BROWN = 4, DARK_BROWN = 5, BLUEBLACK = 6, PURPLE = 7 }
enum SKINCOLOR { DARK = 0, RUST = 1, BROWN = 2, ORANGE = 3, TAN = 4, PALE = 5, PALLID = 6 }
enum CLOTHESCOLOR { WHITE = 0, GREY = 1, LIGHT_RED = 2, RED = 3, YELLOW = 4, GREEN = 5, LIGHT_BLUE = 6, BLUE = 7, PURPLE = 8, PINK = 9, HOT_PINK = 10 }
enum HAIRSTYLE { BALD = 0, DIAGONAL = 1, MIDDLE_PART = 2, SPIKY = 3, 
				EMO = 4, CURLY_SHORT = 5, CURLY_SQUARE = 6, BOWL = 7, 
				LONG_STRAIGTH = 8, BRAIDS = 9, PIGTAILS = 10, LONG_CURLY = 11, 
				DOUBLE_BUNS = 12, BOB = 13, SINGLE_BUN = 14, MOHAWK = 15 }

const haircolor_coords : Array[Vector2] = [ Vector2(.0, .1), Vector2(.0, .2), Vector2(.0, .3), Vector2(.0, .4), Vector2(.0, .6), Vector2(.0, .7), Vector2(.0, .8), Vector2(.0, .9) ]
const skincolor_coords : Array[Vector2] = [ Vector2(.2, .0), Vector2(.3, .0), Vector2(.45, .0), Vector2(.5, .0), Vector2(.6, .0), Vector2(.75, .0), Vector2(.9, .0) ]
const clothescolor_coords : Array[Vector2] = [ Vector2(.8, .1), Vector2(.6, .1), Vector2(.8, .2), Vector2(.6, .2), Vector2(.6, .4), Vector2(.6, .6), 
											Vector2(.8, .7), Vector2(.6, .7), Vector2(.6, .8), Vector2(.8, .9), Vector2(.6, .9) ]
const hairstyle_coords : Array[Vector2] = [ Vector2(0, 0), Vector2(1, 0), Vector2(2, 0), Vector2(3, 0), 
											Vector2(0, 1), Vector2(1, 1), Vector2(2, 1), Vector2(3, 1), 
											Vector2(0, 2), Vector2(1, 2), Vector2(2, 2), Vector2(3, 2), 
											Vector2(0, 3), Vector2(1, 3), Vector2(2, 3), Vector2(3, 3) ]
