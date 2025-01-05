extends StaticBody2D
@onready var label: Label = $Label
@onready var door: StaticBody2D = $Door

var messages = [
	"Press E to Interact",
	"You need a key to open!",
	"Well done!",
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		label.visible = true

func interaction(condition):
	if not door.is_open and condition:
		door.is_open = true
		label.set_text(messages[2])
	else:
		label.set_text(messages[1])
		
func set_message_text(index):
	label.set_text(messages[index])
