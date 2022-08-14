extends KinematicBody2D

var rng = RandomNumberGenerator.new()
var x_size = OS.window_size.x
var y_size = OS.window_size.y

const WALK_SPEED = 600

var velocity = Vector2()
var lives = 5

onready var sprite = get_node("Sprite")
onready var half_sprite_size = 32

func _ready():
	rng.randomize()
	var random_x = rng.randf_range(10, OS.window_size.x - 10)
	self.set_position(Vector2(random_x, y_size * 0.83))

func _physics_process(delta):
	if lives < 0 or Globals.get_pause():
		return
	
	if Input.is_action_pressed("left"):
		if sprite.get_global_position().x - half_sprite_size <= 0:
			return
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("right"):
		if sprite.get_global_position().x + half_sprite_size >= 1080:
			return
		velocity.x = WALK_SPEED
	else:
		velocity.x = 0

	if velocity.x != 0:
		if velocity.x > 0:
			sprite.set_flip_h(false)
		else:
			sprite.set_flip_h(true)
		sprite.set_animation("walking")
	else:
		sprite.set_animation("idle")
		
	move_and_slide(velocity, Vector2(0, -1))
	
func hit():
	sprite.set_animation("hit")
	lives -= 1
	get_tree().call_group("ui_lives", "subtract_live")
	if lives < 0:
		game_over()

func game_over():
	sprite.stop()
	get_tree().call_group("main_scene", "game_over")
