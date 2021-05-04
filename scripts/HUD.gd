extends Node2D

var coins_count: int = 0
onready var label = get_node("CoinsCollected")

func _process(delta):
	label.text = str(self.coins_count)
