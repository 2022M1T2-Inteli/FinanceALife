
extends AnimationPlayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func changeScene():
	# get_tree().change_scene("res://scenes/UIdoGame.tscn")
	var game = preload("res://scenes/UIdoGame.tscn").instance()
	get_tree().get_root().add_child(game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.connect("animation_finished", self, 'changeScene')

