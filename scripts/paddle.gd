extends CharacterBody2D

var speed = 400
signal momentum

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("p1_up") and velocity.y > -1:
		velocity.y -= 0.05
	if Input.is_action_pressed("p1_down") and velocity.y < 1:
		velocity.y += 0.05 
	elif not Input.is_anything_pressed():
		if velocity.y > 0:
			velocity.y -= 0.05
		if velocity.y < 0:
			velocity.y += 0.05
	print(speed * velocity)
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		emit_signal("momentum")
	
	
