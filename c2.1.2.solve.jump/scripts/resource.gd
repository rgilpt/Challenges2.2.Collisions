
extends CharacterBody2D

const SLOWDOWN = 5



@export var item_data:ItemData: set = set_item_data
@onready var sprite_2d = $Sprite2D

@onready var label = $Label
@onready var panel = $Panel

var was_deleted = false

signal is_sleeping
func _ready():
	if item_data:
		sprite_2d.texture = item_data.texture
	
	set_quality_color()

func set_item_data(i_data):
	item_data = i_data
	if i_data == null or sprite_2d == null:
		return
	#sprite_2d.region_enabled = true
	sprite_2d.texture = item_data.texture
	set_quality_color()
	
func is_a_item_data():
	if !was_deleted:
		return true
	else:
		return false

func set_quality_color():
	var style:StyleBoxFlat = StyleBoxFlat.new()
	#var style = panel.get_theme_stylebox("panel")
	match item_data.my_quality:
		ItemData.ItemQuality.awful:
			style.bg_color =  Color("#a5a5a580")
		ItemData.ItemQuality.poor:
			style.bg_color =  Color("#aaac3280")
		ItemData.ItemQuality.normal:
			style.bg_color =  Color("#6cbc6380")
		ItemData.ItemQuality.good:
			style.bg_color =  Color("#4e59bd80")
		ItemData.ItemQuality.excelent:
			style.bg_color =  Color("#8443a880")
		ItemData.ItemQuality.masterful:
			style.bg_color =  Color("#a6366880")
		ItemData.ItemQuality.lengendary:
			style.bg_color =  Color("#b9852880")
	
	panel.add_theme_stylebox_override("panel", style)
			

func _physics_process(delta):
	
	move_and_slide()
	
	velocity.x = move_toward(velocity.x, 0, SLOWDOWN)
	velocity.y = move_toward(velocity.y, 0, SLOWDOWN)
	if label != null and item_data != null:
		label.set_text(str(item_data.own_health))
	


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				is_sleeping.emit()
