extends CharacterBody2D
var speed = 600

func _ready() -> void:
	pass
		
func follow(y_coodinate):
	if position.y > y_coodinate:
		velocity.y = lerp(velocity.y, -1.0, 0.1)
	if position.y < y_coodinate:
		velocity.y = lerp(velocity.y, 1.0, 0.1)
	else:
		if velocity.y != 0.0:
			velocity.y = lerp(velocity.y, 0.0, 0.05)
	
func _physics_process(delta: float) -> void:
	move_and_collide(velocity * speed * delta)
	
	
