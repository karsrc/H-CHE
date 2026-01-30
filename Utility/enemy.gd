extends CharacterBody2D

@export var speed = 85.0
@export var aggro_range = 600
@export var hp = 10
@onready var player = get_tree().get_first_node_in_group("player")

var target_velocity = Vector2.ZERO

func _ready():
	if player == null:
		return
	
	
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")
	

func _physics_process(_delta):
	if player == null:
		return
	
	collision_layer = 2
	var offset = player.global_position - global_position
	var distance = offset.length()
	
	if distance < aggro_range:
		var direction = offset.normalized()
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
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

func _on_hurtbox_hurt(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
	
