extends Control

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

func _ready() -> void:
	hide_all()
	
func _process(delta: float) -> void:
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
