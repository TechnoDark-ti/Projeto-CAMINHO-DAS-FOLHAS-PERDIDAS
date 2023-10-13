extends KinematicBody2D


const speed = 300
var motion = Vector2()

func _physics_process(delta):
	_move(delta)

func _move(delta):
	if Input.is_action_pressed("ui_up"):
		motion.y = -speed
	elif Input.is_action_pressed("ui_down")	:
		motion.y = speed
	else:
		motion.y = 0

	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
	else:
		motion.x = 0
			
	move_and_slide(motion)
