extends KinematicBody2D

var x_size = OS.window_size.x
var y_size = OS.window_size.y
var rng = RandomNumberGenerator.new()

const GRAVITY = 15

var velocity = Vector2()

func _ready():
	rng.randomize()
	var random_x = rng.randf_range(10, OS.window_size.x - 10)
	self.set_position(Vector2(random_x, -20))

func _physics_process(delta):
	if Globals.get_pause():
		velocity.y = 0
	else:
		velocity.y += GRAVITY * delta
		
	var collision = move_and_collide(velocity)
	if collision:
		if collision.collider.has_method("hit"):
			get_node("../AudioStreamPlayer").play(0.2)
			collision.collider.hit()
		self.queue_free()
