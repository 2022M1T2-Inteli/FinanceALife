extends Control

#sinal para fechar todas as abas
signal hide_all

#função de mostrar aba de dinheiro
func  aba_din():
	$aba_din.show()
	$aba_ene.hide()
	$aba_fel.hide()
	$aba_div.hide()

#função de mostrar aba de energia
func aba_ene():
	$aba_din.hide()
	$aba_ene.show()
	$aba_fel.hide()
	$aba_div.hide()

#função de mostrar aba de felicidade
func aba_fel():
	$aba_din.hide()
	$aba_ene.hide()
	$aba_fel.show()
	$aba_div.hide()

#função de mostrar aba de dívida
func aba_div():
	$aba_din.hide()
	$aba_ene.hide()
	$aba_fel.hide()
	$aba_div.show()

#função que esconde todas as abas
func hide_all():
	$aba_din.hide()
	$aba_ene.hide()
	$aba_fel.hide()
	$aba_div.hide()
	emit_signal("hide_all")

func _ready() -> void:
	
	#Esconde todas as abas de início
	hide_all()

func _process(delta: float) -> void:
	
	#Aumenta o máximo de dinheiro caso o jogador ganhe mais que o limite
	if Global.money > Global.maxMoney:
		Global.maxMoney += 1000.00
		
	#Evita que o nível de dívida exceda seu valor máximo
	if Global.debt >= Global.maxDebt:
		Global.debt = Global.maxDebt
		
	#Evita que o nível de energia exceda seu valor máximo
	if Global.energy >= 100:
		Global.energy = 100
		
	#Evita que o nível de felicidade exceda seu valor máximo
	if Global.hapiness >= 100:
		Global.hapiness = 100
		
	#Evita que o nível de dinheiro exceda seu valor mínimo
	if Global.money <= 0:
		Global.money = 0
		
	#Evita que o nível de dívida exceda seu valor mínimo
	if Global.debt <= 0:
		Global.debt = 0
		
	#Evita que o nível de energia exceda seu valor mínimo
	if Global.energy <= 0:
		Global.energy = 0
		
	#Evita que o nível de felicidade exceda seu valor mínimo
	if Global.hapiness <= 0:
		Global.hapiness = 0
	
	#Define os valores das barras de status de acordo com suas variáveis referentes no código global
	$barra_superior/Nv_dinheiro.value = Global.money
	$barra_superior/Nv_energia.value = Global.energy
	$barra_superior/Nv_felicidade.value = Global.hapiness
	$barra_superior/Nv_divida.value = Global.debt
	
	
	#Define os valores máximos dos status de dinheoro e dívida de acordo com suas variáveis referentes no código global
	$barra_superior/Nv_dinheiro.max_value = Global.maxMoney
	$barra_superior/Nv_divida.max_value = Global.maxDebt
	
	#Mostra os valores de status referentes em suas respectivas abas
	$barra_superior/HBoxContainer/Value.text = str("%.2f"%(Global.money))
	$aba_din/GridContainer/HBoxContainer/NoRS.text = str("%.2f"%(Global.money))
	$aba_ene/GridContainer/HBoxContainer/NoEN.text = str(Global.energy)
	$aba_fel/GridContainer/HBoxContainer/NoFEL.text = str(Global.hapiness)
	$aba_div/GridContainer/HBoxContainer/NoDIV.text = str("%.2f"%(Global.debt))
	
	#Abre e fecha a aba de dinheiro quando a sua respectiva barra de status é pressionada
	if Input.is_action_just_released("bt_din") && $aba_din.visible == false:
		aba_din()
	elif Input.is_action_just_released("bt_din") && $aba_din.visible == true:
		hide_all()

	#Abre e fecha a aba de energia quando a sua respectiva barra de status é pressionada
	if Input.is_action_just_released("bt_ene") && $aba_ene.visible == false:
		aba_ene()
	elif Input.is_action_just_released("bt_ene") && $aba_ene.visible == true:
		hide_all()

	#Abre e fecha a aba de felicidade quando a sua respectiva barra de status é pressionada
	if Input.is_action_just_released("bt_fel") && $aba_fel.visible == false:
		aba_fel()
	elif Input.is_action_just_released("bt_fel") && $aba_fel.visible == true:
		hide_all()

	#Abre e fecha a aba de dívida quando a sua respectiva barra de status é pressionada
	if Input.is_action_just_released("bt_div") && $aba_div.visible == false:
		aba_div()
	elif Input.is_action_just_released("bt_div") && $aba_div.visible == true:
		hide_all()
