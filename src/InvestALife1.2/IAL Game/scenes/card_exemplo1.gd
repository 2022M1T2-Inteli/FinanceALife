extends TextureRect


var fundo = [
	load("res://assets/sprites/fundo_card1.png"), 
	load("res://assets/sprites/fundo_card2.png"), 
	load("res://assets/sprites/fundo_card3.png")
	]

var icon = [
	load("res://assets/sprites/img_card_exemplo1.png"),
	load("res://assets/sprites/img_card_exemplo2.png"),
	load("res://assets/sprites/img_card_exemplo3.png")
	]

func _ready() -> void:
	
	
	var sortear = RandomNumberGenerator.new()
	sortear.randomize();
	var sorteio = sortear.randi_range(0, 2);
	print(sorteio)
	
	self.texture = fundo[sorteio]
	$img_card.texture = icon[sorteio]

	
	



