extends CharacterBody2D

const GRAVITY : int = 4200
const JUMP_SPEED : int = -1800

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	if is_on_floor():
		if not get_parent().game_running:
			$AnimatedSprite2D.play("idle")
		else:
			$RunCol.disabled = false
			if Input.is_action_pressed("ui_accept"):
				velocity.y = JUMP_SPEED
				$JumpSound.play()
			elif Input.is_action_pressed("ui_down"):
				#$JumpSound.play()
				$AnimatedSprite2D.play("duck")
				$RunCol.disabled = false
			else:
				$AnimatedSprite2D.play("run")
				$IdleSound.play()
				
				
	else:
		$AnimatedSprite2D.play("jump")
		$IdleSound.play()
	
	move_and_slide()

