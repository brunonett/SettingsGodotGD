extends Node

var shadow := float()

var	ssao := bool()
var ssaoStrength := float()

var bloom := bool()
var blooStrength:= float()

var	reflection := bool()
var	reflectionStrength := int()

var fog := bool()
var fogStrengt := float()


func _Graphics()-> void:


	if GM.savesettings._data["VSync"] == 0:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	elif GM.savesettings._data["VSync"] == 1:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)

	
	#Resolution Display
	if GM.savesettings._data["Window"] == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(GM.savesettings._data["resolution"])
		get_viewport().scaling_3d_scale = 1 
	elif GM.savesettings._data["Window"] == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		get_viewport().scaling_3d_scale = float(GM.savesettings._data["resolution"].y)/float(DisplayServer.window_get_size().y)
		

	#Resolution Scaling
	get_viewport().scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR
	get_viewport().fsr_sharpness = 2
	

	
	#Antialiasing Quality	
	if GM.savesettings._data["Antialiasing"] == 0:
		get_viewport().msaa_3d = Viewport.MSAA_DISABLED
		get_viewport().use_taa = false
		get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED
	elif  GM.savesettings._data["Antialiasing"] == 1:
		get_viewport().use_taa = false
		get_viewport().msaa_3d = Viewport.MSAA_DISABLED
		get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA
	elif  GM.savesettings._data["Antialiasing"] == 2:
		get_viewport().use_taa = false
		get_viewport().msaa_3d = Viewport.MSAA_2X
		get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA
	elif  GM.savesettings._data["Antialiasing"] == 3:
		get_viewport().use_taa = false
		get_viewport().msaa_3d = Viewport.MSAA_4X
		get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA
	elif  GM.savesettings._data["Antialiasing"] == 4:
		get_viewport().use_taa = true
		get_viewport().msaa_3d = Viewport.MSAA_DISABLED
		get_viewport().screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA


	#Shadows Quality
	if GM.savesettings._data["shadow"] == 0: # Very Low
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_HARD)
		RenderingServer.directional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_HARD)
		
	elif GM.savesettings._data["shadow"] == 1: # Low
		RenderingServer.directional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_VERY_LOW)
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_VERY_LOW)
	elif GM.savesettings._data["shadow"] == 2: # Medium (default)
		RenderingServer.directional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_LOW)
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_LOW)
	elif GM.savesettings._data["shadow"] == 3: # High
		RenderingServer.directional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_MEDIUM)
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_MEDIUM)
	elif GM.savesettings._data["shadow"] == 4: # Very High
		RenderingServer.directional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_HIGH)
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_HIGH)
	elif GM.savesettings._data["shadow"] == 5: # Ultra
		RenderingServer.directional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_ULTRA)
		RenderingServer.positional_soft_shadow_filter_set_quality(RenderingServer.SHADOW_QUALITY_SOFT_ULTRA)


	#SSAO Quality
	if  GM.savesettings._data["SSAO"] == 0 : #Disable
		ssao = false
		ssaoStrength = 0
	elif GM.savesettings._data["SSAO"] == 1: # Low
		ssao = true
		RenderingServer.environment_set_ssao_quality(RenderingServer.ENV_SSAO_QUALITY_VERY_LOW, true, 0.2, 0, 10, 100)
		ssaoStrength = 0.3
	elif GM.savesettings._data["SSAO"]== 2: # Medium
		ssao = true
		RenderingServer.environment_set_ssao_quality(RenderingServer.ENV_SSAO_QUALITY_MEDIUM, true, 0.5, 1, 50, 500)
		ssaoStrength = 0.4
	elif GM.savesettings._data["SSAO"] == 3: # High
		ssao = true
		RenderingServer.environment_set_ssao_quality(RenderingServer.ENV_SSAO_QUALITY_HIGH, true, 0.5, 1, 50, 800)
		ssaoStrength = 0.5
	
	
	#Reflection Quality
	if GM.savesettings._data["Reflection"] == 0: # Disabled (default)
		RenderingServer.environment_set_ssr_roughness_quality(RenderingServer.ENV_SSR_ROUGHNESS_QUALITY_DISABLED)
		reflection = false
		reflectionStrength = 0	
	elif GM.savesettings._data["Reflection"] == 1: # VeryLow
		RenderingServer.environment_set_ssr_roughness_quality(RenderingServer.ENV_SSR_ROUGHNESS_QUALITY_DISABLED)
		reflection = true
		reflectionStrength = 128
	elif GM.savesettings._data["Reflection"] == 2: # Low
		RenderingServer.environment_set_ssr_roughness_quality(RenderingServer.ENV_SSR_ROUGHNESS_QUALITY_DISABLED)
		reflection = true
		reflectionStrength = 256
	elif GM.savesettings._data["Reflection"] == 3: # Medium
		RenderingServer.environment_set_ssr_roughness_quality(RenderingServer.ENV_SSR_ROUGHNESS_QUALITY_DISABLED)
		reflection = true
		reflectionStrength = 512	
	elif GM.savesettings._data["Reflection"] == 4: # High
		RenderingServer.environment_set_ssr_roughness_quality(RenderingServer.ENV_SSR_ROUGHNESS_QUALITY_LOW)
		reflection = true
		reflectionStrength = 512

	#Bloom Quality
	if GM.savesettings._data["Bloom"] == 0:
		bloom = false
	elif  GM.savesettings._data["Bloom"] == 1:
		bloom = true
		blooStrength = 1.2
	elif GM.savesettings._data["Bloom"] == 2:
		bloom = true
		blooStrength = 1.3
	elif GM.savesettings._data["Bloom"] == 3:
		bloom = true
		blooStrength = 1.3	
	elif GM.savesettings._data["Bloom"] == 4:
		bloom = true
		blooStrength = 1.4

		
	#Fog Quality
	if GM.savesettings._data["Fog"] == 0:
		fog = false
		fogStrengt = 0.0
	elif  GM.savesettings._data["Fog"] == 1:
		fog = true
		fogStrengt = 0.005
	elif GM.savesettings._data["Fog"] == 2:
		fog = true
		fogStrengt = 0.008
	elif GM.savesettings._data["Fog"] == 3:
		fog = true
		fogStrengt = 0.01
	elif GM.savesettings._data["Fog"] == 4:
		fog = true
		fogStrengt = 0.015

	#Texture Quality
	if GM.savesettings._data["Textures"] == 0: # low
		get_viewport().texture_mipmap_bias = 2
		
	elif GM.savesettings._data["Textures"] == 0: # medium
		get_viewport().texture_mipmap_bias = 0
	
	elif GM.savesettings._data["Textures"] == 0: # high
		get_viewport().texture_mipmap_bias = -2
		
	elif GM.savesettings._data["Textures"] == 0: # Ultra
		get_viewport().texture_mipmap_bias = -4
		
	
	shadow = GM.savesettings._data["shadow"]
	bloom = GM.savesettings._data["Bloom"]
	reflection = GM.savesettings._data["Reflection"]
	
	ssao = GM.savesettings._data["SSAO"]
	fog = GM.savesettings._data["Fog"]


	
