extends Node2D

var rng = RandomNumberGenerator.new()

var player = preload("res://Scenes/Player.tscn")
var raindrop = preload("res://Scenes/RainDrop.tscn")
var game_over = preload("res://Scenes/GameOver.tscn")

var game_is_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var p = player.instance()
	add_child(p)
	get_node("AudioStreamPlayer").play()

func _on_Timer_timeout():
	var e = raindrop.instance()
	add_child(e)
	
func game_over():
	game_is_over = true
	get_node("Timer").stop()
	get_node("AudioStreamPlayer").stop()
	get_node("DificultyTimer").stop()
	get_node("Points/Timer").stop()
	var g = game_over.instance()
	g.set_points(get_node("Points").get_points())
	add_child(g)

func _input(event):
	if not game_is_over:
		return
	
	if event.is_action_pressed("restart"):
		restart()
	elif event.is_action_pressed("menu"):
		get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_DificultyTimer_timeout():
	var timer: Timer = get_node("Timer")
	timer.set_wait_time(timer.get_wait_time() - 0.01)

func pause():
	Globals.set_pause(true)
	get_node("Timer").stop()
	get_node("DificultyTimer").stop()
	get_node("Points/Timer").stop()

func play():
	Globals.set_pause(false)
	get_tree().call_group("rain_drop", "play")
	get_node("Timer").start()
	get_node("DificultyTimer").start()
	get_node("Points/Timer").start()

func restart():
	get_tree().reload_current_scene()
