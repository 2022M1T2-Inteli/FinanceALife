extends Sprite

#A barra inferior aberta começa sem estar visível

func _ready() -> void:
	self.visible = false
	
#Quando o botão touch alocado com a barra fechada é apertado, a função
#"abrir_barra" é ativada fazendo com que a barra aberta ganhe visibilidade

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("abrir_barra") && self.visible == false:
		self.visible = true
		
#Quando o botão touch alocado com a barra aberta é apertado, a função
#"fechar_barra" é ativada fazendo com que a barra aberta perca visibilade

	if Input.is_action_just_released("fechar_barra") && self.visible == true:
		self.visible = false
