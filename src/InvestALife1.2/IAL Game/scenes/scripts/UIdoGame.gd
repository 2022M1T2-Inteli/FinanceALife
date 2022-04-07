extends Control

#define os arquivos de texto das cards de escolha
var mes = Global.cardsArray2
var numEsc = Global.numEsc

func mesVerify():
	if Input.is_action_just_released("clicar_card"):
		if mes == Global.cardsArray2:
			if numEsc >= 6:
				mes = Global.cardsArray3
				numEsc = 0
		elif mes == Global.cardsArray3:
			if numEsc >= 5:
				mes =  Global.cardsArray4
				numEsc = 0
		elif mes == Global.cardsArray4:
			if numEsc >= 6:
				mes = Global.cardsArray5
				numEsc = 0
		elif mes == Global.cardsArray5:
			if numEsc >= 4:
				mes = Global.cardsArray6
				numEsc = 0
		elif mes == Global.cardsArray6:
			if numEsc >= 2:
				numEsc = 0
				get_tree().change_scene("res://scenes/GameOver.tscn")

func abasEsc1():
	if mes[numEsc]['choices'][0]['exists'] == true:
		if mes[numEsc]['choices'][0]['money'] == 0:
			$escolha1/VBoxContainer/abaDin.hide()
		else:
			$escolha1/VBoxContainer/abaDin.show()

		if mes[numEsc]['choices'][0]['energy'] == 0:
			$escolha1/VBoxContainer/abaEne.hide()
		else:
			$escolha1/VBoxContainer/abaEne.show()

		if mes[numEsc]['choices'][0]['hapiness'] == 0:
			$escolha1/VBoxContainer/abaFel.hide()
		else:
			$escolha1/VBoxContainer/abaFel.show()

		if mes[numEsc]['choices'][0]['debt'] == 0:
			$escolha1/VBoxContainer/abaDiv.hide()
		else:
			$escolha1/VBoxContainer/abaDiv.show()

func abasEsc2():
	if mes[numEsc]['choices'][1]['exists'] == true:
		if mes[numEsc]['choices'][1]['money'] == 0:
			$escolha2/VBoxContainer/abaDin.hide()
		else:
			$escolha2/VBoxContainer/abaDin.show()

		if mes[numEsc]['choices'][1]['energy'] == 0:
			$escolha2/VBoxContainer/abaEne.hide()
		else:
			$escolha2/VBoxContainer/abaEne.show()

		if mes[numEsc]['choices'][1]['hapiness'] == 0:
			$escolha2/VBoxContainer/abaFel.hide()
		else:
			$escolha2/VBoxContainer/abaFel.show()

		if mes[numEsc]['choices'][1]['debt'] == 0:
			$escolha2/VBoxContainer/abaDiv.hide()
		else:
			$escolha2/VBoxContainer/abaDiv.show()

func abasEsc3():
	if mes[numEsc]['choices'][2]['exists'] == true:
		if mes[numEsc]['choices'][2]['money'] == 0:
			$escolha3/VBoxContainer/abaDin.hide()
		else:
			$escolha3/VBoxContainer/abaDin.show()

		if mes[numEsc]['choices'][2]['energy'] == 0:
			$escolha3/VBoxContainer/abaEne.hide()
		else:
			$escolha3/VBoxContainer/abaEne.show()

		if mes[numEsc]['choices'][2]['hapiness'] == 0:
			$escolha3/VBoxContainer/abaFel.hide()
		else:
			$escolha3/VBoxContainer/abaFel.show()

		if mes[numEsc]['choices'][2]['debt'] == 0:
			$escolha3/VBoxContainer/abaDiv.hide()
		else:
			$escolha3/VBoxContainer/abaDiv.show()

func def_status(Din, Ene, Fel, Div):
	Global.money += Din
	Global.energy += Ene
	Global.hapiness += Fel
	Global.debt += Div

func onClickChoice(Esc):
	def_status(mes[numEsc]['choices'][Esc]['money'],mes[numEsc]['choices'][Esc]['energy'], mes[numEsc]['choices'][Esc]['hapiness'], mes[numEsc]['choices'][Esc]['debt'])
	
func clickOnCard():
	$CARD/card_exemplo1/textbox_card/text_card.text = mes[numEsc]['cardText']
	print(numEsc)
	
	if mes[numEsc]['choices'][0]['exists'] == true:
		$escolha1/Label.text = mes[numEsc]['choices'][0]['choiceText']
	if mes[numEsc]['choices'][1]['exists'] == true:
		$escolha2/Label2.text = mes[numEsc]['choices'][1]['choiceText']
	if mes[numEsc]['choices'][2]['exists'] == true:
		$escolha3/Label3.text = mes[numEsc]['choices'][2]['choiceText']

#func clicar_card():
#	if $CARD/card_exemplo1/textbox_card/text_card.percent_visible != 1 && Input.is_action_just_released("clicar_card"):
#		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
#		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
#	elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("clicar_card"):
#		clickOnCard()
#		$AnimationPlayer3.play("entrar_esc")

func showEsc():
	$escolha1/Label.show()
	$escolha1/fechar.show()
	$escolha1/select.show()
	$escolha1/botao1.hide()
	$escolha2/Label2.show()
	$escolha2/fechar.show()
	$escolha2/select.show()
	$escolha2/botao2.hide()
	$escolha3/Label3.show()
	$escolha3/fechar.show()
	$escolha3/select.show()
	$escolha3/botao3.hide()
	$CARD/Clicar_card.hide()

func hideEsc():
	$escolha1/Label.hide()
	$escolha1/fechar.hide()
	$escolha1/select.hide()
	$escolha1/botao1.show()
	$escolha2/Label2.hide()
	$escolha2/fechar.hide()
	$escolha2/select.hide()
	$escolha2/botao2.show()
	$escolha3/Label3.hide()
	$escolha3/fechar.hide()
	$escolha3/select.hide()
	$escolha3/botao3.show()

func abrir_barra():
	$barra_inferior/AnimationPlayer.play("subir barra")
	$barra_inferior/SubirBarra.visible = false
	$barra_inferior/DescerBarra.visible = true

	#se as escolhas estiverem na tela quando a barra inferior é aberta, as escolhas sairão da tela para não atrapalhar
	if $escolha1.margin_top <= 1090 && $escolha1.margin_top <= -500 && $escolha1.rect_scale < Vector2(1, 1) && $escolha2.rect_scale < Vector2(1, 1) && $escolha3.rect_scale < Vector2(1, 1):
		$AnimationPlayer.play_backwards("escolheu1")
		$AnimationPlayer.play_backwards("escolhas")
		$escolha1/botao1.hide()
		$escolha2/botao2.hide()
		$escolha3/botao3.hide()

#função de fechar a barra inferior
func fechar_barra():
	$barra_inferior/AnimationPlayer.play("descer barra")
	$barra_inferior/DescerBarra.visible = false
	$barra_inferior/SubirBarra.visible = true

	#se as escolhas estiverem na tela quando a barra inferior é fechada, as escolhas sairão da tela para não atrapalhar
	if $escolha1.margin_top <= 1090 && $escolha1.margin_top >= -500:
		$AnimationPlayer.play_backwards("escolhas")

#função para leitura e mostragem do texto contida no arquivo
func load_file(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	return text

#função para randomizar o card
#func random_card():
#	#seleciona um nº de 0 a 2
#	var sortear = RandomNumberGenerator.new()
#	sortear.randomize();
#	sorteio = sortear.randi_range(0, 2);
#	print(sorteio)

	#set fundo, icone e texto sorteado no card
#	$CARD/card_exemplo1.texture = fundo[sorteio]
#	$CARD/card_exemplo1/img_card.texture = icon[sorteio]
#	text_card = text_file[sorteio]
#	$CARD/card_exemplo1/textbox_card/text_card.text = load_file(text_card)


func escolheu1():
	if Input.is_action_just_released("escolha1"):
		$escolha1/VBoxContainer/AnimationPlayer.play("abas")
		$AnimationPlayer.play("escolheu1")
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		showEsc()

func fechou1():
	$escolha1/VBoxContainer/AnimationPlayer.play_backwards("abas")
	$AnimationPlayer.play_backwards("escolheu1")
	$"CARD/Entrar Carta".play("entrar_card")
	hideEsc()
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()

func escolheu2():
	if Input.is_action_just_released("escolha2"):
		$escolha2/VBoxContainer/AnimationPlayer.play("abas")
		$AnimationPlayer.play("escolheu2")
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		showEsc()


func fechou2():
	$escolha2/VBoxContainer/AnimationPlayer.play_backwards("abas")
	$AnimationPlayer.play_backwards("escolheu2")
	$"CARD/Entrar Carta".play("entrar_card")
	hideEsc()

	#desce a barra inferior caso esteja aberta durante o comando anterior
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()

func escolheu3():
	if Input.is_action_just_released("escolha3"):
		$escolha3/VBoxContainer/AnimationPlayer.play("abas")
		$AnimationPlayer.play("escolheu3")
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		showEsc()

func fechou3():
	$escolha3/VBoxContainer/AnimationPlayer.play_backwards("abas")
	$AnimationPlayer.play_backwards("escolheu3")
	$"CARD/Entrar Carta".play("entrar_card")
	hideEsc()
		
	#desce a barra inferior caso esteja aberta durante o comando anterior
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()


func select_card1():
	onClickChoice(0)

func select_card2():
	onClickChoice(1)

func select_card3():
	onClickChoice(2)

func _ready():
	def_status(1000, -50, -40, 1000)
#	numEsc -= 1
#	clickOnCard()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	$CARD/Clicar_card.hide()
#	random_card()

	#programa pega as medidas do display da tela do dispositivo e ajusta a cena
	ProjectSettings.get_setting("display/window/size/width")
	ProjectSettings.get_setting("display/window/size/height")

	#configurações para a barra inferior iniciar fechada e o card ainda não seja apertado
	$barra_inferior/SubirBarra.visible = true
	$barra_inferior/DescerBarra.visible = false


	#esconde botões desnecessários das escolhas
	hideEsc()

func _process(delta):
	
	if Input.is_action_just_pressed("escolha1") || Input.is_action_just_pressed("escolha2") || Input.is_action_just_pressed("escolha3"):
		$CARD/Clicar_card.hide()
		$AnimationPlayer.stop()
	if Input.is_action_just_released("escolha1") || Input.is_action_just_released("escolha2") || Input.is_action_just_released("escolha3"):
		$CARD/Clicar_card.show()
#	if numEsc >= 6:
#		numEsc = 6
	mesVerify()
	
	abasEsc1()

	abasEsc2()

	abasEsc3()

#	$CARD/card_exemplo1.texture = fundo[sorteio]
#	$CARD/card_exemplo1/img_card.texture = icon[sorteio]
#	text_card = text_file[sorteio]
#	$CARD/card_exemplo1/textbox_card/text_card.text = load_file(text_card)

	#abrir a barra inferior
#	print("principal")
	if $barra_inferior/SubirBarra.visible == true && $barra_inferior/DescerBarra.visible == false && Input.is_action_just_released("subir_barra"):
		abrir_barra()
		
	#fechar barra inferior
	elif $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true && Input.is_action_just_released("descer_barra"):
		fechar_barra()

	#chamar as escolhas quando clica no card
	if $CARD/card_exemplo1/textbox_card/text_card.percent_visible < 1 && Input.is_action_just_released("clicar_card"):
		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
		print("clicar1")
	
	elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("clicar_card"):
		if mes[numEsc]['choices'][0]['exists'] == true || mes[numEsc]['choices'][1]['exists'] == true || mes[numEsc]['choices'][2]['exists'] == true:
			$AnimationPlayer.play("escolhas")
			hideEsc()
#			$CARD/Clicar_card.hide()
			print("clicar2")
		elif mes[numEsc]['choices'][0]['exists'] == false && mes[numEsc]['choices'][1]['exists'] == false && mes[numEsc]['choices'][2]['exists'] == false:
			$CARD/SairCard.play("sair_card2")
		
		#fecha a barra inferior para que não atrapalhe o comando anterior
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()
	
	#descer as escolhas caso elas já estejam na tela quando clica no card
	if $escolha1.margin_top <= 1090 && $escolha1.margin_top <= -500 && Input.is_action_just_released("clicar_card"):
		$AnimationPlayer.play_backwards("escolhas")
#		$CARD/Clicar_card.show()
#		$CARD/Clicar_card.scale.y = 1
		

		#desce a barra inferior caso esteja aberta durante o comando anterior
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()

	if Input.is_action_just_released("select1"):
		onClickChoice(0)
		fechou1()
		$Timer.start()
		numEsc += 1
	elif Input.is_action_just_released("select2"):
		onClickChoice(1)
		fechou2()
		$Timer.start()
		numEsc += 1
	elif Input.is_action_just_released("select3"):
		onClickChoice(2)
		fechou3()
		$Timer.start()
		numEsc += 1

	#coloca a escolha 1 em foco quando é selecionada
	escolheu1()
	
	#reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar") && $escolha1.margin_top <= -500:
		fechou1()

	escolheu2()
	
	#reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar") && $escolha2.margin_top <= -500:
		fechou2()
		
	#coloca a escolha 3 em foco quando é selecionada
	escolheu3()
	
	#reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar") && $escolha3.margin_top <= -500:
		fechou3()


#anima o texto do card quando a animação de entrada termina
func _on_Entrar_Carta_animation_finished(entrar_card):
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.play("anim_text")
	$CARD/Clicar_card.show()
	clickOnCard()

func _on_SairCard_animation_finished(sair_card2) -> void:
	clickOnCard()
	$"CARD/Entrar Carta".play("entrar_card")
	$CARD/SairCard.stop()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	numEsc += 1

func _on_Entrar_Carta_animation_started(entrar_card) -> void:
	$CARD/Clicar_card.hide()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	clickOnCard()

func _on_SairCard_animation_started(sair_card2) -> void:
	$CARD/Clicar_card.hide()


func _on_Timer_timeout() -> void:
	$AnimationPlayer.play_backwards("escolhas")
	$Timer.stop()
