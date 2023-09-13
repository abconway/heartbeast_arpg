extends CharacterBody2D
class_name Player

@export var acceleration := 25
@export var friction := 50
@export var max_speed := 150


func _physics_process(delta: float) -> void:
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	input_vector = input_vector.normalized()
	
	if input_vector.x != 0:
		velocity.x += input_vector.x * acceleration * delta
		velocity.x = clampf(velocity.x, -max_speed * delta * abs(input_vector.x), max_speed * delta * abs(input_vector.x))
	else:
		velocity.x = velocity.move_toward(Vector2.ZERO, friction * delta).x
	if input_vector.y != 0:
		velocity.y += input_vector.y * acceleration * delta
		velocity.y = clampf(velocity.y, -max_speed * delta * abs(input_vector.y), max_speed * delta * abs(input_vector.y))
	else:
		velocity.y = velocity.move_toward(Vector2.ZERO, friction * delta).y
	
	move_and_collide(velocity)
