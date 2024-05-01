#05/08/2023- 23:50
#Obrigado cidadão anônimo do discord!!!
extends KinematicBody2D

onready var jumpTimer = $JumpTimer

var vector = Vector2()
var speed = 110
var jumpforce = 230
var gravity = 560#400
var jumpAvaibility: bool

#-------------------MOVIMENT-------------------------------------
func input_movement():
	if is_on_floor():
		jumpAvaibility = true
	elif jumpAvaibility == true && jumpTimer.is_stopped():
		jumpTimer.start()
	vector.x = 0
	
	var parouPular = Input.is_action_just_released("jump")
	var pulou = Input.is_action_just_pressed('jump')
	var direction = Input.get_axis('walk_left', 'walk_right')
	
	if is_on_floor():
		vector.y = 0
	if pulou and jumpAvaibility:
		vector.y -= jumpforce
	if parouPular and not is_on_floor() and vector.y < 0:
		vector.y /= 3
		
	vector.x = speed * direction
	
func _physics_process(delta):
	input_movement()
	vector.y += gravity * delta
# warning-ignore:return_value_discarded
	move_and_slide(vector,Vector2.UP)
	pass
#-------------------ANIMATIONS-------------------------------------
	# Animação
	_set_animation()
		
	# Inverter sprite
	if vector.x < 0:
		$Sprite.flip_h = true
	elif vector.x > 0:
		$Sprite.flip_h = false

func _set_animation():
	var anim
	
	if vector.x != 0:
		anim = "Walk"
	else:
		anim = "Idle"
	
	if vector.y <= 0:
		anim = "Jump"
	
	#if vector.y == -1:
		#anim = "Fall"


	$AnimationPlayer.play(anim)


func _on_JumpTimer_timeout():
	jumpAvaibility = false

#-------------------MENU-------------------------------------------
