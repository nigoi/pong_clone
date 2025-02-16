extends RigidBody2D
var velocity = Vector2.ZERO
var speed = 400
var view_port = Vector2.ZERO
signal respawn
signal ball_position

func start_direction():
	var start = randi_range(1, 2)
	if start == 1:
		velocity.x = 1
	else:
		velocity.x = - 1
	velocity.y = randf_range(-1, 1)

func momentum():
	print("momentum")

func _ready() -> void:
	view_port = get_viewport().size
	start_direction()
	position = view_port / 2
	print(view_port.x + 5)

func _physics_process(delta: float) -> void:
	emit_signal("ball_position", position.y)
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		$AudioStreamPlayer.play()
	if position.x > view_port.x or position.x < 0:
		self.queue_free()
		emit_signal("respawn")
	
