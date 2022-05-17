extends Control

func random_card():
	#seleciona um nº de 0 a 2
	var sortear = RandomNumberGenerator.new()
	sortear.randomize();
	var sorteio = sortear.randi_range(0, 2);
	print(sorteio)
	
func _process(delta: float) -> void:
	random_card()
