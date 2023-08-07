extends "res://src/Actors/Actor.gd"



func _ready() -> void:
	_velocity.x = -speed.x
	
	set_physics_process(true)

func _on_stompdetector_body_entered(body: Node) -> void:
	if body.global_position.y > get_node("stompdetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()
 

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1
	
	_velocity.y = move_and_slide(_velocity,FLOOR_NORMAL).y 

