extends Node2D

onready var Player = load("res://Player/Player.tscn")

func _on_Area2D_body_entered(body):
		
	if body.has_method('die'):
		body.can_jump = true
		
	pass # Replace with function body.
