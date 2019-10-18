extends Node



func _on_Button1_pressed():
	get_tree().change_scene('res://Levels/Level01.tscn')
	pass # Replace with function body.
	
func _on_Button2_pressed():
	get_tree().change_scene('res://Levels/Level02.tscn')
	pass # Replace with function body.
	
func _on_Button3_pressed():
	get_tree().change_scene('res://Levels/Level03.tscn')
	pass # Replace with function body.


func _on_Back_pressed():
	get_tree().change_scene('res://Menu/MenuInicial.tscn')
	pass # Replace with function body.
