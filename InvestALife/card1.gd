extends Sprite


func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("seta_sim") && self.visible == true:
		queue_free()
	elif Input.is_action_just_released("seta_não") && self.visible == true:
		queue_free()
		
	
