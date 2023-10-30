extends Node3D

var deltaT := float()

@export var sensi := float()
@export var velCan := float()


@onready var center_player := $"../Player/%CenterPlayer"





func _ready()->void:
	pass
	


func  _physics_process(delta)->void:
	deltaT = delta
	
	global_position =  lerp(global_position,center_player.global_position,velCan*delta)
	
	#look_at(camerar.global_position)


func _input(event)->void:

	

	if event is  InputEventMouseMotion:

		var inputV := Vector3.ZERO
		inputV.y -= event.relative.x
		inputV.x = event.relative.y
		
		rotation += inputV.limit_length(1000.0) * sensi/100 * deltaT
		rotation.x = clamp(rotation.x, -1, 1)
	
		
		
		
