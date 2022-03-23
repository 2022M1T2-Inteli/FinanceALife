extends Control

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

func prox_carta():
	textCard = textCard + 1

func prox_esco():
	if $CARD/card_exemplo1/textbox_card/text_card.percent_visible != 1 && Input.is_action_just_released("prox_card"):
		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
	elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("prox_card"):
		set_Esc(numEsc)
		$escolha2/Label2.show()
		$AnimationPlayer3.play("entrar_esc")
		$escolha2/botao2.show()
		$CARD/clicar_card.hide()
		$escolha2/botao2.scale.y =1


var text_file_Cards = [
	"res://assets/text/Introducao/Cards/card1.tres",
	"res://assets/text/Introducao/Cards/card2.tres",
	"res://assets/text/Introducao/Cards/card3.tres",
	"res://assets/text/Introducao/Cards/card4.tres",
	"res://assets/text/Introducao/Cards/card5.tres",
	"res://assets/text/Introducao/Cards/card6.tres",
	"res://assets/text/Introducao/Cards/card7.tres",
	"res://assets/text/Introducao/Cards/card8.tres",
	"res://assets/text/Introducao/Cards/card9.tres",
	"res://assets/text/Introducao/Cards/card10.tres",
	"res://assets/text/Introducao/Cards/card11.tres",
	"res://assets/text/Introducao/Cards/card12.tres",
	"res://assets/text/Introducao/Cards/card13.tres",
	"res://assets/text/Introducao/Cards/card13.tres"
]

var text_file_Esc = [
	"res://assets/text/Introducao/Escolhas/escolha5.1.tres",
	"res://assets/text/Introducao/Escolhas/escolha6.1.tres",
	"res://assets/text/Introducao/Escolhas/escolha7.1.tres",
	"res://assets/text/Introducao/Escolhas/escolha8.1.tres",
	"res://assets/text/Introducao/Escolhas/escolha10.1.tres",
	"res://assets/text/Introducao/Escolhas/escolha12.1.tres"
]

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

onready var numEsc = 0
onready var sorteio
onready var text_esc
onready var text_card
onready var textCard = 0
onready var dinheiro = 0
onready var energia = 0 
onready var felicidde = 0
onready var divida = 0

func def_status(Din, Ene, Fel, Div):
	dinheiro = dinheiro + Din
	energia = energia + Ene
	felicidde = felicidde + Fel
	divida = divida + Div

func set_Card(numFundo, numText):
	$CARD/card_exemplo1.texture = fundo[numFundo]
#	$CARD/card_exemplo1/img_card.texture = icon[num]
	text_card = text_file_Cards[numText]
	$CARD/card_exemplo1/textbox_card/text_card.text = load_file(text_card)

func set_Esc(numEsc):
	text_esc = text_file_Esc[numEsc]
	$escolha2/Label2.text = load_file(text_esc)

func _ready() -> void:
	$AnimationPlayer.play("entrar_carta")
	$AnimationPlayer4.play("RESET")
	$CARD/clicar_card.hide()
	set_Card(random_card(), textCard)
	def_status(0, 100, 100, 0)
	$Seta.show()
	$Seta2/AnimationPlayer.play("RESET")
	

func _process(delta: float) -> void:
	
	$barra_superior/barra_superior/Nv_dinheiro.value = dinheiro
	$barra_superior/barra_superior/Nv_energia.value = energia
	$barra_superior/barra_superior/Nv_felicidade.value = felicidde
	$barra_superior/barra_superior/Nv_divida.value = divida
	
	if $escolha2.rect_scale == Vector2(1,1) && $escolha2.margin_left <= 550:
		$CARD/clicar_card.hide()
#		$AnimationPlayer.stop()
	
	if numEsc >= 5:
		numEsc = 5
	
	if $escolha2.rect_scale.x != 1 && Input.is_action_just_pressed("escolha2"):
#		$AnimationPlayer.stop()
		$AnimationPlayer4.play("foco_esc")
		$escolha2/botao2.hide()
		$escolha2/select.show()
		$Seta2.hide()
		numEsc = numEsc + 1
	
	
	if Input.is_action_just_released("prox_card"):
		if textCard == 4:
			prox_esco()
		elif textCard == 5:
			prox_esco()
		elif textCard == 6:
			prox_esco()
		elif textCard == 7:
			prox_esco()
		elif textCard == 9:
			prox_esco()
		elif textCard == 11:
			prox_esco()
		elif textCard == 12:
			if $CARD/card_exemplo1/textbox_card/text_card.percent_visible != 1 && Input.is_action_just_released("prox_card"):
				$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
				$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
			elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("prox_card"):
				get_tree().change_scene("res://scenes/UIdoGame.tscn")
		elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible != 1 && Input.is_action_just_released("prox_card"):
			$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
			$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
		elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && Input.is_action_just_released("prox_card") && $escolha2.rect_scale != Vector2(1,1) || $escolha2.margin_left >= 550:
			$AnimationPlayer2.play("sair_card")
			$CARD/clicar_card.hide()
			if textCard == 2:
				def_status(2000, 0, 0 , 2000)
			
	if Input.is_action_just_released("select2"):
		$escolha2/Label2.hide()
		$escolha2/select.hide()
		$AnimationPlayer4.play("prox_esc")
		$AnimationPlayer2.play("sair_card")
		def_status(0, 0, 0, 0)
		if textCard == 4:
			def_status(0, -10, -10, 0)
		elif textCard == 5:
			def_status(0, -10, -10, 0)
		elif textCard == 6:
			def_status(0, -10, -10, 0)
		elif textCard == 7:
			def_status(-100, 0, -20, 0)
		elif textCard == 9:
			def_status(-50, 10, 0, 0)
		elif textCard == 11:
			def_status(-200, -20, 20, 200)
	
	if $escolha2.rect_scale.x >= 5:
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0

func _on_AnimationPlayer_animation_finished(entrar_card) -> void:
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.play("anim_text")
	$CARD/clicar_card.show()
	$Seta/seta.play("seta")
	
func _on_AnimationPlayer2_animation_finished(sair_card) -> void:
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	prox_carta()
	$CARD/clicar_card.hide()
	set_Card(random_card(), textCard)
	$AnimationPlayer.play("entrar_carta")

func _on_AnimationPlayer2_animation_started(sair_card) -> void:
	$CARD/clicar_card.hide()
	$Seta.hide()

func _on_AnimationPlayer4_animation_started(prox_esc) -> void:
	$CARD/clicar_card.hide()



func _on_AnimationPlayer3_animation_started(entrar_esc) -> void:
	$Seta2/AnimationPlayer.play("seta")
