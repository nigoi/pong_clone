extends RigidBody2D
var velocity = Vector2.ZERO
var speed = 400.0
var view_port = Vector2.ZERO
signal ball_position(y_coodinate)
signal respawn

func start_direction():
	var start = randi_range(1, 2)
	if start == 1:
		velocity.x = 1
	else:
		velocity.x = - 1
	velocity.y = randf_range(-1, 1)

func _ready() -> void:
	view_port = get_viewport().size
	start_direction()

func center_ball():
	position = get_viewport().size / 2  

func _physics_process(delta: float) -> void:
	speed = lerp(speed, 1000.0, 0.001)
	emit_signal("ball_position", position.y)
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		var collision_name = collision.get_collider().name
		
		velocity = velocity.bounce(collision.get_normal())
		$AudioStreamPlayer.play()
		
	if position.x > get_viewport().size.x or position.x < 0:
		self.queue_free()
		emit_signal("respawn")
		
