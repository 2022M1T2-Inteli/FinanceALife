extends TextureRect

func _ready() -> void:
	self.set_position(Vector2(30, 1792))

func _process(delta):
	if self && Input.is_action_just_released("botao_barra"):
		$AnimationPlayer.play("subir barra")
		self.set_position(Vector2(30, 1792))
		
	elif get_position_in_parent(Vector2(30, 1792)) && Input.is_action_just_released("botao_barra"):
		$AnimationPlayer.play("descer barra")
		self.set_position(Vector2(30, 1474))


