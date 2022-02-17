extends Sprite

func _ready() -> void:
	self.visible = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("abrir_barra") && self.visible == true:
		self.visible = false

	if Input.is_action_just_pressed("fechar_barra") && self.visible == false:
		self.visible = true
