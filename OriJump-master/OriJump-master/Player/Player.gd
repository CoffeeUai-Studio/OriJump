extends KinematicBody2D
class_name Player

const move_speed = 100

var motion = Vector2()
export (int) var jumpSpeed 
var direction = Vector2()
var spawn_point = Vector2(100, 100) # coordinates of your initial spawn point
onready var  alive = true
var speed_y = 0

var can_jump = false

onready var line: Line2D = $Direction

const jump_force = 2000
const gravity = 20

export (float) var max_height

onready var mouse_position = get_global_mouse_position()

func _physics_process(delta):
	
	# Movimento
	if is_on_floor():
		speed_y = 0
		can_jump = true
		print(can_jump)
	else:
		motion.y += gravity * delta
	
	if Input.is_action_pressed("ui_down"):
		can_jump = true
	
	if Input.is_action_pressed("ui_right"):
		motion.x = move_speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -move_speed
	else:
		motion.x = motion.x * 0.95
	

	motion.y = (motion.y * 0.9) + gravity
	
	# Recomeca a fase
	if Input.is_action_pressed("ui_restart"):
		die()
		
	# Ativa Tela cheia
	if Input.is_action_just_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen


	mouse_position = get_global_mouse_position()
	
	motion = move_and_slide(motion)
	
	pass
	
# OriJump-Attack	
func _input(event):
	if event.is_action_pressed("ui_jump"):
		if can_jump == true:
			motion = (mouse_position-global_position).normalized() * jumpSpeed
			can_jump = false
	"""
	if event.is_action_pressed("ui_jump"):
#		speed_y = - jump_force
#		set_position(lerp(get_position(), mouse_position, 1))
		jumpMotion = (mouse_position-global_position).normalized() * jumpSpeed
		move_and_slide(jumpMotion)
		"""
	
	
	
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

