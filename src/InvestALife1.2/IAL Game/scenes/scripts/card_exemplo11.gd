extends GridContainer

var fundo = [
	load("res://assets/sprites/fundos_cards/fundo_card1.png"), 
	load("res://assets/sprites/fundos_cards/fundo_card2.png"), 
	load("res://assets/sprites/fundos_cards/fundo_card3.png")
	]

var icon = [
	load("res://assets/sprites/imgs_cards/img_card_exemplo1.png"),
	load("res://assets/sprites/imgs_cards/img_card_exemplo2.png"),
	load("res://assets/sprites/imgs_cards/img_card_exemplo3.png")
	]

var text_file = [
	("res://assets/text/text_card1.tres"),
	("res://assets/text/text_card2.tres"),
	("res://assets/text/text_card3.tres")
]


	
func _ready() -> void:
	
	var sortear = RandomNumberGenerator.new()
	sortear.randomize();
	var sorteio = sortear.randi_range(0, 2);
	# print(sorteio)
	
	$card_exemplo1.texture = fundo[sorteio]
	$card_exemplo1/img_card.texture = icon[sorteio]
	var text_card = text_file[sorteio]
	$card_exemplo1/textbox_card/text_card.text = load_file(text_card)
	
func load_file(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	return text
	
#func _process(delta: float) -> void:
#	var anim = get_node("AnimationPlayer")
#	anim.emit_signal("animation_finished")
#	var anim_texto = get_node("card_exemplo1/textbox_card/text_card/AnimationPlayer")
#	anim_texto.connect("animation_finished", anim_texto, "play", [anim_texto])
