extends Control

signal hide_all

#func sub(val):
#	Global.energy += val

func  aba_din():
	$aba_din.show()
	$aba_ene.hide()
	$aba_fel.hide()
	$aba_div.hide()

func aba_ene():
	$aba_din.hide()
	$aba_ene.show()
	$aba_fel.hide()
	$aba_div.hide()

func aba_fel():
	$aba_din.hide()
	$aba_ene.hide()
	$aba_fel.show()
	$aba_div.hide()

func aba_div():
	$aba_din.hide()
	$aba_ene.hide()
	$aba_fel.hide()
	$aba_div.show()

func hide_all():
	$aba_din.hide()
	$aba_ene.hide()
	$aba_fel.hide()
	$aba_div.hide()
	emit_signal("hide_all")

func _ready() -> void:
	hide_all()
	
	
func _process(delta: float) -> void:
	
	if Global.money >= Global.maxMoney:
		Global.money = Global.maxMoney
	if Global.debt >= Global.maxDebt:
		Global.debt = Global.maxDebt
	if Global.energy >= 100:
		Global.energy = 100
	if Global.hapiness >= 100:
		Global.hapiness = 100
	if Global.money <= 0:
		Global.money = 0
	if Global.debt <= 0:
		Global.debt = 0
	if Global.energy <= 0:
		Global.energy = 0
	if Global.hapiness <= 0:
		Global.hapiness = 0
	
	$barra_superior/Nv_dinheiro.value = Global.money
	$barra_superior/Nv_energia.value = Global.energy
	$barra_superior/Nv_felicidade.value = Global.hapiness
	$barra_superior/Nv_divida.value = Global.debt
	
	$barra_superior/Nv_dinheiro.max_value = Global.maxMoney
	$barra_superior/Nv_divida.max_value = Global.maxDebt
	
	$barra_superior/HBoxContainer/Value.text = str("%.2f"%(Global.money))
	$aba_din/GridContainer/HBoxContainer/NoRS.text = str("%.2f"%(Global.money))
	$aba_ene/GridContainer/HBoxContainer/NoEN.text = str(Global.energy)
	$aba_fel/GridContainer/HBoxContainer/NoFEL.text = str(Global.hapiness)
	$aba_div/GridContainer/HBoxContainer/NoDIV.text = str("%.2f"%(Global.debt))
	
	if Input.is_action_just_released("bt_din") && $aba_din.visible == false:
		aba_din()
	elif Input.is_action_just_released("bt_din") && $aba_din.visible == true:
		hide_all()

	if Input.is_action_just_released("bt_ene") && $aba_ene.visible == false:
		aba_ene()
	elif Input.is_action_just_released("bt_ene") && $aba_ene.visible == true:
		hide_all()

	if Input.is_action_just_released("bt_fel") && $aba_fel.visible == false:
		aba_fel()
	elif Input.is_action_just_released("bt_fel") && $aba_fel.visible == true:
		hide_all()

	if Input.is_action_just_released("bt_div") && $aba_div.visible == false:
		aba_div()
	elif Input.is_action_just_released("bt_div") && $aba_div.visible == true:
		hide_all()
		
