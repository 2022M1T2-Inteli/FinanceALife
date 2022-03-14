extends Sprite

#primeira carta

#quando a seta "sim" ou a seta "não" é apertada, a carta 1 some dando lugar à
#próxima carta

func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("seta_sim") && self.visible == true:
		hide()
	elif Input.is_action_just_released("seta_não") && self.visible == true:
		hide()
