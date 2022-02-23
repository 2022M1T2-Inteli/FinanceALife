extends Control

func _process(delta: float) -> void:
	self.rect_size = OS.window_size
	
#	if Input.is_action_just_pressed("ui_up"):
#		$barra_inferior/AnimationPlayer.play("subir barra")
#
#	elif Input.is_action_just_pressed("ui_down"):
#		$barra_inferior/AnimationPlayer.play("descer barra")
	


func _ready() -> void:
	pass 

