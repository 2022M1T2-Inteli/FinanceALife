extends Control

var escolhas_txt = [
	"res://assets/text/text_escolhas/escolha1.tres",
	"res://assets/text/text_escolhas/escolha2.tres",
	"res://assets/text/text_escolhas/escolha3.tres"
]

func _ready():
	var escolha1 = escolhas_txt[0]
	var escolha2 = escolhas_txt[1]
	var escolha3 = escolhas_txt[2]
	$escolha1/Label.text = load_file(escolha1)
	$escolha2/Label2.text = load_file(escolha2)
	$escolha3/Label3.text = load_file(escolha3)
#	$escolha1/fechar.hide()
#	$escolha2/fechar.hide()
#	$escolha3/fechar.hide()


func load_file(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	return text
	
	

