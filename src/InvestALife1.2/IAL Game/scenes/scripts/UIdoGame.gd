extends Control

#define os arquivos de texto das cards de escolha
var texto = false
var escolhas_txt = [
	"res://assets/text/text_escolhas/escolha1.tres",
	"res://assets/text/text_escolhas/escolha2.tres",
	"res://assets/text/text_escolhas/escolha3.tres"
]
#função de fechar a barra inferior
func fechar_barra():
	$barra_inferior/AnimationPlayer.play("descer barra")
	$barra_inferior/DescerBarra.visible = false
	$barra_inferior/SubirBarra.visible = true

#função para leitura e mostragem do texto contida no arquivo
func load_file(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	return text

func _ready():
	
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

	#abrir a barra inferior
	if $barra_inferior/SubirBarra.visible == true && $barra_inferior/DescerBarra.visible == false && Input.is_action_just_released("subir_barra"):
		$barra_inferior/AnimationPlayer.play("subir barra")
		$barra_inferior/SubirBarra.visible = false
		$barra_inferior/DescerBarra.visible = true

		#se as escolhas estiverem na tela quando a barra inferior é aberta, as escolhas sairão da tela para não atrapalhar
		if $escolha1.margin_top <= 1090 && $escolha1.margin_top <= -500 && $escolha1.rect_scale < Vector2(1, 1) && $escolha2.rect_scale < Vector2(1, 1) && $escolha3.rect_scale < Vector2(1, 1):
			$AnimationPlayer.play_backwards("escolheu1")
			$AnimationPlayer.play_backwards("escolhas")
			$CARD/Clicar_card.scale.y = 0.902
		
	#fechar barra inferior
	elif $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true && Input.is_action_just_released("descer_barra"):
		fechar_barra()
		
		#se as escolhas estiverem na tela quando a barra inferior é fechada, as escolhas sairão da tela para não atrapalhar
		if $escolha1.margin_top <= 1090 && $escolha1.margin_top >= -500:
			$AnimationPlayer.play_backwards("escolhas")
			$CARD/Clicar_card.scale.y = 1
		
	#chamar as escolhas quando clica no card
	if $escolha1.margin_top >= 1090 && Input.is_action_just_released("clicar_card"):
		$CARD/card_exemplo1/textbox_card/text_card/AnimationPlayer.stop()
		$CARD/card_exemplo1/textbox_card/text_card.percent_visible = 1
		$AnimationPlayer.play("escolhas")
		$CARD/Clicar_card.scale.y = 0.814
		
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
	if Input.is_action_just_released("escolha1"):
		$AnimationPlayer.play("escolheu1")
		$escolha1/botao1.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha1/fechar.show()
		$escolha1/select.show()
	
	#reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar") && $escolha1.margin_top <= -500:
		$AnimationPlayer.play_backwards("escolheu1")
		$escolha1/botao1.show()
		$CARD/Clicar_card.show()
		$"CARD/Entrar Carta".play("entrar_card")
		$escolha1/fechar.hide()
		$escolha1/select.hide()
		
		#desce a barra inferior caso esteja aberta durante o comando anterior
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()
	
	#coloca a escolha 2 em foco quando é selecionada
	if Input.is_action_just_released("escolha2"):
		$AnimationPlayer.play("escolheu2")
		$escolha2/botao2.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha2/fechar.show()
		$escolha2/select.show()
	
	#reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar") && $escolha2.margin_top <= -500:
		$AnimationPlayer.play_backwards("escolheu2")
		$escolha2/botao2.show()
		$CARD/Clicar_card.show()
		$"CARD/Entrar Carta".play("entrar_card")
		$escolha2/fechar.hide()
		$escolha2/select.hide()
		
		#desce a barra inferior caso esteja aberta durante o comando anterior
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()
		
	#coloca a escolha 3 em foco quando é selecionada
	if Input.is_action_just_released("escolha3"):
		$AnimationPlayer.play("escolheu3")
		$escolha3/botao3.hide()
		$CARD/Clicar_card.hide()
		$"CARD/Entrar Carta".play_backwards("entrar_card")
		$escolha3/fechar.show()
		$escolha3/select.show()
	
	#reseta a posição da escolha e da(s) card(s) quando a escolha em foco é fechada
	if Input.is_action_just_released("fechar") && $escolha3.margin_top <= -500:
		$AnimationPlayer.play_backwards("escolheu3")
		$escolha3/botao3.show()
		$CARD/Clicar_card.show()
		$"CARD/Entrar Carta".play("entrar_card")
		$escolha3/fechar.hide()
		$escolha3/select.hide()
		
		#desce a barra inferior caso esteja aberta durante o comando anterior
		if $barra_inferior/SubirBarra.visible == false && $barra_inferior/DescerBarra.visible == true:
			fechar_barra()






