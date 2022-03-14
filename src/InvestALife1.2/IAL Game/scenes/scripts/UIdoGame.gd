extends Control

#define os arquivos de texto das cards de escolha
var texto = false
var escolhas_txt = [
	"res://assets/text/text_escolhas/escolha1.tres",
	"res://assets/text/text_escolhas/escolha2.tres",
	"res://assets/text/text_escolhas/escolha3.tres"
]

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

<<<<<<< HEAD
func _ready():
	print('chegou')
	
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
	
	var escolha1 = escolhas_txt[0]
	var escolha2 = escolhas_txt[1]
	var escolha3 = escolhas_txt[2]
	$escolha1/Label.text = load_file(escolha1)
	$escolha2/Label2.text = load_file(escolha2)
	$escolha3/Label3.text = load_file(escolha3)
#	$escolha1/fechar.hide()
#	$escolha2/fechar.hide()
#	$escolha3/fechar.hide()
	
func _process(delta):
=======
var fundo = [
	load("res://assets/sprites/fundos_cards/fundo_card1.png"), 
	load("res://assets/sprites/fundos_cards/fundo_card2.png"), 
	load("res://assets/sprites/fundos_cards/fundo_card3.png")
	]
>>>>>>> 78144da82f161d35b926eedee92e58deac945628

#load icones para card de exemblo
var icon = [
	load("res://assets/sprites/imgs_cards/img_card_exemplo1.png"),
	load("res://assets/sprites/imgs_cards/img_card_exemplo2.png"),
	load("res://assets/sprites/imgs_cards/img_card_exemplo3.png")
	]

#load textos para card de exemplo
var text_file = [
	("res://assets/text/text_card1.tres"),
	("res://assets/text/text_card2.tres"),
	("res://assets/text/text_card3.tres")
]

#função para randomizar o card
func random_card():
	#seleciona um nº de 0 a 2
	var sortear = RandomNumberGenerator.new()
	sortear.randomize();
	sorteio = sortear.randi_range(0, 2);
	print(sorteio)

	#set fundo, icone e texto sorteado no card
	$CARD/card_exemplo1.texture = fundo[sorteio]
	$CARD/card_exemplo1/img_card.texture = icon[sorteio]
	text_card = text_file[sorteio]
	$CARD/card_exemplo1/textbox_card/text_card.text = load_file(text_card)

onready var text_card
onready var sorteio
onready var max_divida = 1000.00
onready var max_dinheiro = 1000.00
onready var nv_dinheiro = 700.00
onready var nv_energia = 70
onready var nv_felicidade = 60
onready var nv_divida = 800.00

func escolheu1():
	if Input.is_action_just_released("escolha1"):
		$AnimationPlayer.play("escolheu1")
		$escolha1/botao1.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha1/fechar.show()
		$escolha1/select.show()

func fechou1():
	$AnimationPlayer.play_backwards("escolheu1")
	$escolha1/botao1.show()
	$CARD/Clicar_card.show()
	$"CARD/Entrar Carta".play("entrar_card")
	$escolha1/fechar.hide()
	$escolha1/select.hide()
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()

func escolheu2():
	if Input.is_action_just_released("escolha2"):
		$AnimationPlayer.play("escolheu2")
		$escolha2/botao2.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha2/fechar.show()
		$escolha2/select.show()

func fechou2():
	$AnimationPlayer.play_backwards("escolheu2")
	$escolha2/botao2.show()
	$CARD/Clicar_card.show()
	$"CARD/Entrar Carta".play("entrar_card")
	$escolha2/fechar.hide()
	$escolha2/select.hide()
		
	#desce a barra inferior caso esteja aberta durante o comando anterior
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()

func escolheu3():
	if Input.is_action_just_released("escolha3"):
		$AnimationPlayer.play("escolheu3")
		$escolha3/botao3.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha3/fechar.show()
		$escolha3/select.show()

func fechou3():
	$AnimationPlayer.play_backwards("escolheu3")
	$escolha3/botao3.show()
	$CARD/Clicar_card.show()
	$"CARD/Entrar Carta".play("entrar_card")
	$escolha3/fechar.hide()
	$escolha3/select.hide()
		
	#desce a barra inferior caso esteja aberta durante o comando anterior
	if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
		fechar_barra()

func select_card1(text, dinheiro, energia, felicidade, divida):
	if text_card == text && Input.is_action_just_released("select1"):
		nv_dinheiro = nv_dinheiro + dinheiro
		nv_energia = nv_energia + energia
		nv_felicidade = nv_felicidade + felicidade
		nv_divida = nv_divida + divida
		fechou1()
		$Timer.start()
		if sorteio == 0:
			sorteio = 1
		elif sorteio == 1:
			sorteio = 2
		elif sorteio == 2:
			sorteio = 0

func select_card2(text, dinheiro, energia, felicidade, divida):
	if text_card == text && Input.is_action_just_released("select2"):
		nv_dinheiro = nv_dinheiro + dinheiro
		nv_energia = nv_energia + energia
		nv_felicidade = nv_felicidade + felicidade
		nv_divida = nv_divida + divida
		fechou2()
		$Timer.start()
		if sorteio == 0:
			sorteio = 1
		elif sorteio == 1:
			sorteio = 2
		elif sorteio == 2:
			sorteio = 0

func select_card3(text, dinheiro, energia, felicidade, divida):
	if text_card == text && Input.is_action_just_released("select3"):
		nv_dinheiro = nv_dinheiro + dinheiro
		nv_energia = nv_energia + energia
		nv_felicidade = nv_felicidade + felicidade
		nv_divida = nv_divida + divida
		fechou3()
		$Timer.start()
		if sorteio == 0:
			sorteio = 1
		elif sorteio == 1:
			sorteio = 2
		elif sorteio == 2:
			sorteio = 0

func _ready():

	random_card()

	#programa pega as medidas do display da tela do dispositivo e ajusta a cena
	ProjectSettings.get_setting("display/window/size/width")
	ProjectSettings.get_setting("display/window/size/height")

	#configurações para a barra inferior iniciar fechada e o card ainda não seja apertado
	$barra_inferior/SubirBarra.visible = true
	$barra_inferior/DescerBarra.visible = false
	$CARD/Clicar_card.visible = false

	#esconde botões desnecessários das escolhas
	$escolha1/fechar.hide()
	$escolha2/fechar.hide()
	$escolha3/fechar.hide()
	$escolha1/select.hide()
	$escolha2/select.hide()
	$escolha3/select.hide()

	#define texto genérico para as cards de escolha
	var escolha1 = escolhas_txt[0]
	var escolha2 = escolhas_txt[1]
	var escolha3 = escolhas_txt[2]
	$escolha1/Label.text = load_file(escolha1)
	$escolha2/Label2.text = load_file(escolha2)
	$escolha3/Label3.text = load_file(escolha3)

#anima o texto do card quando a animação de entrada termina
func _on_Entrar_Carta_animation_finished(entrar_card):
	$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.play("anim_text")
	texto = true
	$CARD/Clicar_card.visible = true

func _process(delta):
	
	$CARD/card_exemplo1.texture = fundo[sorteio]
	$CARD/card_exemplo1/img_card.texture = icon[sorteio]
	text_card = text_file[sorteio]
	$CARD/card_exemplo1/textbox_card/text_card.text = load_file(text_card)
	
	$barra_superior/barra_superior/Nv_divida.max_value = max_divida
	$barra_superior/barra_superior/Nv_dinheiro.max_value = max_dinheiro
	$barra_superior/barra_superior/Nv_dinheiro.value = nv_dinheiro
	$barra_superior/barra_superior/Nv_energia.value = nv_energia
	$barra_superior/barra_superior/Nv_felicidade.value = nv_felicidade
	$barra_superior/barra_superior/Nv_divida.value = nv_divida
	
	if nv_dinheiro >= max_dinheiro:
		nv_dinheiro = max_dinheiro
	if nv_divida >= max_divida:
		nv_divida = max_divida
	if nv_energia >= 100:
		nv_energia = 100
	if nv_felicidade >= 100:
		nv_felicidade = 100
	if nv_dinheiro <= 0:
		nv_dinheiro = 0
	if nv_divida <= 0:
		nv_divida = 0
	if nv_energia <= 0:
		nv_energia = 0
	if nv_felicidade <= 0:
		nv_felicidade = 0
	
	#abrir a barra inferior
	if $barra_inferior/SubirBarra.visible == true && $barra_inferior/DescerBarra.visible == false && Input.is_action_just_released("subir_barra"):
		abrir_barra()
		
	#fechar barra inferior
	elif $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true && Input.is_action_just_released("descer_barra"):
		fechar_barra()
		
		
		
	#chamar as escolhas quando clica no card
	if $escolha1.margin_top >= 1090 && Input.is_action_just_released("clicar_card"):
		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
		$AnimationPlayer.play("escolhas")
		$escolha1/botao1.show()
		$escolha2/botao2.show()
		$escolha3/botao3.show()
		
		#fecha a barra inferior para que não atrapalhe o comando anterior
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()

	#descer as escolhas caso elas já estejam na tela quando clica no card
	if $escolha1.margin_top <= 1090 && $escolha1.margin_top <= -500 && Input.is_action_just_released("clicar_card"):
		$AnimationPlayer.play_backwards("escolhas")
		$CARD/Clicar_card.scale.y = 1
		
		#desce a barra inferior caso esteja aberta durante o comando anterior
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()

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

	select_card1("res://assets/text/text_card1.tres", 100.00, -20, -30, -500.00)
	select_card2("res://assets/text/text_card1.tres", 200.00, -40, -40, -400.00)
	select_card3("res://assets/text/text_card1.tres", -300.00, 30, 40, 200)
	
	select_card1("res://assets/text/text_card2.tres", -250, 300, -20, -200)
	select_card2("res://assets/text/text_card2.tres", 200, -40, 30, 70)
	select_card3("res://assets/text/text_card2.tres", 100, -20, -10, -50)
	
	select_card1("res://assets/text/text_card3.tres", 700, -60, 60, -200)
	select_card2("res://assets/text/text_card3.tres", -500, 70, -30, 30)
	select_card3("res://assets/text/text_card3.tres", 170, 30, -10, 100)

func _on_Timer_timeout() -> void:
			$AnimationPlayer.play_backwards("escolhas")
			$CARD/Clicar_card.scale.y = 1
			$Timer.stop()
		
