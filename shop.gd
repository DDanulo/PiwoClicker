extends Node2D
var n = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $Node2D/AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_node_2d_pressed() -> void:
	n = n + 1
	print (n)
	animated_sprite_2d.play("default")
