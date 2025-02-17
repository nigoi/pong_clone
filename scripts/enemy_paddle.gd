extends CharacterBody2D
var speed = 300

func _ready() -> void:
	pass
		
func follow(y_coodinate):
	if position.y > y_coodinate:
		velocity.y = - 1
	if position.y < y_coodinate:
		velocity.y = 1
	else:
		if velocity.y > 0:
			velocity.y -= 0.05
		if velocity.y < 0:
			velocity.y += 0.05
	
func _physics_process(delta: float) -> void:
	move_and_collide(velocity * speed * delta)
	
	
