extends RigidBody2D
var velocity = Vector2.ZERO
var speed = 400

func start_direction():
	var start = randi_range(1, 2)
	if start == 1:
		velocity.x = 1
	else:
		velocity.x = - 1
	velocity.y = randf_range(-1, 1)

func _ready() -> void:
	start_direction()
	position = get_viewport().size / 2

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	if position.x == get_viewport().size.x + 5 or get_viewport().size.x - 5:
		queue_free()
