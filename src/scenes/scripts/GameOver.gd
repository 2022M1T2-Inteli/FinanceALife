extends Control

func _on_restart_pressed():
	get_tree().change_scene("res://scenes/UIdoGame.tscn")

func _on_sair_pressed():
	get_tree().quit()

