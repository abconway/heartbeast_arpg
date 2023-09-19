extends Node2D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("player_attack"):
		var grassEffect := load("res://Effects/GrassEffect.tscn")
		var grass_effect: GrassEffect = grassEffect.instance()
		var root := get_tree().current_scene
		
		queue_free()
