extends Camera2D

const CENTER_PROPORTION = 3
onready var player = get_parent().get_node("Player")
onready var map = get_parent().get_node("Map")

onready var half_width = self.get_viewport().get_visible_rect().size.x / 2

func _ready():
	self.current = true

func _process(delta):
	var next_position = self.position.x
	var position_diff = player.position.x - self.position.x
	if abs(position_diff) > half_width / CENTER_PROPORTION:
		if position_diff >= 0:
			next_position = self.position.x + (position_diff - half_width / CENTER_PROPORTION)
		else:
			next_position = self.position.x + (position_diff + half_width / CENTER_PROPORTION)

	if next_position - half_width < map.start:
		next_position = map.start + half_width
	elif next_position + half_width > map.end:
		next_position = map.end - half_width
	self.position.x = next_position
