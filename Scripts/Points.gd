extends Label

var points = 0
const TEXT_PREFIX = "Puntos: "

func _on_Timer_timeout():
	points += 1
	self.set_text(TEXT_PREFIX + String(points))

func get_points():
	return points
