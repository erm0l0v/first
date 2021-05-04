extends Node2D

onready var hud = get_node("MainCamera/HUD")

func _ready():
	pass


func _on_Player_coin_collected(total):
	hud.coins_count = total
