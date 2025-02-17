extends CharacterBody2D
var speed = 600
signal momentum(velocityy)

func _physics_process(delta: float) -> void:
	emit_signal("momentum", velocity.y)
	if Input.is_action_pressed("p1_up") and velocity.y > -1:
		velocity.y -= 0.05
	if Input.is_action_pressed("p1_down") and velocity.y < 1:
		velocity.y += 0.05 
	elif not Input.is_anything_pressed():
		if velocity.y > 0:
			velocity.y -= 0.05
		if velocity.y < 0:
			velocity.y += 0.05
	var collision = move_and_collide(velocity * speed * delta)
