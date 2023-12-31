extends Actor

export var stomp_impulse:= 1000.0

func _on_Enemydetector_area_entered(area: Area2D) -> void:
	#_velocity	= calculate_stomp_velocity(_velocity,stomp_impulse)
	_velocity = Vector2(0.0,0.0)

func _physics_process(delta: float) -> void:
	var is_jump_interruped:= Input.is_action_just_released("ui_up") and _velocity.y < 1.0
	var direction:= get_direction()
	_velocity = calculate_move_velocity(_velocity,direction,speed,is_jump_interruped)
	_velocity = move_and_slide(_velocity,FLOOR_NORMAL)


func get_direction() -> Vector2:
	return Vector2( 	
	Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
	-1.0 if Input.get_action_strength("ui_up") and is_on_floor() else 1.0
	)


func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
) -> Vector2:
	var new_velocity:= linear_velocity
	new_velocity.x = speed.x * direction.x 
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		new_velocity.y = 0.0
	return new_velocity 

func calculate_stomp_velocity(linear_velocity: Vector2,impulse: float) -> Vector2:
	var out:=	linear_velocity
	out.y = -impulse
	return out
