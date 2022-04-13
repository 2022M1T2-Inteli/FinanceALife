extends Control

#Dfine qual a array utilizada (mês)
var month = Global.cardsArray2

#Define em qual parte da array coletar as informações (quais as cardas na tela)
var numEsc = Global.numEsc

#Função que passa de uma array para a outra quando elas acabam (passagem de um mês para o outro)
func monthVerify():
	if Input.is_action_just_released("clicar_card"):
		if month == Global.cardsArray2:
			if numEsc >= len(month)-1:
				month = Global.cardsArray3
				numEsc = 0
				def_status(1000, 0, 0, 0)
		elif month == Global.cardsArray3:
			if numEsc >= len(month)-1:
				month =  Global.cardsArray4
				numEsc = 0
				def_status(1000, 0, 0, 0)
		elif month == Global.cardsArray4:
			if numEsc >= len(month)-1:
				month = Global.cardsArray5
				numEsc = 0
				def_status(1000, 0, 0, 0)
		elif month == Global.cardsArray5:
			if numEsc >= len(month)-1:
				month = Global.cardsArray6
				numEsc = 0
				def_status(1000, 0, 0, 0)
		elif month == Global.cardsArray6:
			if numEsc >= len(month)-1:
				numEsc = 0
				get_tree().change_scene("res://scenes/GameOver.tscn")

#Função que habilita as abas de alteração de status da carta de escolha 1 de acordo com os status que ela altera
func abasEsc1():
	if month[numEsc]['choices'][0]['exists'] == true:
		if month[numEsc]['choices'][0]['money'] == 0:
			$escolha1/VBoxContainer/abaDin.hide()
		else:
			$escolha1/VBoxContainer/abaDin.show()

		if month[numEsc]['choices'][0]['energy'] == 0:
			$escolha1/VBoxContainer/abaEne.hide()
		else:
			$escolha1/VBoxContainer/abaEne.show()

		if month[numEsc]['choices'][0]['happiness'] == 0:
			$escolha1/VBoxContainer/abaFel.hide()
		else:
			$escolha1/VBoxContainer/abaFel.show()

		if month[numEsc]['choices'][0]['debt'] == 0:
			$escolha1/VBoxContainer/abaDiv.hide()
		else:
			$escolha1/VBoxContainer/abaDiv.show()

#Função que habilita as abas de alteração de status da carta de escolha 2 de acordo com os status que ela altera
func abasEsc2():
	if month[numEsc]['choices'][1]['exists'] == true:
		if month[numEsc]['choices'][1]['money'] == 0:
			$escolha2/VBoxContainer/abaDin.hide()
		else:
			$escolha2/VBoxContainer/abaDin.show()

		if month[numEsc]['choices'][1]['energy'] == 0:
			$escolha2/VBoxContainer/abaEne.hide()
		else:
			$escolha2/VBoxContainer/abaEne.show()

		if month[numEsc]['choices'][1]['happiness'] == 0:
			$escolha2/VBoxContainer/abaFel.hide()
		else:
			$escolha2/VBoxContainer/abaFel.show()

		if month[numEsc]['choices'][1]['debt'] == 0:
			$escolha2/VBoxContainer/abaDiv.hide()
		else:
			$escolha2/VBoxContainer/abaDiv.show()

#Função que habilita as abas de alteração de status da carta de escolha 3 de acordo com os status que ela altera
func abasEsc3():
	if month[numEsc]['choices'][2]['exists'] == true:
		if month[numEsc]['choices'][2]['money'] == 0:
			$escolha3/VBoxContainer/abaDin.hide()
		else:
			$escolha3/VBoxContainer/abaDin.show()

		if month[numEsc]['choices'][2]['energy'] == 0:
			$escolha3/VBoxContainer/abaEne.hide()
		else:
			$escolha3/VBoxContainer/abaEne.show()

		if month[numEsc]['choices'][2]['happiness'] == 0:
			$escolha3/VBoxContainer/abaFel.hide()
		else:
			$escolha3/VBoxContainer/abaFel.show()

		if month[numEsc]['choices'][2]['debt'] == 0:
			$escolha3/VBoxContainer/abaDiv.hide()
		else:
			$escolha3/VBoxContainer/abaDiv.show()

#Função que altera os valores das barras de status
func def_status(Din, Ene, Fel, Div):
	Global.money += Din
	Global.energy += Ene
	Global.happiness += Fel
	Global.debt += Div

#Função que altera os valores das barras de status diretatamente sem somatória ou subtração de valores
func def_status2(Din, Ene, Fel, Div):
	Global.money = Din
	Global.energy = Ene
	Global.happiness = Fel
	Global.debt = Div

#Função que define quais os valores que serão utilizados na função def_status
func onClickChoice(Esc):
	def_status(month[numEsc]['choices'][Esc]['money'],month[numEsc]['choices'][Esc]['energy'], month[numEsc]['choices'][Esc]['happiness'], month[numEsc]['choices'][Esc]['debt'])
	

#Função que define os textos de cada carta
func clickOnCard():
	$CARD/card_exemplo1/textbox_card/text_card.text = month[numEsc]['cardText']
	print(numEsc)
	
	if month[numEsc]['choices'][0]['exists'] == true:
		$escolha1/Label.text = month[numEsc]['choices'][0]['choiceText']
	if month[numEsc]['choices'][1]['exists'] == true:
		$escolha2/Label2.text = month[numEsc]['choices'][1]['choiceText']
	if month[numEsc]['choices'][2]['exists'] == true:
		$escolha3/Label3.text = month[numEsc]['choices'][2]['choiceText']
		
	if month[numEsc]['icon'] == 'COMIDA':
		$CARD/card_exemplo1.texture = Global.foodBackground
	elif month[numEsc]['icon'] == 'LAZER':
		$CARD/card_exemplo1.texture = Global.funBackground
	elif month[numEsc]['icon'] == 'TRANSPORTE':
		$CARD/card_exemplo1.texture = Global.transportBackground
	else:
		$CARD/card_exemplo1.texture = Global.fallbackBackground

#Esconde a mostra alguns elementos para quando a escolha entra em foco
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
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0

#Esconde a mostra alguns elementos para quando a escolha sai de foco
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
	$CARD.show()

#Função para abrir a barra inferior
func abrir_barra():
	$barra_inferior/AnimationPlayer.play("subir barra")
	$barra_inferior/SubirBarra.visible = false
	$barra_inferior/DescerBarra.visible = true

	#Se as escolhas estiverem na tela quando a barra inferior é aberta, as escolhas sairão da tela para não atrapalhar
	if $escolha1.margin_top <= 1090 && $escolha1.margin_top <= -500 && $escolha1.rect_scale < Vector2(1, 1) && $escolha2.rect_scale < Vector2(1, 1) && $escolha3.rect_scale < Vector2(1, 1):
		$AnimationPlayer.play("fechar_esc")
		$escolha1/botao1.hide()
		$escolha2/botao2.hide()
		$escolha3/botao3.hide()

#Função para fechar a barra inferior
func fechar_barra():
	$barra_inferior/AnimationPlayer.play("descer barra")
	$barra_inferior/DescerBarra.visible = false
	$barra_inferior/SubirBarra.visible = true

	#Se as escolhas estiverem na tela quando a barra inferior é fechada, as escolhas sairão da tela para não atrapalhar
	if $escolha1.margin_top <= 1090 && $escolha1.margin_top >= -500:
		$AnimationPlayer.play("fechar_esc")

#Função para quando a carta 1 é colocada em foco
func escolheu1():
	if Input.is_action_just_released("escolha1"):
		if month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == true:
			$CARD/Clicar_card.hide()
			$escolha1/VBoxContainer/AnimationPlayer.play("abas")
			$AnimationPlayer.play("escolheu1")
#			$"CARD/Entrar Carta".play_backwards("entrar_card")
			showEsc()
			$barra_superior.hide_all()
		elif month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == false:
			$CARD/Clicar_card.hide()
			$escolha1/VBoxContainer/AnimationPlayer.play("abas")
			$AnimationPlayer.play("escolheu1.2")
#			$"CARD/Entrar Carta".play_backwards("entrar_card")
			showEsc()
			$barra_superior.hide_all()
		elif month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == false && month[numEsc]['choices'][2]['exists'] == false:
			$CARD/Clicar_card.hide()
			$escolha1/VBoxContainer/AnimationPlayer.play("abas")
			$AnimationPlayer.play("escolheu1.1")
#			$"CARD/Entrar Carta".play_backwards("entrar_card")
			showEsc()
			$barra_superior.hide_all()

#Função para quando a carta 1 é tirada de foco
func fechou1():
	if month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == true:
		$escolha1/VBoxContainer/AnimationPlayer.play_backwards("abas")
		$AnimationPlayer.play_backwards("escolheu1")
		$"CARD/Entrar Carta".play("entrar_card")
		hideEsc()
		$barra_superior.hide_all()
	elif month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == false:
		$escolha1/VBoxContainer/AnimationPlayer.play_backwards("abas")
		$AnimationPlayer.play_backwards("escolheu1.2")
		$"CARD/Entrar Carta".play("entrar_card")
		hideEsc()
		$barra_superior.hide_all()
	elif month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == false && month[numEsc]['choices'][2]['exists'] == false:
		$escolha1/VBoxContainer/AnimationPlayer.play_backwards("abas")
		$AnimationPlayer.play_backwards("escolheu1.1")
		$"CARD/Entrar Carta".play("entrar_card")
		hideEsc()
		$barra_superior.hide_all()
	#Desce a barra inferior caso esteja aberta durante o comando anterior
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()

#Função para quando a carta 2 é colocada em foco
func escolheu2():
	if Input.is_action_just_released("escolha2"):
		if month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == true:
			$escolha2/VBoxContainer/AnimationPlayer.play("abas")
			$AnimationPlayer.play("escolheu2")
#			$"CARD/Entrar Carta".play_backwards("entrar_card")
			showEsc()
			$barra_superior.hide_all()
		elif month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == false:
			$escolha2/VBoxContainer/AnimationPlayer.play("abas")
			$AnimationPlayer.play("escolheu2.2")
#			$"CARD/Entrar Carta".play_backwards("entrar_card")
			showEsc()
			$barra_superior.hide_all()

#Função para quando a carta 2 é tirada de foco
func fechou2():
	if month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == true:
		$escolha2/VBoxContainer/AnimationPlayer.play_backwards("abas")
		$AnimationPlayer.play_backwards("escolheu2")
		$"CARD/Entrar Carta".play("entrar_card")
		hideEsc()
		$barra_superior.hide_all()
	elif month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == false:
		$escolha2/VBoxContainer/AnimationPlayer.play_backwards("abas")
		$AnimationPlayer.play_backwards("escolheu2.2")
		$"CARD/Entrar Carta".play("entrar_card")
		hideEsc()
		$barra_superior.hide_all()
	#Desce a barra inferior caso esteja aberta durante o comando anterior
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()

#Função para quando a carta 3 é colocada em foco
func escolheu3():
	if Input.is_action_just_released("escolha3"):
		if month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == true:
			$escolha3/VBoxContainer/AnimationPlayer.play("abas")
			$AnimationPlayer.play("escolheu3")
#			$"CARD/Entrar Carta".play_backwards("entrar_card")
			showEsc()
			$barra_superior.hide_all()

#Função para quando a carta 3 é colocada em foco
func fechou3():
	if month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == true:
		$escolha3/VBoxContainer/AnimationPlayer.play_backwards("abas")
		$AnimationPlayer.play_backwards("escolheu3")
		$"CARD/Entrar Carta".play("entrar_card")
		hideEsc()
		$barra_superior.hide_all()
		
	#Desce a barra inferior caso esteja aberta durante o comando anterior
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()

#Define a alteração de Status de acordo com a escolha feita
func select_card1():
	onClickChoice(0)
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0

#Define a alteração de Status de acordo com a escolha feita
func select_card2():
	onClickChoice(1)
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0

#Define a alteração de Status de acordo com a escolha feita
func select_card3():
	onClickChoice(2)
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0


func _ready():
	
	#Define os status iniciais para o jogo começar
	def_status2(1000, 50, 60, 1000)
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	$CARD/Clicar_card.hide()

	#Pega as medidas do display da tela do dispositivo e ajusta a cena de acordo
	ProjectSettings.get_setting("display/window/size/width")
	ProjectSettings.get_setting("display/window/size/height")

	#Configurações para a barra inferior iniciar fechada e o card ainda não seja apertado
	$barra_inferior/SubirBarra.visible = true
	$barra_inferior/DescerBarra.visible = false


	#Esconde botões desnecessários das escolhas
	hideEsc()

func _process(delta):
	
	#Esconde a carta quando a escolha está em foco
	if $escolha1.rect_scale.x == 1 || $escolha2.rect_scale.x == 1 || $escolha3.rect_scale.x == 1:
		$CARD.hide()
	
	#Game Over caso um dos status chege a 0
	if Global.money == 0 || Global.energy == 0 || Global.happiness == 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")
	
	#Evita algumas falhas com alguns botões
	if Input.is_action_just_pressed("escolha1") || Input.is_action_just_pressed("escolha2") || Input.is_action_just_pressed("escolha3"):
		$CARD/Clicar_card.hide()
		$AnimationPlayer.stop()
	if Input.is_action_just_released("escolha1") || Input.is_action_just_released("escolha2") || Input.is_action_just_released("escolha3"):
		$CARD/Clicar_card.show()

	monthVerify()
	
	abasEsc1()

	abasEsc2()

	abasEsc3()
	
	#Evita clicar por trás das abas das barras de status
	if $barra_superior/aba_din.visible == true || $barra_superior/aba_ene.visible == true || $barra_superior/aba_fel.visible == true || $barra_superior/aba_div.visible == true:
		$CARD/Clicar_card.hide()
	else:
		$CARD/Clicar_card.show()

	#Botão para abrir a barra inferior
	if $barra_inferior/SubirBarra.visible == true && $barra_inferior/DescerBarra.visible == false && Input.is_action_just_released("subir_barra"):
		abrir_barra()
		
	#Botão para fechar a barra inferior
	elif $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true && Input.is_action_just_released("descer_barra"):
		fechar_barra()

	#Pula a animação do texto da card quando clicada antesw da animação terminar
	if $CARD/card_exemplo1/textbox_card/text_card.percent_visible < 1 && Input.is_action_just_released("clicar_card"):
		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
		print("clicar1")
		
	#Chama as escolhas quando clica no card
	elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("clicar_card"):
		
		#Define o comportamento para quanto existem 3 escolhas
		if month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == true:
			$AnimationPlayer.play("escolhas3")
			hideEsc()
#			$CARD/Clicar_card.hide()
			print("clicar2")
			
		#Define o comportamento para quanto existem 2 escolhas
		elif month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == true && month[numEsc]['choices'][2]['exists'] == false:
			$AnimationPlayer.play("escolhas2")
			hideEsc()
			
		#Define o comportamento para quanto existe apenas uma escolha
		elif month[numEsc]['choices'][0]['exists'] == true && month[numEsc]['choices'][1]['exists'] == false && month[numEsc]['choices'][2]['exists'] == false:
			$AnimationPlayer.play("escolhas1")
			
		#Passa para a próxima carta quando a monthma não possui escolhas
		elif month[numEsc]['choices'][0]['exists'] == false && month[numEsc]['choices'][1]['exists'] == false && month[numEsc]['choices'][2]['exists'] == false:
			$CARD/SairCard.play("sair_card2")
		
		#Fecha a barra inferior para que não atrapalhe os comandos anteriores
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()
	
	#Desce as escolhas caso elas já estejam na tela quando clica no card
	if $escolha1.rect_scale.x != 1 || $escolha2.rect_scale.x != 1 || $escolha3.rect_scale.x != 1:
		if $escolha1.margin_top <= 1090 && $escolha1.margin_top <= -500 && Input.is_action_just_released("clicar_card"):
			$AnimationPlayer.play("fechar_esc")
		
		#Desce a barra inferior caso esteja aberta durante o comando anterior
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()

	#Define o comportamento quando a escolha 1 é selecionada
	if Input.is_action_just_released("select1"):
		onClickChoice(0)
		fechou1()
		$Timer.start()
		numEsc += 1
		
	#Define o comportamento quando a escolha 2 é selecionada
	elif Input.is_action_just_released("select2"):
		onClickChoice(1)
		fechou2()
		$Timer.start()
		numEsc += 1
		
	#Define o comportamento quando a escolha 3 é selecionada
	elif Input.is_action_just_released("select3"):
		onClickChoice(2)
		fechou3()
		$Timer.start()
		numEsc += 1

	#Coloca a escolha 1 em foco quando é selecionada
	escolheu1()
	
	#Reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar"):
		fechou1()

	#Coloca a escolha 2 em foco quando é selecionada
	escolheu2()
	
	#Reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar"):
		fechou2()
		
	#coloca a escolha 3 em foco quando é selecionada
	escolheu3()
	
	#Reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar"):
		fechou3()


#Anima o texto do card quando a animação de entrada termina
func _on_Entrar_Carta_animation_finished(entrar_card):
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.play("anim_text")
	$CARD/Clicar_card.show()
	clickOnCard()

#Chama a próxima carta quando a anterior sai da tela
func _on_SairCard_animation_finished(sair_card2) -> void:
	clickOnCard()
	$"CARD/Entrar Carta".play("entrar_card")
	$CARD/SairCard.stop()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	numEsc += 1

#Reseta a anição de texto assim que a carta entrar
func _on_Entrar_Carta_animation_started(entrar_card) -> void:
	$CARD/Clicar_card.hide()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	clickOnCard()

#Evita clicar na carta quando ela está saindo da tela
func _on_SairCard_animation_started(sair_card2) -> void:
	$CARD/Clicar_card.hide()

#Esconde as escolhas antes da próxima carta entrar
func _on_Timer_timeout() -> void:
	$AnimationPlayer.play("fechar_esc")
	$Timer.stop()
