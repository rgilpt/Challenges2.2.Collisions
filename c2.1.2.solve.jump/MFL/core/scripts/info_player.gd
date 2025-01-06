extends StaticBody2D

@onready var label: Label = $Label
@export var allow_hide: bool = false
@export var info_message: String = "" : 
	set(value):
		info_message = value
		if label != null:
			label.set_text(value)




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.set_text(info_message)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		label.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and allow_hide:
		label.visible = false
