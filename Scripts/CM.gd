extends  Node
static var inputs := Vector3.ZERO



func _process(delta)->void:
	
	inputs.x = Input.get_axis("ui_right","ui_left")*delta
	inputs.z = Input.get_axis("ui_down","ui_up")*delta


