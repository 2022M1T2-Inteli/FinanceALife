extends GridContainer

#var text_card
#var sorteio
#
#func load_file(file_path):
#	var file = File.new()
#	file.open(file_path, file.READ)
#	var text = file.get_as_text()
#	return text
#
##load fundos para o card de exemplo
#var fundo = [
#	load("res://assets/sprites/fundos_cards/fundo_card1.png"), 
#	load("res://assets/sprites/fundos_cards/fundo_card2.png"), 
#	load("res://assets/sprites/fundos_cards/fundo_card3.png")
#	]
#
##load icones para card de exemblo
#var icon = [
#	load("res://assets/sprites/imgs_cards/img_card_exemplo1.png"),
#	load("res://assets/sprites/imgs_cards/img_card_exemplo2.png"),
#	load("res://assets/sprites/imgs_cards/img_card_exemplo3.png")
#	]
#
##load textos para card de exemplo
#var text_file = [
#	("res://assets/text/text_card1.tres"),
#	("res://assets/text/text_card2.tres"),
#	("res://assets/text/text_card3.tres")
#]
#
##função para randomizar o card
#func random_card():
#	#seleciona um nº de 0 a 2
#	var sortear = RandomNumberGenerator.new()
#	sortear.randomize();
#	sorteio = sortear.randi_range(0, 2);
#	print(sorteio)
#
#	#set fundo, icone e texto sorteado no card
#	$card_exemplo1.texture = fundo[sorteio]
#	$card_exemplo1/img_card.texture = icon[sorteio]
#	text_card = text_file[sorteio]
#	$card_exemplo1/textbox_card/text_card.text = load_file(text_card)
#
#
#func _ready() -> void:
#	random_card()
##função para leitura e mostragem do texto contida no arquivo

	
<<<<<<< HEAD
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
=======
>>>>>>> 78144da82f161d35b926eedee92e58deac945628
