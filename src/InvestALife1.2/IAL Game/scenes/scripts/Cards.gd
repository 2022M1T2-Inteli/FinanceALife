extends Node

var numEsc = 0

var money = 0.00
var energy = 100
var happiness = 100 
var debt = 0.00

var totalSpent = 0.00

var maxMoney := 1000.00
var maxDebt := 1000.00


const socialIcon = "res://assets/sprites/imgs_cards/img_card_exemplo1.png"
const graphIcon = "res://assets/sprites/imgs_cards/img_card_exemplo2.png"
const walletIcon = "res://assets/sprites/imgs_cards/img_card_exemplo3.png"

# Pre load das cores de fundo de cada card
var transportBackground = preload("res://assets/sprites/fundos_cards/fundo_card2.png")
var funBackground = preload("res://assets/sprites/fundos_cards/fundo_card4.png")
var foodBackground = preload("res://assets/sprites/fundos_cards/fundo_card8.png")
var fallbackBackground = preload("res://assets/sprites/fundos_cards/fundo_card5.png")



var secondMonthJson = "res://assets/gameData/secondMonthCards.json"
var thirdMonthJson = "res://assets/gameData/thirdMonthCards.json"
var fourthMonthJson = "res://assets/gameData/fourthMonthCards.json"
var fifthMonthJson = "res://assets/gameData/fifthMonthCards.json"
var sixthMonthJson = "res://assets/gameData/fourthMonthCards.json"



var extrato = "Você gastou R$" + str(totalSpent) + "!\nVocê tem R$"+ str(money) + " de dinheiro.\nVocê tem " + str(energy) + " de energia.\nVocê tem " + str(happiness) + " de felicidade.\nVocê tem R$" + str(debt) + " de dívida.\nVocê tem R$" + str(money)



var firstMonthIntroCards = [
	{
		"cardText": "Parabéns! Você foi aprovado na faculdade! As aulas começam esse mês",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Poxa, muito legal isso. Mas a faculdade é em outra cidade. Vou falar com meus pais.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText":
		"Filho, seu tio disse que pode emprestar o dinheiro para a sua mudança, mas ele disse que vai precisar que você o pague até o fim do ano.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText":
		"Nesse período vamos te dar um pouco de dinheiro por mês, para você se manter lá. Cuidado com o que você gasta.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	# One choice cards && First month cards
	{
		"cardText": "Pra chegar na faculdade...deixa eu abrir o mapa.",
		"icon": socialIcon, 
		"choices": [
			{"exists": false},
			{
				"choiceText": "Chamar uber",
				"money": -500,
				"energy": -50,
				"happiness": -40,
				"debt": 0,
				"exists": true
			},
			{"exists": false}
		]
	},
	{
		"cardText": "Por que esses lugares são tão caros?",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Agora vamos ver quanto eu gastei nesse mês.",
		"icon": graphIcon, 
		"choices":
		[
			{"exists": false},
			{
				"choiceText": str(extrato),
				"money": -50,
				"energy": -10,
				"happiness": +15,
				"debt": 0,
				"exists": true
			},
			{"exists": false}
		]
	}
]



var secondMonthCards = [
  {
	"month": 2,
	"cardText": "Preciso fazer alguma coisa...",
	"icon": "TRANSPORTE",
	"choices": [
	  {
		"choiceText": "Vou começar a sair mais cedo de casa pra pegar o ônibus que demora pra passar, mas aí  chego direto na faculdade.",
		"exists": true,
		"money": -90.0,
		"energy": -10,
		"happiness": -10,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Acho que vou de taxi só quando for muito necessário então, tipo em dias de chuva ou quando acordar atrasado.",
		"exists": true,
		"money": -100.0,
		"energy": -10,
		"happiness": 10,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Ah...Vou manter como estava no mês passado...",
		"exists": true,
		"money": -210.0,
		"energy": -5,
		"happiness": 0,
		"debt": 1000.0
	  }
	]
  },
  {
	"month": 2,
	"cardText": "Também gastei de mais com comida na faculdade...",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Vou começar a trazer algo feito em casa pra comer então.",
		"exists": true,
		"money": -300.0,
		"energy": -30,
		"happiness": -5,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Vou procurar um restaurante perto da faculdade.",
		"exists": true,
		"money": -630.0,
		"energy": 10,
		"happiness": 5,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Comer? Pra que?",
		"exists": true,
		"money": -300.0,
		"energy": -20,
		"happiness": -20,
		"debt": 1000.0
	  }
	]
  },
  {
	"month": 2,
	"cardText": "Mês passado fui a festas todos os sábados...",
	"icon": "LAZER",
	"choices": [
	  {
		"choiceText": "Talvez se eu ficar em casa alguns fins de semana...",
		"exists": true,
		"money": -100.0,
		"energy": 20,
		"happiness": 0,
		"debt": 1000.0
	  },
	  {
		"choiceText": "A vida é muito curta... Quero é aproveitar!",
		"exists": true,
		"money": -200.0,
		"energy": -20,
		"happiness": 10,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Acho vida social desnecessária.",
		"exists": true,
		"money": 0.0,
		"energy": 0,
		"happiness": -30,
		"debt": 1000.0
	  }
	]
  }
]



var thirdMonthCards = [
  {
	"month": 3,
	"cardText": "Esse mês vou começar a separar minhas economias por partes. Vou começar primeiramente pela comida, acho que R$300 é o suficiente. Já peguei o frango, a carne (R$50). Agora qual arroz eu devo escolher? Eu uso em média 5kg.",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Pacote 1kg – R$6",
		"exists": true,
		"money": -80.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Pacote 5kg – R$25,00",
		"exists": true,
		"money": -75.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Pacote 500g – R$3,50",
		"exists": true,
		"money": -85.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 3,
	"cardText": "Passei pegando algumas frutas, verduras e laticínios (R$40), e esqueci de pegar o feijão, eu uso em média o mesmo de arroz. (5kg)",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Pacote 1kg – R$8,99",
		"exists": true,
		"money": -85.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Pacote 5kg – R$58,99",
		"exists": true,
		"money": -100.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Pacote 500g – R$5,00",
		"exists": true,
		"money": -90.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 3,
	"cardText": "Hum...e um chocolatinho, por que não?",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Chocolate com guaraná",
		"exists": true,
		"money": -50.0,
		"energy": 30,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Chocolate saboroso",
		"exists": true,
		"money": -50.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Não comprar nenhum",
		"exists": true,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 3,
	"cardText": "Agora vou ver os gastos do mês...",
	"icon": "",
	"choices": [
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  }
]



var fourthMonthCards = [
  {
	"month": 4,
	"cardText": "Meus amigos na faculdade estão me chamando para um evento de negócios...",
	"icon": "NEGÓCIO",
	"choices": [
	  {
		"choiceText": "Eu vou, acho que vai ser importante, embora seja meio caro.",
		"exists": true,
		"money": -200.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Melhor não... Não tenho dinheiro pra isso.",
		"exists": true,
		"money": 0.0,
		"energy": 10,
		"happiness": 10,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 4,
	"cardText": "Acho que se eu vendesse meu violão, eu conseguiria mais dinheiro...",
	"icon": "NEGÓCIO",
	"choices": [
	  {
		"choiceText": "É, acho que um colega da minha turma está querendo comprar um.",
		"exists": true,
		"money": 300.0,
		"energy": 20,
		"happiness": -30,
		"debt": 0.0
	  },
	  {
		"choiceText": "Não, eu gosto muito do meu violão.",
		"exists": true,
		"money": 0.0,
		"energy": 0,
		"happiness": 10,
		"debt": 0.0
	  },
	  {
		"choiceText": "Sim, talvez essa tenha sido a melhor escolha no momento.",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 4,
	"cardText": "Meus pais virão me visitar esse mês...",
	"icon": "LAZER",
	"choices": [
	  {
		"choiceText": "Vou aproveitar pra pedir pra trazerem comida pra alguns dias.",
		"exists": true,
		"money": 0.0,
		"energy": 20,
		"happiness": 10,
		"debt": 0.0
	  },
	  {
		"choiceText": "Vou pedir pra trazerem aquele bolo de chocolate que eu gosto.",
		"exists": true,
		"money": 0.0,
		"energy": 10,
		"happiness": 20,
		"debt": 0.0
	  },
	  {
		"choiceText": "Acho que não vou pedir nada...",
		"exists": true,
		"money": -200.0,
		"energy": 20,
		"happiness": -20,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 4,
	"cardText": "Agora vamos ver quanto eu consegui economizar dessa vez...",
	"icon": "",
	"choices": [
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  }
]



var fifthMonthCards = [
  {
	"month": 5,
	"cardText": "Está chegando o dia de quitar a dívida, tenho mais dois meses...",
	"icon": "",
	"choices": [
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 5,
	"cardText": "E por conta da inflação, as coisas do mercado estão mais caras... Inflação faz o dinheiro perder o valor com o tempo,",
	"icon": "",
	"choices": [
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 5,
	"cardText": "já que faz as coisas ficarem mais caras... (Investimento é acumular dinheiro de forma que ele ao menos não perca valor) ",
	"icon": "",
	"choices": [
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "",
		"exists": false,
		"money": 0.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 5,
	"cardText": "Então, o que eu devo comprar no mercado?",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Procurar produtos mais baratos",
		"exists": true,
		"money": -250.0,
		"energy": -20,
		"happiness": -5,
		"debt": 0.0
	  },
	  {
		"choiceText": "Continuar comprando os mesmos",
		"exists": true,
		"money": -300.0,
		"energy": -20,
		"happiness": -5,
		"debt": 0.0
	  },
	  {
		"choiceText": "Comprar somente o necessário",
		"exists": true,
		"money": -200.0,
		"energy": -20,
		"happiness": -10,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 5,
	"cardText": "Ihh...Preciso encontrar meus amigos no fim de semana, mas o lugar é longe e eu nunca fui lá...",
	"icon": "TRANSPORTE",
	"choices": [
	  {
		"choiceText": "Taxi!!",
		"exists": true,
		"money": -350.0,
		"energy": -10,
		"happiness": 15,
		"debt": 0.0
	  },
	  {
		"choiceText": "Calma...Eu consigo traçar um caminho pelo mapa...Nossa, 3 ônibus...E um trem!",
		"exists": true,
		"money": -250.0,
		"energy": -40,
		"happiness": -5,
		"debt": 0.0
	  },
	  {
		"choiceText": "Quer saber...Acho que vou ficar em casa mesmo, infelizmente.",
		"exists": true,
		"money": 0.0,
		"energy": 20,
		"happiness": -30,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 5,
	"cardText": "Me falaram que educação financeira é importante para a vida...",
	"icon": "NEGÓCIOS",
	"choices": [
	  {
		"choiceText": "Vou comprar uns materiais e cursos para estudar sobre",
		"exists": true,
		"money": -400.0,
		"energy": -10,
		"happiness": 10,
		"debt": 0.0
	  },
	  {
		"choiceText": "Acho que só uns vídeos na internet devem ajudar",
		"exists": true,
		"money": -100.0,
		"energy": 10,
		"happiness": -35,
		"debt": 0.0
	  },
	  {
		"choiceText": "Ouvi dizer que o Banco Bancário lançou um joguinho sobre isso. Vou testar!",
		"exists": true,
		"money": 0.0,
		"energy": 5,
		"happiness": 35,
		"debt": 0.0
	  }
	]
  }
]



var sixthMonthCards = [
  {
	"month": 6,
	"cardText": "No final do mês eu preciso quitar a minha dívida!",
	"icon": "NEGÓCIOS",
	"choices": [
	  {
		"choiceText": "Vou ter que vender meu vídeo game...",
		"exists": true,
		"money": 300.0,
		"energy": -10,
		"happiness": -30,
		"debt": 0.0
	  },
	  {
		"choiceText": "Acho que falta pouco, eu tenho o suficiente para pagar",
		"exists": true,
		"money": 100.0,
		"energy": -30,
		"happiness": -10,
		"debt": 0.0
	  },
	  {
		"choiceText": "Ficar sem comer? Acho que dessa vez não tem como escapar",
		"exists": true,
		"money": 0.0,
		"energy": -20,
		"happiness": -20,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 6,
	"cardText": "Prova?? Verdade esqueci de estudar!",
	"icon": "NEGÓCIOS",
	"choices": [
	  {
		"choiceText": "Cadê aquele chocolate com guaraná??",
		"exists": true,
		"money": 0.0,
		"energy": 30,
		"happiness": 20,
		"debt": 0.0
	  },
	  {
		"choiceText": "Vou confiar no que eu aprendi...eu acho.",
		"exists": true,
		"money": 0.0,
		"energy": -30,
		"happiness": -20,
		"debt": 0.0
	  },
	  {
		"choiceText": "Chamando o taxi para reunir os amigos e estudar agora mesmo!",
		"exists": true,
		"money": -300.0,
		"energy": -20,
		"happiness": 10,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 6,
	"cardText": "Meus amigos me convidarem para uma festa neste fim de semana, antes das férias...",
	"icon": "LAZER",
	"choices": [
	  {
		"choiceText": "Acho melhor um passeio no parque? Pelo menos é de graça",
		"exists": true,
		"money": 0.0,
		"energy": -30,
		"happiness": 20,
		"debt": 0.0
	  },
	  {
		"choiceText": "Uma última festa, vai...Como nos velhos tempos.",
		"exists": true,
		"money": -100.0,
		"energy": -20,
		"happiness": 30,
		"debt": 0.0
	  },
	  {
		"choiceText": "Acho que dá pra chamar eles aqui em casa, pedir pra cada um trazer algo, e eu preparo a  comida.",
		"exists": true,
		"money": 0.0,
		"energy": 30,
		"happiness": 30,
		"debt": 0.0
	  }
	]
  }
]



# add all other arrays to the main array
#var cardsArray
var cardsArray1 = []
var cardsArray2 = []
var cardsArray3 = []
var cardsArray4 = []
var cardsArray5 = []
var cardsArray6 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, len(firstMonthIntroCards)):
		cardsArray1.append(firstMonthIntroCards[i])
	
	for i in range(0, len(secondMonthCards)):
		cardsArray2.append(secondMonthCards[i])
	
	for i in range(0, len(thirdMonthCards)):
		cardsArray3.append(thirdMonthCards[i])
	
	for i in range(0, len(fourthMonthCards)):
		cardsArray4.append(fourthMonthCards[i])
	
	for i in range(0, len(fifthMonthCards)):
		cardsArray5.append(fifthMonthCards[i])
	
	for i in range(0, len(sixthMonthCards)):
		cardsArray6.append(sixthMonthCards[i])
	
	# # Script intended to run the csvConverter python file, which turns data in a spreadsheets into a dictionary with all history of the game
	# OS.execute("python3", ["csvConverter.py"], true)

#	secondMonthCards = read_json_file(secondMonthJson)
#	thirdMonthCards = read_json_file(thirdMonthJson)
#	fourthMonthCards = read_json_file(fourthMonthJson)
#	fifthMonthCards = read_json_file(fifthMonthJson)
#	sixthMonthCards = read_json_file(sixthMonthJson)
	
	secondMonthCards = read_json_file(secondMonthJson)
	print(read_json_file(secondMonthJson))
	
#	print(read_json_file(secondMonthJson))
#	print(read_json_file(thirdMonthJson))
#	print(read_json_file(fourthMonthJson))
#	print(read_json_file(fifthMonthJson))
#	print(read_json_file(sixthMonthJson))
	
#	print("Couldn't read files.\nUsing pre-defined values")



func read_json_file(file_path):
	var file = File.new()
	file.open(file_path, File.READ)
#	var content_as_text = file.get_as_text()
#	var content_as_dictionary = parse_json(content_as_text)
#
#	return content_as_dictionary
	if file.file_exists(file_path):
		file.open(file_path, file.READ)
		return parse_json(file.get_as_text())



func _process(delta):
	money = money
	energy = energy
	happiness = happiness 
	debt = debt

	totalSpent = totalSpent
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
