extends Area2D

export (int) var nextlevel 


func _on_Area2D_body_entered(body):
    get_tree().change_scene('res://Levels/Level'+'nextlevel'+'.tscn')
    pass # Replace with function body.