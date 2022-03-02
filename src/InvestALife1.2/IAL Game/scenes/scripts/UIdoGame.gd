extends Control
var texto = false

func _ready():
	ProjectSettings.get_setting("display/window/size/width")
	ProjectSettings.get_setting("display/window/size/height")
	
	$barra_inferior/SubirBarra.visible = true
	$barra_inferior/DescerBarra.visible = false
	$CARD/Clicar_card.visible = false
	$AnimationPlayer.play_backwards("escolhas")
	$escolha1/fechar.hide()
	$escolha2/fechar.hide()
	$escolha3/fechar.hide()
	$escolha1/select.hide()
	$escolha2/select.hide()
	$escolha3/select.hide()
	
func _process(delta):

	if $CARD.margin_left == -385 && $CARD.margin_right == 385 && texto == false:
		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.play("anim_text")
		texto = true
		$CARD/Clicar_card.visible = true


	if $barra_inferior/SubirBarra.visible == true && $barra_inferior/DescerBarra.visible == false && Input.is_action_just_released("subir_barra"):
		$barra_inferior/AnimationPlayer.play("subir barra")
		$barra_inferior/SubirBarra.visible = false
		$barra_inferior/DescerBarra.visible = true

		if $escolha1.margin_top <= 1090 && $escolha1.margin_top <= -500 && $escolha1.rect_scale < Vector2(1, 1) && $escolha2.rect_scale < Vector2(1, 1) && $escolha3.rect_scale < Vector2(1, 1):
			$AnimationPlayer.play_backwards("escolheu1")
			$AnimationPlayer.play_backwards("escolhas")
			$CARD/Clicar_card.scale.y = 1
		

	elif $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true && Input.is_action_just_released("descer_barra"):
		$barra_inferior/AnimationPlayer.play("descer barra")
		$barra_inferior/DescerBarra.visible = false
		$barra_inferior/SubirBarra.visible = true

		if $escolha1.margin_top <= 1090 && $escolha1.margin_top >= -500:
			$AnimationPlayer.play_backwards("escolhas")
			$CARD/Clicar_card.scale.y = 1
		

	if $escolha1.margin_top >= 1090 && Input.is_action_just_released("clicar_card"):
		$AnimationPlayer.play("escolhas")
		$CARD/Clicar_card.scale.y = 0.869

		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			$barra_inferior/AnimationPlayer.play("descer barra")
			$barra_inferior/DescerBarra.visible = false
			$barra_inferior/SubirBarra.visible = true

	if $escolha1.margin_top <= 1090 && $escolha1.margin_top <= -500 && Input.is_action_just_released("clicar_card"):
		$AnimationPlayer.play_backwards("escolhas")
		$CARD/Clicar_card.scale.y = 1
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			$barra_inferior/AnimationPlayer.play("descer barra")
			$barra_inferior/DescerBarra.visible = false
			$barra_inferior/SubirBarra.visible = true

	if Input.is_action_just_released("escolha1"):
		$AnimationPlayer.play("escolheu1")
		$escolha1/botao1.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha1/fechar.show()
		$escolha1/select.show()
	
	if Input.is_action_just_released("fechar") && $escolha1.margin_top <= -500:
		$AnimationPlayer.play_backwards("escolheu1")
		$escolha1/botao1.show()
		$CARD/Clicar_card.show()
		$"CARD/Entrar Carta".play("entrar_card")
		$escolha1/fechar.hide()
		$escolha1/select.hide()
		
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			$barra_inferior/AnimationPlayer.play("descer barra")
			$barra_inferior/DescerBarra.visible = false
			$barra_inferior/SubirBarra.visible = true
			
	if Input.is_action_just_released("escolha2"):
		$AnimationPlayer.play("escolheu2")
		$escolha2/botao2.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha2/fechar.show()
		$escolha2/select.show()
	
	if Input.is_action_just_released("fechar") && $escolha2.margin_top <= -500:
		$AnimationPlayer.play_backwards("escolheu2")
		$escolha2/botao2.show()
		$CARD/Clicar_card.show()
		$"CARD/Entrar Carta".play("entrar_card")
		$escolha2/fechar.hide()
		$escolha2/select.hide()
		
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			$barra_inferior/AnimationPlayer.play("descer barra")
			$barra_inferior/DescerBarra.visible = false
			$barra_inferior/SubirBarra.visible = true
			
	if Input.is_action_just_released("escolha3"):
		$AnimationPlayer.play("escolheu3")
		$escolha3/botao3.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha3/fechar.show()
		$escolha3/select.show()
	
	if Input.is_action_just_released("fechar") && $escolha3.margin_top <= -500:
		$AnimationPlayer.play_backwards("escolheu3")
		$escolha3/botao3.show()
		$CARD/Clicar_card.show()
		$"CARD/Entrar Carta".play("entrar_card")
		$escolha3/fechar.hide()
		$escolha3/select.hide()
		
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			$barra_inferior/AnimationPlayer.play("descer barra")
			$barra_inferior/DescerBarra.visible = false
			$barra_inferior/SubirBarra.visible = true
