extends Control

func _ready():
	$TextureRect/TextureButton.hide()
	$email.hide()
	$TextureRect/Label.percent_visible = 0

func _process(delta):
	if $TextureRect/Label.percent_visible == 1:
		$TextureRect/TextureButton.visible = true
		$mensagem.play("prosseguir")
		if $TextureRect/TextureButton.rect_scale == Vector2(1, 1):
			$mensagem.stop()
		
func _on_AnimationPlayer_animation_finished(new_mail):
	$email.show()
	$new_email.hide()
	$Seta/seta.play("seta")

func _on_email_pressed():
	$sair_email.play("sair_email")

func _on_sair_email_animation_started(sair_email):
	$mensagem.play("mensagem")
	$Seta/seta.play("RESET")
	
func _on_mensagem_animation_finished(mensagem):
	$mensagem.play("anim_text")

func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/introducao.tscn")
