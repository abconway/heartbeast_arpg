extends CharacterBody2D
class_name Player

@export var acceleration := 800
@export var max_speed := 80

@onready var animation_player := $AnimationPlayer
@onready var animation_tree := $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")


func _physics_process(delta: float) -> void:
	# Input.get_vector returns a normalized vector
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_state.travel("Run")
	else:
		animation_state.travel("Idle")
	
	velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	move_and_slide()
