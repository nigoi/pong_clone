extends CharacterBody2D
var speed = 600

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("p1_up") and velocity.y > -1.0:
		velocity.y = lerp(velocity.y, -1.0, 0.05)
		print("up")
	if Input.is_action_pressed("p1_down") and velocity.y < 1.0:
		velocity.y = lerp(velocity.y, 1.0, 0.05)
		print("down")
	elif not Input.is_anything_pressed():
		if velocity.y != 0.0:
			velocity.y = lerp(velocity.y, 0.0, 0.05)
	var collision = move_and_collide(velocity * speed * delta)
