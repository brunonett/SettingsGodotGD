extends WorldEnvironment


func _ready()-> void:

	
	$".".environment.ssao_enabled =  GM.graphics.ssao
	$".".environment.ssao_radius =  GM.graphics.ssaoStrength

	$".".environment.volumetric_fog_enabled =  GM.graphics.fog
	$".".environment.volumetric_fog_density =  GM.graphics.fogStrengt

	$".".environment.glow_enabled =  GM.graphics.bloom
	$".".environment.glow_normalized =  GM.graphics.bloom
	$".".environment.glow_strength =  GM.graphics.blooStrength

	$".".environment.ssr_enabled =  GM.graphics.reflection
	$".".environment.ssr_max_steps =  GM.graphics.reflectionStrength
