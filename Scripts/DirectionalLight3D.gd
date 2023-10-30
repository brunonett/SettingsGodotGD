extends DirectionalLight3D


func _ready()-> void:
	$".".shadow_blur = GM.graphics.shadow+0.1
	

