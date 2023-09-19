extends Node2D
class_name GrassEffect


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	animated_sprite.play("GrassEffect")


func _on_animated_sprite_animation_finished() -> void:
	queue_free()
