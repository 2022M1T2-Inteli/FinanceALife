extends Control

func _ready(): print(Global.extrato)

func _on_start_pressed():
	get_tree().change_scene("res://scenes/new_mail.tscn")
#	get_tree().change_scene("res://scenes/GameOver.tscn")

func _on_sair_pressed():
	get_tree().quit()
