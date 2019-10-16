extends KinematicBody2D
class_name Player

var motion = Vector2()
var jumpMotion
export (int) var jumpSpeed 
var direction = Vector2()
var spawn_point = Vector2(100, 100) # coordinates of your initial spawn point
onready var  alive = true
var speed_y = 0

onready var line: Line2D = $Direction

const jump_force = 2000
const gravity = 2500

export (float) var max_height

onready var mouse_position = get_global_mouse_position()

func _physics_process(delta):
	
	# Movimento
	if is_on_floor()==false:
		
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
	
# OriJump-Attack	
func _input(event):
	if event.is_action_pressed("ui_jump"):
#		speed_y = - jump_force
#		set_position(lerp(get_position(), mouse_position, 1))
		jumpMotion = mouse_position.normalized() * jumpSpeed 
		move_and_slide(jumpMotion)
	
	
	
	pass
	
func die ():
	alive == true
	set_position(spawn_point)
	print("aaah")
	
	pass 


func _process(delta):
	if alive == false:
		die()
	
	line.look_at(mouse_position)
		
	pass

