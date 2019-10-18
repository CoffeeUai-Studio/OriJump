extends Control

func _on_Play_pressed():
	get_tree().change_scene('res://Menu/LevelSelector.tscn')
	pass # Replace with function body.


func _on_Credits_pressed():
	get_tree().change_scene("res://Menu/Controls.tscn")
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.
