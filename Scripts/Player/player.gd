extends CharacterBody3D


@onready var camera_player = $"../CanPlay" as Node3D
@onready var menu_pause = $"../MenuPause"

var inputs := Vector3.ZERO
var iInputs := Vector3 () 
var rot := Vector3 ()
var _velocity :=Vector3()
var SPEED := float()
const JUMP_VELOCITY := 450
var _delta := float()


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _unhandled_input(event: InputEvent)-> void: 
	if event.is_action_pressed("ui_cancel"):
		menu_pause.pauseON()


func _process(__delta)-> void:
	pass
	

func _physics_process(delta) -> void:

	_delta = delta
	mover ()
	velocity.y = g_ravity()
	jump ()
	rotat ()	
	move_and_slide()

	
func mover ()-> void:
	
	if GM.cm.inputs.normalized().length() != 0 && SPEED < 20:
		SPEED += SPEED+0.5 *_delta
	
	SPEED = clamp(SPEED*GM.cm.inputs.normalized().length(),0,20)
	iInputs = GM.cm.inputs.rotated(Vector3.UP , camera_player.rotation.y ).normalized() * SPEED * _delta
	velocity = iInputs *1000*_delta


func rotat ()-> void:

	if (iInputs != Vector3.ZERO):
		rot.y = lerp_angle(rotation.y,Vector2(iInputs.z,iInputs.x).angle(),10*_delta)
		rotation = rot
		#print(iInputs)

func jump ()-> void:
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		_velocity.y = JUMP_VELOCITY *_delta
	

func g_ravity ()-> float:
	if !is_on_floor():
		_velocity.y -= gravity *3* _delta
	return _velocity.y




