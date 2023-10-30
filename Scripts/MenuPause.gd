extends CanvasLayer

@onready var menu_pause = $"."




func _ready()->void:
	pauseOFF()


func _on_option_pressed()->void:
	pass # Replace with function body.


func _on_return_pressed()->void:
	pauseOFF()

func _on_quit_pressed()->void:
	pauseOFF()

	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	

func pauseON()->void:
		$Control/VBoxContainer/Option.grab_focus()
		#menu_pause.process_mode = Node.PROCESS_MODE_INHERIT
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		menu_pause.visible = true
		get_tree().paused = true

func pauseOFF()->void:
		
		#menu_pause.process_mode = Node.PROCESS_MODE_DISABLED
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		menu_pause.visible = false
		get_tree().paused = false
