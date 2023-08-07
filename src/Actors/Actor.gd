extends KinematicBody2D
class_name Actor


const FLOOR_NORMAL := Vector2.UP


export var speed:= Vector2(400.0,1000.0)
export var gravity:= 3000.0
var _velocity:= Vector2.ZERO  # pixels/second


func _physics_process(delta: float) -> void:	
	_velocity.y += gravity * delta 
	#_velocity.y = min(_velocity.y,speed.y)	#cap speed

