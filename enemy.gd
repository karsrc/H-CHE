extends CharacterBody2D

@export var speed = 20.0
@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	if player == null:
		return
		
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	animation()   

func animation():
	if velocity:
		if velocity.x > 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("right")
		elif velocity.x < 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("right")
		elif velocity.y < 0:
			$AnimatedSprite2D.frame = 0
		else:
			$AnimatedSprite2D.frame = 0
	else:
		$AnimatedSprite2D.frame = 0
