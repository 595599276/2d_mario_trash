extends Camera2D

var player

func _ready():
	player = get_node("/root/MainScene/Player")


func _process(delta):
	position.x = player.position.x
