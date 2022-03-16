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

onready var sorteio
onready var text_esc
onready var text_card
onready var textCard = 0

func set_Card(numFundo, numText):
	$CARD/card_exemplo1.texture = fundo[numFundo]
#	$CARD/card_exemplo1/img_card.texture = icon[num]
	text_card = text_file_Cards[numText]
	$CARD/card_exemplo1/textbox_card/text_card.text = load_file(text_card)

func set_Esc(numEsc):
	text_esc = text_file_Esc[numEsc]
	$escolha2/Label2.text = load_file(text_esc)

func _ready() -> void:
	$CARD/clicar_card.hide()
	set_Card(random_card(), textCard)
	

func _process(delta: float) -> void:
	
	
	if $escolha2.rect_scale.x == 0.5 && Input.is_action_just_released("escolha2"):
		$AnimationPlayer.play_backwards("entrar_carta")
		$AnimationPlayer4.play("foco_esc")
		$escolha2.hide()
		$escolha2/botao2.hide()
		$escolha2/select.show()
	
	if Input.is_action_just_released("select2"):
		$escolha2/select.hide()
		$AnimationPlayer4.play("prox_esc")
	
	if textCard == 2 && Input.is_action_just_released("prox_card"):
		set_Esc(0)
		$AnimationPlayer3.play("entrar_esc")
		$escolha2/botao2.show()
		$CARD/clicar_card.hide()
		$escolha2/botao2.scale.y =1
	
		
	elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible != 1 && textCard !=2  && Input.is_action_just_released("prox_card"):
		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
	
	elif $CARD/card_exemplo1/textbox_card/text_card.percent_visible == 1 && textCard != 2 && Input.is_action_just_released("prox_card"):
		$AnimationPlayer2.play("sair_card")
		$CARD/clicar_card.hide()
	
	
		
func _on_AnimationPlayer_animation_finished(entrar_card) -> void:
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.play("anim_text")
	$CARD/clicar_card.show()
		
func _on_AnimationPlayer_animation_started(sair_card) -> void:
	$CARD/clicar_card.hide()


func _on_AnimationPlayer2_animation_finished(sair_card) -> void:
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	textCard = textCard + 1
	$CARD/clicar_card.hide()
	set_Card(random_card(), textCard)
	$AnimationPlayer.play("entrar_carta")


func _on_AnimationPlayer4_animation_finished(prox_esc) -> void:
	$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 0
	textCard = textCard + 1
	$CARD/clicar_card.hide()
	set_Card(random_card(), textCard)
	$AnimationPlayer.play("entrar_carta")
