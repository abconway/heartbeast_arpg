extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	var grassEffect := load("res://Effects/GrassEffect.tscn")
	var grass_effect: GrassEffect = grassEffect.instantiate()
	var root := get_tree().current_scene
	root.add_child(grass_effect)
	grass_effect.global_position = global_position
	queue_free()
