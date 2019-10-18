extends Node2D

func _on_Area2D_body_entered(body):
	if body.has_method('die'):
		get_tree().change_scene('res://Levels/Level02.tscn')
		print("PROXIMOO")
	pass # Replace with function body.
