extends Area2D

@export var speed : int = 100
@export var moveDist : int = 100

var startX : float
var targetX : float

func _ready():
	startX = position.x
	targetX = position.x + moveDist

func _physics_process(delta):
	position.x = move_to(position.x, targetX, speed * delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX

func move_to(current, to, step):
	var new = current
	
	if new < to:
		new += step
		if new >= targetX:
			new = targetX
	else:
		new -= step
		if new < to:
			new = targetX
	
	return new


func _on_body_entered(body):
	if body.name == "Player":
		body.die()
