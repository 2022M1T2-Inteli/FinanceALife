extends Sprite

#A barra inferior fechada começa visível

func _ready() -> void:
	self.visible = true

#Quando o botão touch alocado com a barra fechada é apertado, a função
#"abrir_barra" é ativada fazendo com que a barra fechada perca a visibilidade

func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("abrir_barra") && self.visible == true:
		self.visible = false

#Quando o botão touch alocado com a barra aberta é apertado, a função
#"fechar_barra" é ativada fazendo com que a barra fechada ganhe visibilidade

	if Input.is_action_just_pressed("fechar_barra") && self.visible == false:
		self.visible = true
