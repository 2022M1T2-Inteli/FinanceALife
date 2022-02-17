extends Sprite

func _ready() -> void:
	self.visible = false
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("seta_sim") && self.visible == false:
		self.visible = true
	elif Input.is_action_just_released("seta_sim") && self.visible == false:
		self.visible = true
	elif Input.is_action_just_pressed("seta_não") && self.visible == true:
		queue_free()
	elif Input.is_action_just_released("seta_sim") && self.visible == true:
		queue_free()
