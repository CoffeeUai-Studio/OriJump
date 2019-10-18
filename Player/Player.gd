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

var prev_position

onready var animation : AnimationPlayer = $Sprite/AnimationPlayer
onready var music : AudioStreamPlayer = $MusicPlayer
onready var sfx : AudioStreamPlayer = $SFXPlayer
onready var line : Line2D = $Direction

const jump_force = 2000
const gravity = 20

export (float) var max_height

onready var mouse_position = get_global_mouse_position()

func _ready():
	music.play()
	sfx.stream = load("res://Sounds/clear.wav")
	sfx.play()
	prev_position = position

func _physics_process(delta):
	
	# Movimento
	prev_position = position
	
	if motion.x > 0:
		$Sprite.flip_h = false
	elif motion.x < 0:
		$Sprite.flip_h = true


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
	
	
# OriJump-Attack	
func _input(event):
	if event.is_action_pressed("ui_jump"):
		if can_jump == true:
			animation.play("Jump")
			motion = (mouse_position-global_position).normalized() * jumpSpeed
			sfx.stream = load("res://Sounds/Jump.wav")
			sfx.play()
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
	sfx.stream = load("res://Sounds/death.wav")
	sfx.play()
	set_position(spawn_point)
	
	pass 


func _process(delta):
	if alive == false:
		die()
	if prev_position.y == position.y:
		speed_y = 0
		can_jump = true
		if motion.x >= 20 || motion.x <=-20:
			animation.play("Walk")
		else:
			animation.play("Idle")
	else:
		motion.y += gravity * delta
	
	pass
	
	line.look_at(mouse_position)
		
	pass

