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
	}
]



var secondMonthCards = [
  {
	"month": 2,
	"cardText": "Gastei de mais! Assim não vou conseguir quitar minha dívida com meu tio!",
	"icon": "NEGÓCIO",
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
	"month": 2,
	"cardText": "Preciso fazer alguma coisa...",
	"icon": "TRANSPORTE",
	"choices": [
	  {
		"choiceText": "Vou começar a sair mais cedo de casa para pegar o ônibus que demora pra chegar, mas chegarei direto na faculdade.",
		"exists": true,
		"money": -350.0,
		"energy": -10,
		"happiness": -10,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Acho que vou de taxi só quando for muito necessário então, tipo em dias de chuva ou quando acordar atrasado.",
		"exists": true,
		"money": -400.0,
		"energy": -10,
		"happiness": 10,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Ah...Vou manter como estava no mês passado...",
		"exists": true,
		"money": -500.0,
		"energy": -5,
		"happiness": 0,
		"debt": 1000.0
	  }
	]
  },
  {
	"month": 2,
	"cardText": "Detesto pegar esse ônibus lotado... acho que essa decisão é melhor mesmo.",
	"icon": "NEGÓCIO",
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
	"month": 2,
	"cardText": "Também gastei de mais com comida na faculdade...",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Vou começar a trazer algo feito em casa para comer então.",
		"exists": true,
		"money": -300.0,
		"energy": -30,
		"happiness": -5,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Vou procurar um restaurante perto da faculdade.",
		"exists": true,
		"money": -650.0,
		"energy": 20,
		"happiness": 25,
		"debt": 1000.0
	  },
	  {
		"choiceText": "Comer? Pra que?",
		"exists": true,
		"money": 0.0,
		"energy": -20,
		"happiness": -20,
		"debt": 1000.0
	  }
	]
  },
  {
	"month": 2,
	"cardText": "Pronto, isso deve resolver.",
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
	"month": 2,
	"cardText": "Mês passado fui a festas todos os sábados...",
	"icon": "LAZER",
	"choices": [
	  {
		"choiceText": "Talvez se eu ficar em casa alguns fins de semana...",
		"exists": true,
		"money": -150.0,
		"energy": 30,
		"happiness": 0,
		"debt": 1000.0
	  },
	  {
		"choiceText": "A vida é muito curta... Quero é aproveitar!",
		"exists": true,
		"money": -250.0,
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
  },
  {
	"month": 2,
	"cardText": "Certo, agora sim ajustei minhas metas nesse mês",
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



var thirdMonthCards = [
  {
	"month": 3,
	"cardText": "Um novo mês, novas metas!",
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
	"month": 3,
	"cardText": "Preciso ir comprar comida no mercado...",
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
	"month": 3,
	"cardText": "Esse mês vou começar pelos alimentos. Já peguei o frango, a carne. Agora qual arroz eu devo escolher?.",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Pacote 1kg – R$10",
		"exists": true,
		"money": -400.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Pacote 5kg – R$35",
		"exists": true,
		"money": -250.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Pacote 500g – R$5",
		"exists": true,
		"money": -350.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 3,
	"cardText": "Passei pegando algumas frutas, verduras e laticínios, e esqueci de pegar o feijão.",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Pacote 1kg – R$9,50",
		"exists": true,
		"money": -300.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Pacote 5kg – R$35",
		"exists": true,
		"money": -250.0,
		"energy": 0,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Pacote 500g – R$5 ",
		"exists": true,
		"money": -350.0,
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
		"money": -200.0,
		"energy": 30,
		"happiness": 0,
		"debt": 0.0
	  },
	  {
		"choiceText": "Chocolate saboroso",
		"exists": true,
		"money": -150.0,
		"energy": 0,
		"happiness": 30,
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
	"cardText": "Certo, vamos definir minhas metas para o mês...",
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
		"choiceText": "Eu vou, acho que de taxi, para chegar rápido e cedo.",
		"exists": true,
		"money": -500.0,
		"energy": 10,
		"happiness": 10,
		"debt": 0.0
	  },
	  {
		"choiceText": "Melhor sair mais cedo, para pegar o onibus e o trem",
		"exists": true,
		"money": -350.0,
		"energy": -20,
		"happiness": -20,
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
	"cardText": "Acho que eu vou comprar um violão, sempre quis aprender um instrumento novo...",
	"icon": "NEGÓCIO",
	"choices": [
	  {
		"choiceText": "É, acho que um colega da turma está vendendo um violão velho, quem sabe ela não faz um desconto...",
		"exists": true,
		"money": -400.0,
		"energy": 10,
		"happiness": -30,
		"debt": 0.0
	  },
	  {
		"choiceText": "Não, eu gosto mesmo é de tudo novo, vou sair para compra.",
		"exists": true,
		"money": -500.0,
		"energy": -30,
		"happiness": 20,
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
		"choiceText": "Vou aproveitar e pedir alguns alimentos para alguns dias. Mas espero que eles não pensem que eu passo fome",
		"exists": true,
		"money": 0.0,
		"energy": 20,
		"happiness": -10,
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
		"money": -300.0,
		"energy": -20,
		"happiness": -20,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 4,
	"cardText": "Vai ser bom ter eles por aqui, estou com saudades!",
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
  },
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
	"cardText": "Então, o que eu devo comprar no mercado?",
	"icon": "COMIDA",
	"choices": [
	  {
		"choiceText": "Procurar produtos mais baratos",
		"exists": true,
		"money": -450.0,
		"energy": -20,
		"happiness": -30,
		"debt": 0.0
	  },
	  {
		"choiceText": "Continuar comprando os mesmos",
		"exists": true,
		"money": -600.0,
		"energy": -10,
		"happiness": -20,
		"debt": 0.0
	  },
	  {
		"choiceText": "Comprar somente o necessário",
		"exists": true,
		"money": -300.0,
		"energy": -30,
		"happiness": -30,
		"debt": 0.0
	  }
	]
  },
  {
	"month": 5,
	"cardText": "Inflação atrapalha bastante, mas não tem muito o que fazer, só aceitar.",
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
	"cardText": "Ihh...Preciso encontrar meus amigos no fim de semana, mas o lugar é longe e eu nunca fui lá...",
	"icon": "TRANSPORTE",
	"choices": [
	  {
		"choiceText": "Ir de taxi",
		"exists": true,
		"money": -450.0,
		"energy": -10,
		"happiness": 15,
		"debt": 0.0
	  },
	  {
		"choiceText": "Calma, eu consigo traçar um caminho pelo mapa! Apenas preciso pegar 3 ônibus e um trem!",
		"exists": true,
		"money": -350.0,
		"energy": -40,
		"happiness": -25,
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
		"choiceText": "Vou comprar uns livros e cursos para estudar sobre...",
		"exists": true,
		"money": -400.0,
		"energy": -10,
		"happiness": 20,
		"debt": 0.0
	  },
	  {
		"choiceText": "Acho que vou procurar alguns cursos pela internet...",
		"exists": true,
		"money": -300.0,
		"energy": 10,
		"happiness": -35,
		"debt": 0.0
	  },
	  {
		"choiceText": "Ouvi dizer que o Banco Brasileiro lançou um joguinho sobre isso. Vou testar!",
		"exists": true,
		"money": 0.0,
		"energy": 35,
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
		"money": 200.0,
		"energy": 10,
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
		"energy": -50,
		"happiness": -35,
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
		"choiceText": "Cadê aquele chocolate com guaraná?",
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
		"money": -400.0,
		"energy": 20,
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
		"money": -500.0,
		"energy": -30,
		"happiness": 30,
		"debt": 0.0
	  },
	  {
		"choiceText": "Acho que dá pra chamar eles aqui em casa, pedir pra cada um trazer algo, e eu preparo a  comida.",
		"exists": true,
		"money": 0.0,
		"energy": 25,
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
	
	cardsArray2 = read_json_file(secondMonthJson)
	cardsArray3 = read_json_file(thirdMonthJson)
	cardsArray4 = read_json_file(fourthMonthJson)
	cardsArray5 = read_json_file(fifthMonthJson)
	cardsArray6 = read_json_file(sixthMonthJson)



func read_json_file(file_path):
	var file = File.new()
	file.open(file_path, File.READ)
	if file.file_exists(file_path):
		file.open(file_path, file.READ)
		return parse_json(file.get_as_text())



func _process(delta):
#	money = money
#	energy = energy
#	happiness = happiness 
#	debt = debt
#
#	totalSpent = totalSpent
	pass
