extends Node
@onready var score_label = $scoreLabel

var score = 0


func add_point():
	score +=1
	score_label.text = "Coins: " + str(score)
	print(score)
