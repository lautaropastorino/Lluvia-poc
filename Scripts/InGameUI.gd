extends Label

var starting_lives = 5
var remaining_lives = starting_lives - 1
var left_offset = 233
var heart = preload("res://Scenes/Heart.tscn")
var lives = []

func _ready():
	for i in range(0, starting_lives):
		var h = heart.instance()
		h.set_position(Vector2(left_offset + i * 64, 10))
		lives.append(h)
		add_child(h)

func subtract_live():
	if remaining_lives < 0:
		return
		
	lives[remaining_lives].queue_free()
	lives.remove(remaining_lives)
	remaining_lives -= 1	

