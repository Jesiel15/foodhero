extends KinematicBody2D

const ACCELERATION = 1000
const MAX_SPEED = 800
const FRICTION = 3000

var velocity = Vector2.ZERO

#Para animação do Player
onready var animationPlayer = $AnimationPlayer


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		#Para animação do Player
		if input_vector.x > 0:
			animationPlayer.play("IdleRight")
		else:
			animationPlayer.play("IdleLeft")
	
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		#print(velocity)
	else:
		animationPlayer.play("IdleDown")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta )
		
	velocity = move_and_slide(velocity)
