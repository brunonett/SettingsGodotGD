extends Node

var file 
var  save_path: String = "res://save-file.cfg"


var _data = {
			"VSync" : int(),
			"Window" : int(),
			"resolution": Vector2(),
			"IDresolution": int(),
			"shadow": int(),
			"Bloom": int(),
			"SSAO": int(),
			"Reflection": int(),
			"Antialiasing": int(),
			"Textures": int(),
			"Fog": int()
			}

func _enter_tree()-> void:
	if !FileAccess.file_exists(save_path):
		default_data()
		save_data()
	


func _ready()-> void:
	
	load_data()
	GM.graphics._Graphics()


func save_data()-> void:
	file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(_data)
	file.close();
	

func load_data():
	file = FileAccess.open(save_path, FileAccess.READ)	
	_data = file.get_var()
	file.close();
	return _data
	
func default_data()-> void:
	_data = {
			"VSync" : int(0),
			"Window" : int(0),
			"resolution": Vector2(1920,1080),
			"IDresolution": int(0),
			"shadow": int(0),
			"Bloom": int(0),
			"SSAO": int(0),
			"Reflection": int(0),
			"Antialiasing": int(0),
			"Textures": int(0),
			"Fog": int(0)		
			}	
	DisplayServer.window_set_size(_data["resolution"])


