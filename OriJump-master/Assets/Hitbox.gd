extends Node2D
class_name Hitbox

onready var Player = load("res://Player/Player.tscn")

func _on_Area2D_body_entered(body):
	 if body.has_method('die'):
        body.die()
		print("Certo")

		pass
	 # Replace with function body.
