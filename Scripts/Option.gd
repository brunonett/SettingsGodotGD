extends Control

signal _Opition

@onready var BTWVSync := $VSync/VSyncButton
@onready var BTWResolution := $Resolution/ResolutionButton
@onready var BTWshadow := $Shadows/ShadowsButton
@onready var BTWwindow := $Window/WindowButton


@onready var BTWTextures := $Textures/TexturesButton
@onready var BTWAntialiasing := $Antialiasing/AntialiasingButton
@onready var BTWSSAO := $SSAO/SSAOButton
@onready var BTWBloom := $Bloom/BloomButton
@onready var BTWReflection := $Reflection/ReflectionButton
@onready var BTWFog := $Fog/FogButton

func _ready ()->void:
	BTWVSync.grab_focus()
	_Set_Graphics_BTW()
	



func _on_v_sync_button_item_selected(index:int)-> void:
	GM.savesettings._data["VSync"] = index

func _on_window_button_item_selected(index)-> void:
	GM.savesettings._data["Window"] = index
	
		
func _on_option_button_item_selected(index:int)->void:
	GM.savesettings._data["IDresolution"]  = index
	var _size = BTWResolution.get_item_text(index)
	var _res = _size.split("x")
	GM.savesettings._data["resolution"] = Vector2(int(_res[0]),int(_res[1]))



func _on_reflection_button_item_selected(index:int)-> void:
	GM.savesettings._data["Reflection"] = index

func _on_bloom_button_item_selected(index:int)-> void:
	GM.savesettings._data["Bloom"] = index

func _on_ssao_button_item_selected(index:int)-> void:
	GM.savesettings._data["SSAO"] = index

func _on_antialiasing_button_item_selected(index:int)-> void:
	GM.savesettings._data["Antialiasing"] = index

func _on_textures_button_item_selected(index:int)-> void:
	GM.savesettings._data["Textures"] = index

func _on_shadows_button_item_selected(index)-> void:
	GM.savesettings._data["shadow"] = index

func _on_fog_button_item_selected(index:int)-> void:
	GM.savesettings._data["Fog"] = index

func _on_return_pressed()->void:
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_save_pressed()-> void:

	GM.savesettings.save_data()
	_Set_Graphics_BTW()
	print(GM.savesettings.load_data())
	
	
func _Set_Graphics_BTW()-> void:
	
	GM.savesettings.load_data()
	print(GM.savesettings._data["resolution"])

	#SetAtualDataGraphics
	GM.graphics._Graphics()

	#SetAtualDataButton
	BTWVSync.select(GM.savesettings._data["VSync"])
	BTWResolution.select(GM.savesettings._data["IDresolution"])
	BTWshadow.select(GM.savesettings._data["shadow"])
	BTWwindow.select(GM.savesettings._data["Window"])
	BTWBloom.select(GM.savesettings._data["Bloom"])
	BTWSSAO.select(GM.savesettings._data["SSAO"])
	BTWReflection.select(GM.savesettings._data["Reflection"])
	BTWAntialiasing.select(GM.savesettings._data["Antialiasing"])
	BTWTextures.select(GM.savesettings._data["Textures"])
	BTWFog.select(GM.savesettings._data["Fog"])





