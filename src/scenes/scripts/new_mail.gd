extends Control

func _ready():
	#Esconde o email assim que a cena inicia antes que a animação termine
	$TextureRect/TextureButton.hide()
	$email.hide()
	$TextureRect/Label.percent_visible = 0

func _process(delta):
	#inicia animação do texto e do botão de prosseguir
	if $TextureRect/Label.percent_visible == 1:
		$TextureRect/TextureButton.visible = true
		$mensagem.play("prosseguir")
		if $TextureRect/TextureButton.rect_scale == Vector2(1, 1):
			$mensagem.stop()
		
#Mostra o botão de abrir o email assim que a animação inicial termina
func _on_AnimationPlayer_animation_finished(new_mail):
	$email.show()
	$new_email.hide()
	$Seta/seta.play("seta")

#Esconde o botão de email assim que ele é pressionado
func _on_email_pressed():
	$sair_email.play("sair_email")

#Chama a mensagem do email assim que o botão sai da tela
func _on_sair_email_animation_started(sair_email):
	$mensagem.play("mensagem")
	$Seta/seta.play("RESET")

#Inicia a animação do texto assim que o email termina de aparecer
func _on_mensagem_animation_finished(mensagem):
	$mensagem.play("anim_text")

#Passa para próxima cena quando o botão "Prosseguir é pressionado 
func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/introducao.tscn")
