extends Node2D

func set_points(points):
	var puntos: Label = get_node("CenterContainer/VBoxContainer/Puntos")
	puntos.set_text(puntos.get_text().replace("{points}", String(points)))
