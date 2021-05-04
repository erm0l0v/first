extends Area2D

onready var animation = get_node("AnimatedSprite")
var picked = false


func _on_body_entered(body):
	if body.is_in_group("player") and not picked:
		body.inc_coin()
		picked = true
		animation.animation = "PickUp"
		animation.playing = true


func _on_animation_finished():
	if picked:
		queue_free()
