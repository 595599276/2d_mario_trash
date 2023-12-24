extends CharacterBody2D

var score : int = 0

var speed : int = 200
var jumpForce : int = 600
var gravite : int = 1200

var grounded : bool = false

var sprite
var ui

func _ready():
	sprite = $Sprite
	ui = get_node("/root/MainScene/CanvasLayer/UI")

func _physics_process(delta):
	velocity.x = Input.get_action_strength("move_right") * speed - Input.get_action_strength("move_left") * speed
	move_and_slide()
	
	velocity.y += gravite * delta
	print(velocity.y)
	if Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y = -jumpForce
	
	
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	
func die():
	get_tree().reload_current_scene()

func collect_coin(value):
	score += value
	ui.set_score_text(score)
	
	
