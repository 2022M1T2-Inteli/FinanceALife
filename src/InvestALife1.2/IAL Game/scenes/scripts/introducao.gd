extends Control

var mes1 = Global.cardsArray1

func onClickChoice():
	def_status(mes1[numEsc]['choices'][1]['money'],mes1[numEsc]['choices'][1]['energy'], mes1[numEsc]['choices'][1]['hapiness'], mes1[numEsc]['choices'][1]['debt'])
	
	
func load_file(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	return text

func random_card():
	#seleciona um nº de 0 a 8
	var sortear = RandomNumberGenerator.new()
	sortear.randomize();
	sorteio = sortear.randi_range(0, 8);
	return sorteio

#func prox_carta():
#	textCard = textCard + 1

func clicar_card():
	if $CARD/card_exemplo1/textbox_card/text_card.percent_visible != 1 && Input.is_action_just_released("clicar_card"):
		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
	elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("clicar_card"):
#		clickOnCard()
		$escolha2/Label2.show()
		$AnimationPlayer3.play("entrar_esc")
		$escolha2/botao2.show()
		$CARD/clicar_card.hide()
		$escolha2/botao2.scale.y =1
		
func clickOnCard():
	$CARD/card_exemplo1/textbox_card/text_card.text = mes1[numEsc]['cardText']
	
	if mes1[numEsc]['choices'][1]['exists'] == true and mes1[numEsc]['choices'][0]['exists'] == false and mes1[numEsc]['choices'][2]['exists'] == false:
		print(mes1[numEsc]['choices'][1]['choiceText'])
		$escolha2/Label2.text = mes1[numEsc]['choices'][1]['choiceText']
		clicar_card()
		


#var text_file_Cards = [
#	"res://assets/text/Introducao/Cards/card1.tres",
#	"res://assets/text/Introducao/Cards/card2.tres",
#	"res://assets/text/Introducao/Cards/card3.tres",
#	"res://assets/text/Introducao/Cards/card4.tres",
#	"res://assets/text/Introducao/Cards/card5.tres",
#	"res://assets/text/Introducao/Cards/card6.tres",
#	"res://assets/text/Introducao/Cards/card7.tres",
#	"res://assets/text/Introducao/Cards/card8.tres",
#	"res://assets/text/Introducao/Cards/card9.tres",
#	"res://assets/text/Introducao/Cards/card10.tres",
#	"res://assets/text/Introducao/Cards/card11.tres",
#	"res://assets/text/Introducao/Cards/card12.tres",
#	"res://assets/text/Introducao/Cards/card13.tres",
#	"res://assets/text/Introducao/Cards/card13.tres"
#]

#var text_file_Esc = [
#	"res://assets/text/Introducao/Escolhas/escolha5.1.tres",
#	"res://assets/text/Introducao/Escolhas/escolha6.1.tres",
#	"res://assets/text/Introducao/Escolhas/escolha7.1.tres",
#	"res://assets/text/Introducao/Escolhas/escolha8.1.tres",
#	"res://assets/text/Introducao/Escolhas/escolha10.1.tres",
#	"res://assets/text/Introducao/Escolhas/escolha12.1.tres"
#]

var fundo = [
	load("res://assets/sprites/fundos_cards/fundo_card1.png"),
	load("res://assets/sprites/fundos_cards/fundo_card2.png"),
	load("res://assets/sprites/fundos_cards/fundo_card3.png"),
	load("res://assets/sprites/fundos_cards/fundo_card4.png"),
	load("res://assets/sprites/fundos_cards/fundo_card5.png"),
	load("res://assets/sprites/fundos_cards/fundo_card6.png"),
	load("res://assets/sprites/fundos_cards/fundo_card7.png"),
	load("res://assets/sprites/fundos_cards/fundo_card8.png"),
	load("res://assets/sprites/fundos_cards/fundo_card9.png")
]

onready var hideAll
onready var numEsc = Global.numEsc
onready var sorteio
onready var text_esc
onready var text_card
onready var textCard = 0
#onready var dinheiro = Global.money
#onready var energia  = Global.energy
#onready var felicidde = Global.hapiness
#onready var divida = Global.debt

func def_status(Din, Ene, Fel, Div):
	Global.money += Din
	Global.energy += Ene
	Global.hapiness += Fel
	Global.debt += Div

func set_Card(numFundo, numText):
	$CARD/card_exemplo1.texture = fundo[numFundo]
#	$CARD/card_exemplo1/img_card.texture = icon[num]
#	text_card = text_file_Cards[numText]
#	$CARD/card_exemplo1/textbox_card/text_card.text = load_file(text_card)

#func set_Esc(numEsc):
#	text_esc = text_file_Esc[numEsc]
#	$escolha2/Label2.text = load_file(text_esc)

func _ready() -> void:
#	def_status(0, 100, 100, 0)
	$AnimationPlayer.play("entrar_carta")
	$AnimationPlayer4.play("RESET")
	$CARD/clicar_card.hide()
	clickOnCard()
#	set_Card(random_card(), textCard)
#	def_status(0, 100, 100, 0)
	$Seta.show()
	$Seta2/AnimationPlayer.play("RESET")
	
	

func _process(delta: float) -> void:
	print(numEsc)
	if numEsc >= 13:
		numEsc = 13
#	$barra_superior/barra_superior/Nv_dinheiro.value = dinheiro
#	$barra_superior/barra_superior/Nv_energia.value = energia
#	$barra_superior/barra_superior/Nv_felicidade.value = felicidde
#	$barra_superior/barra_superior/Nv_divida.value = divida

#	Global.money = dinheiro
#	Global.energy = energia
#	Global.hapiness = felicidde
#	Global.debt = divida
	
	if $barra_superior/aba_din.visible == true || $barra_superior/aba_ene.visible == true || $barra_superior/aba_fel.visible == true || $barra_superior/aba_div.visible == true:
		$CARD/clicar_card.hide()

	if $escolha2.rect_scale == Vector2(1,1) && $escolha2.margin_left <= 550:
		$CARD/clicar_card.hide()
#		$AnimationPlayer.stop()
	
#	if numEsc >= 5:
#		numEsc = 5
	
	if $escolha2.rect_scale.x != 1 && Input.is_action_just_pressed("escolha2"):
		$barra_superior.hide_all()
		$escolha2/VBoxContainer/AnimationPlayer.play("abas")
#		$AnimationPlayer.stop()
		$AnimationPlayer4.play("foco_esc")
		$escolha2/botao2.hide()
		$escolha2/select.show()
		$Seta2.hide()
#		numEsc = numEsc + 1
	
	
	if Input.is_action_just_released("clicar_card"):
#		if textCard == 4: 
#			prox_esco()
#		elif textCard == 5:
#			prox_esco()
#		elif textCard == 6:
#			prox_esco()
#		elif textCard == 7:
#			prox_esco()
#		elif textCard == 9:
#			prox_esco()
#		elif textCard == 11:
#			prox_esco()
#		elif textCard == 12:
#			if $CARD/card_exemplo1/textbox_card/text_card.percent_visible != 1 && Input.is_action_just_released("prox_card"):
#				$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
#				$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
#			elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("prox_card"):
#				get_tree().change_scene("res://scenes/UIdoGame.tscn")
		if $CARD/card_exemplo1/textbox_card/text_card.percent_visible != 1 && Input.is_action_just_released("clicar_card"):
			$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
			$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
		elif mes1[numEsc]['choices'][1]['exists'] == true and mes1[numEsc]['choices'][0]['exists'] == false and mes1[numEsc]['choices'][2]['exists'] == false:
			print(mes1[numEsc]['choices'])
			$escolha2/Label2.text = mes1[numEsc]['choices'][1]['choiceText']
			clicar_card()
	
		elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("clicar_card") && $escolha2.rect_scale != Vector2(1,1) || $escolha2.margin_left >= 550:
			$AnimationPlayer2.play("sair_card")
			$CARD/clicar_card.hide()
			numEsc += 1
			if numEsc == 3:
				def_status(1000, 0, 0 , 1000)
			
	if Input.is_action_just_released("select2"):
		onClickChoice()
		$barra_superior.hide_all()
		$escolha2/Label2.hide()
		$escolha2/select.hide()
		$AnimationPlayer4.play("prox_esc")
		$AnimationPlayer2.play("sair_card")
		numEsc += 1
#		if textCard == 4:
#			def_status(0, -10, -10, 0)
#		elif textCard == 5:
#			def_status(0, -10, -10, 0)
#		elif textCard == 6:
#			def_status(0, -10, -10, 0)
#		elif textCard == 7:
#			def_status(-100, 0, -20, 0)
#		elif textCard == 9:
#			def_status(-50, 10, 0, 0)
#		elif textCard == 11:
#			def_status(-200, -20, 20, 200)
	
	if $escolha2.rect_scale.x >= 5:
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
		
	if numEsc == 13:
		get_tree().change_scene("res://scenes/UIdoGame.tscn")

func _on_AnimationPlayer_animation_finished(entrar_card) -> void:
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.play("anim_text")
	$CARD/clicar_card.show()
	$Seta/seta.play("seta")
	
func _on_AnimationPlayer2_animation_finished(sair_card) -> void:
	clickOnCard()
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	$CARD/clicar_card.hide()
	$AnimationPlayer.play("entrar_carta")

func _on_AnimationPlayer2_animation_started(sair_card) -> void:
	$CARD/clicar_card.hide()
	$Seta.hide()

func _on_AnimationPlayer4_animation_started(prox_esc) -> void:
	$CARD/clicar_card.hide()

func _on_AnimationPlayer3_animation_started(entrar_esc) -> void:
	$Seta2/AnimationPlayer.play("seta")

func _on_barra_superior_hide_all() -> void:
	$CARD/clicar_card.show()
