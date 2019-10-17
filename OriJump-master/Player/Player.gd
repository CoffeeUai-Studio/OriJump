extends KinematicBody2D
class_name Player

var motion = Vector2()
var spawn_point = Vector2(100, 100) # coordinates of your initial spawn point
onready var  alive = true
var speed_y = 0

const jump_force = 2000
const gravity = 2500

onready var mouse_position = get_global_mouse_position()

func _physics_process(delta):
	
	# Movimento
	motion.y = speed_y * delta
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	else:
		motion.x = 0
	
	
	
	speed_y += gravity * delta
	
	# Recomeca a fase
	if Input.is_action_pressed("ui_restart"):
		die()
		
	# Ativa Tela cheia
	if Input.is_action_just_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen


	mouse_position = get_global_mouse_position()	
	
	
	move_and_slide(motion)	
	
	pass
	
# OriJump	
func _input(event):
	if event.is_action_pressed("ui_jump"):
#		speed_y = - jump_force
		set_position(lerp(get_position(), mouse_position, 1))

		print(mouse_position)
	
	
	pass
	
func die ():
	alive == true
	set_position(spawn_point)
	print("aaah")
	
	pass 


func _process(delta):
	if alive == false:
		die()
	
	
		
	pass

