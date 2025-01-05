extends CharacterBody2D

var speed_direction = Vector2()
@export var MAX_SPEED = 250.0
@export var SLOWDOWN = 10.0
## Add JUMP value, change the value to change how high the player jumps
@export var JUMP = 250.0

const GRAVITY = 400

var has_key = false
@onready var interactable_area: Area2D = $InteractableArea

func _physics_process(delta):
	## Add the gravity to the game cycle
	velocity.y += GRAVITY * delta

	if Input.is_action_pressed("ui_left"):
		speed_direction.x = -1
	elif Input.is_action_pressed("ui_right"):
		speed_direction.x = 1
	else:
		speed_direction.x = 0
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= JUMP
	if Input.is_action_just_pressed("ui_interact"):
		var interactable_objects = interactable_area.get_overlapping_bodies()
		interactable_objects =interactable_objects.filter(func(o):return o.is_in_group("Interactable"))
		if len(interactable_objects) > 0:
			interactable_objects[0].interaction(has_key)
	if speed_direction:
		velocity.x = speed_direction.x * MAX_SPEED
	else:
		##Optional: decrease the speed with some slowdown or just set to 0
		velocity.x = move_toward(velocity.x, 0, SLOWDOWN)
#		velocity.x = 0

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Collectable"):
		if body.has_method("is_a_item_data"):
			var item_data = body.item_data
			
			if item_data.name == "Key":
				has_key = true
		body.queue_free()
