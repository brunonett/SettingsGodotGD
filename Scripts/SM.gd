extends Node


# Called when the node enters the scene tree for the first time.
func _ready()-> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta)-> void:
	if process_mode == PROCESS_MODE_INHERIT:
			
		if get_tree().current_scene.name == "Menu":
			
			SPlayer.hide()
			SPlayer.process_mode = Node.PROCESS_MODE_DISABLED
			
		elif get_tree().current_scene.name == "TestMecanics":
			SPlayer.show()
			SPlayer.process_mode = Node.PROCESS_MODE_INHERIT
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

		print(get_tree().current_scene.name)
		process_mode = PROCESS_MODE_DISABLED

		
	
