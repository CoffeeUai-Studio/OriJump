extends "res://Assets/Jump.gd"

func _ready():
	$Sprite/AnimationPlayer.play("Idle")

func _jump_anim():
	$Sprite/AnimationPlayer.play("Idle")
	$Sprite/AnimationPlayer.queue("Idle")
	pass # Replace with function body.
