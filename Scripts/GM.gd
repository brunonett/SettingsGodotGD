extends Node
@onready var fps := $FPS/%FPS
var savesettings
var graphics
var sm 
var cm
var _fps


func _enter_tree()-> void:
	savesettings = get_node("%SaveSettings")
	graphics  =   get_node("%Graphics")
	sm = get_node("%SM")
	cm = get_node("%CM")

func _ready()->void:
	pass

	

func _process(_delta)-> void:

	_fps = Engine.get_frames_per_second()
	var _text = "GD  FPS : "+str(_fps)+ "    Resolution : "+str(DisplayServer.window_get_size())+ "   Render : "+str(DisplayServer.window_get_size()*get_viewport().scaling_3d_scale)+ "   Scene : " +get_tree().current_scene.name
	fps.text = _text
	
	
	
		
