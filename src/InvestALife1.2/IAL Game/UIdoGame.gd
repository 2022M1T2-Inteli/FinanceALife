extends Control
 
	
func _ready():
	ProjectSettings.get_setting("display/window/size/width")
	ProjectSettings.get_setting("display/window/size/height")
	
	$barra_inferior/SubirBarra.visible = true
	$barra_inferior/DescerBarra.visible = false

func _process(delta):
	if $barra_inferior/SubirBarra.visible == true && $barra_inferior/DescerBarra.visible == false && Input.is_action_just_released("subir_barra"):
		$barra_inferior/AnimationPlayer.play("subir barra")
		$barra_inferior/SubirBarra.visible = false
		$barra_inferior/DescerBarra.visible = true		
	elif $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true && Input.is_action_just_released("descer_barra"):
		$barra_inferior/AnimationPlayer.play("descer barra")
		$barra_inferior/DescerBarra.visible = false
		$barra_inferior/SubirBarra.visible = true
