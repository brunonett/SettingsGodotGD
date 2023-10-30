extends Control

@export var BTWFocus : Button

	
func _enter_tree()-> void:
	
	pass


# Called when the node enters the scene tree for the first time.
func _ready()->void:
	BTWFocus.grab_focus()
	await get_tree().create_timer(0.1).timeout
	print("helo")
	GM.savesettings.load_data()
	GM.graphics._Graphics()
	
	
	
		
func _on_Start_pressed()->void:
	
	get_tree().change_scene_to_file("res://Scenes/TestMecanics.tscn")

	
	
func _on_Continue_pressed()->void:
	pass # Replace with function body.

func _on_Options_pressed()->void:
	
	get_tree().change_scene_to_file("res://Scenes/Option.tscn")

func _on_Quit_pressed()->void:
	get_tree().quit()



func _on_ready()->void:

	pass



func _on_tree_exited()->void:
	pass














