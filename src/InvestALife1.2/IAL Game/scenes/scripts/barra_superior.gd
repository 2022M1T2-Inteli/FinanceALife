extends TextureRect

var max_dinheiro = 2000
var dinheiro = 900
#var nv_dinheiro = dinheiro*max_dinheiro
var nv_energia = 0
var nv_felicidade = 0
var nv_divida = 0

func _ready():
	$nv_dinheiro.max_value = max_dinheiro
	$nv_dinheiro.value = dinheiro
	$nv_energia.value = nv_energia
	$nv_felicidade.value = nv_felicidade
	$nv_divida.value = nv_divida
	


