extends Sprite

#terceira carta --> inicia sem visibilidade

func _ready() -> void:
	self.visible = false

#Quando a carta anterior some após ser apertado "não" esta carta aparece no lugar

func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("seta_não") && self.visible == false:
		show()

#Esta carta some quando está visível e os botões "sim" ou "não" são apertados

	elif Input.is_action_just_pressed("seta_não") && self.visible == true:
		hide()
	elif Input.is_action_just_pressed("seta_sim") && self.visible == true:
		hide()
