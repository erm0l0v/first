extends KinematicBody2D

export var speed = 450
export var jump_force = 3500
export var gravity = 24000
export var coins_collected = 0


signal coin_collected(total)

var jump_velociry = 0

onready var sprite: AnimatedSprite = get_node("PlayerSprite")

func _ready():
	sprite.playing = true

func _process(delta):
	var velocity = Vector2(0, 0)
	if Input.is_action_pressed("player_right"):
		velocity.x += speed
	elif Input.is_action_pressed("player_left"):
		velocity.x -= speed
	if Input.is_action_just_pressed("player_jump") and self.is_on_floor():
		jump_velociry = jump_force
	velocity.y -= jump_velociry
	jump_velociry -= gravity * delta
	velocity.y += gravity * delta
	
	var result_velosity = move_and_slide(velocity, Vector2.UP)

	if result_velosity.x < 0:
		sprite.flip_h = true
	elif result_velosity.x > 0:
		sprite.flip_h = false

	if result_velosity.x == 0:
		sprite.animation = "Idle"
		sprite.playing = true
	else:
		sprite.animation = "Run"
		sprite.playing = true

func inc_coin():
	self.coins_collected += 1
	emit_signal("coin_collected", self.coins_collected)
