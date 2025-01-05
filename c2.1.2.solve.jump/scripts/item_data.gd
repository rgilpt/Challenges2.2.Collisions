extends Resource
class_name ItemData

enum ItemSize{
	
	small,
	medium,
	large
}
enum ItemQuality{
	awful,
	poor,
	normal,
	good,
	excelent,
	masterful,
	lengendary
}

@export var name: String = ""
@export_multiline var description: String = "no desc."
@export var size: ItemSize = ItemSize.small
@export var texture: AtlasTexture
@export var is_weapon: bool = false
@export var weapon_damage: float = 1.0
@export var my_quality: ItemQuality = ItemQuality.normal

@export var base_health: float = 100
@export var own_health: float = 100

@export var minmum_crafting:Array[String] = []

@export var is_edible:bool = false
@export var nutrient_value:float = 0.0

@export var allow_sleep:bool = false
@export var allow_sit:bool = false

@export var is_special:bool = false
@export var special_scene:String = ""

@export var fuel:float = 0

@export var coin_value:float = 0

@export var dna:Dictionary
var is_broken = false

signal this_object_is_broken

func get_damage(how_much):
	own_health -= how_much 
	if own_health < 0:
		is_broken = true
		this_object_is_broken.emit()
