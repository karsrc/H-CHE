extends CharacterBody2D

var direction: Vector2 = Vector2(1,1)
var speed = 140

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	animation()
	move_and_slide()
	
func animation():
	if direction:
		if direction.x > 0:
			$AnimatedSprite2D.play("right")
		elif direction.x < 0:
			$AnimatedSprite2D.play("left")
		elif direction.y <0:
			$AnimatedSprite2D.play("up")
		else:
			$AnimatedSprite2D.play("down")
	else:
		$AnimatedSprite2D.frame = 0
