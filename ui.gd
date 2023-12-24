extends Control

var scoreText

func _ready():
	scoreText = get_node("ScoreText")
	scoreText.text = "0"


func set_score_text(score):
	scoreText.text = str(score)
