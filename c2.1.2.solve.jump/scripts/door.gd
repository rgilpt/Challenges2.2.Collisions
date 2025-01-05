extends StaticBody2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var is_open: bool :
	set(value):
		is_open = value
		if is_open:
			sprite_2d.frame = 1
			collision_shape_2d.disabled = true
		else:
			sprite_2d.frame = 0
			collision_shape_2d.disabled = false
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func interaction(condition):
	is_open = condition
	
	if not is_open:
		get_parent().set_message_text(1)
	else:
		get_parent().set_message_text(2)
