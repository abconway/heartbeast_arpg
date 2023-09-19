extends CharacterBody2D
class_name Player

@export var acceleration := 800
@export var max_speed := 80

@onready var animation_player := $AnimationPlayer
@onready var animation_tree := $AnimationTree
@onready var animation_state = animation_tree.get("parameters/playback")

enum states {
	MOVE,
	ROLL,
	ATTACK,
}
var state: states = states.MOVE


func _ready() -> void:
	animation_tree.active = true


func _physics_process(delta: float) -> void:
	match state:
		states.MOVE:
			move_state(delta)
		states.ROLL:
			pass
		states.ATTACK:
			attack_state(delta)


func attack_state(delta: float) -> void:
	animation_state.travel("Attack")


func attack_animation_finished() -> void:
	state = states.MOVE


func move_state(delta: float) -> void:
	# Input.get_vector returns a normalized vector
	var input_vector := Input.get_vector("player_move_left", "player_move_right", "player_move_up", "player_move_down")
	
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_tree.set("parameters/Attack/blend_position", input_vector)
		animation_state.travel("Run")
	else:
		animation_state.travel("Idle")
	
	velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	move_and_slide()
	
	if Input.is_action_just_pressed("player_attack"):
		state = states.ATTACK
