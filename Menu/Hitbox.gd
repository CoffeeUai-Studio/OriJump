extends Node2D

onready var player = get_node("Player")

func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		player.alive = false 
		print("dead")
	
	pass # Replace with function body.
