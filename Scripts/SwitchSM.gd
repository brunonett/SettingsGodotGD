extends Node


func _enter_tree()-> void:
	
	process_mode = PROCESS_MODE_INHERIT
	GM.sm.process_mode = PROCESS_MODE_INHERIT
	
	process_mode = PROCESS_MODE_DISABLED
