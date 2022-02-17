extends Sprite

func _ready() -> void:
	self.visible = false
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("abrir_barra") && self.visible == false:
		self.visible = true
		
	if Input.is_action_just_released("fechar_barra") && self.visible == true:
		self.visible = false
