extends Control

var play_icon: ImageTexture
var pause_icon: ImageTexture

var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var texture = load("res://images/play.png")
	var image : Image = texture.get_data()
	image.resize(512, 512)
	play_icon = ImageTexture.new()
	play_icon.create_from_image(image)
	
	texture = load("res://images/pause.png")
	image = texture.get_data()
	image.resize(512, 512)
	pause_icon = ImageTexture.new()
	pause_icon.create_from_image(image)

func _input(event):
	if event.is_action_pressed("pause"):
		_on_Pause_pressed()

func _on_Pause_pressed():
	var button = get_node("Pause")
	if not paused:
		get_tree().call_group("main_scene", "pause")
		get_node("CenterContainer").set_visible(true)
		paused = true
		button.set_button_icon(play_icon)
	else:
		get_tree().call_group("main_scene", "play")
		get_node("CenterContainer").set_visible(false)
		paused = false
		button.set_button_icon(pause_icon)

func _on_Ir_al_menu_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_Reiniciar_pressed():
	get_tree().call_group("main_scene", "restart")
