extends Control

func _on_start_pressed():
	get_tree().change_scene("res://scenes/new_mail.tscn")

func _on_sair_pressed():
	get_tree().quit()
