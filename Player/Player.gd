extends KinematicBody2D

var motion = Vector2()
var spawn_point = Vector2(100, 100) # coordinates of your initial spawn point
var alive = true

func _physics_process(delta):
	
	motion.y += 10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 200
	elif Input.is_action_pressed("ui_left"):
		motion.x = -200
	else:
		motion.x = 0

	
	move_and_slide(motion)	
	
	pass
	
func _process(delta):
	
	if alive = false:
		position = spawn_point
	
	pass