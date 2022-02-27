extends TextureRect

var nv_dinheiro = 0.00
var nv_energia = 0
var nv_felicidade = 0
var nv_divida = 0

func _ready():
	$nv_dinheiro.value = nv_dinheiro
	$nv_energia.value = nv_energia
	$nv_felicidade.value = nv_felicidade
	$nv_divida.value = nv_divida
	
