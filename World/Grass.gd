extends Node2D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("player_attack"):
		var grassEffect := load("res://Effects/GrassEffect.tscn")
		var grass_effect: GrassEffect = grassEffect.instantiate()
		var root := get_tree().current_scene
		root.add_child(grass_effect)
		grass_effect.global_position = global_position
		queue_free()
