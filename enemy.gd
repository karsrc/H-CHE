extends CharacterBody2D

@export var speed = 85.0
@export var aggro_range = 600
@export var ok_range = 15
@onready var player = get_tree().get_first_node_in_group("player")


var target_velocity = Vector2.ZERO

func _ready():
	if player == null:
		return
	
	
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")
	

func _physics_process(_delta):
	var offset = player.global_position - global_position
	var direction = offset.normalized()
	var distance = offset.length()
	
	var target_velocity = Vector2.ZERO
	
	if distance < aggro_range:
		var desired_position = player.global_position - direction * ok_range
		var desired_direction = (desired_position - global_position).normalized()

		target_velocity = desired_direction * speed
		velocity = velocity.lerp(target_velocity, 0.15)
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
