extends Node

var score := 0
@onready var label: Label = $UI/ScoreLabel
@onready var winlabel: Label = $UI/WinLabel

func _ready():
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.collected.connect(_on_coin_collected)
	label.text = "Coins: 0"
	winlabel.hide()

func _on_coin_collected():
	score += 1
	label.text = "Coins: %d" % score
	if score >= 4:
		winlabel.show()
