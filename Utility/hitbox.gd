extends Area2D

@export var damage = 1
@export var hp =1
@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableHitBoxTimer

func tempdisable():
	collision.call_deferred("set", "disabled", true)
	disableTimer.start()

func _on_disable_hit_box_timer_timeout():
	collision.call_deffered("set", "disabled", false)


func _on_hurtbox_hurt(damage: Variant) -> void:
	hp -= damage
	if hp <= 0:
		queue_free()
#W
