extends Node

var numEsc = 0

var money = 0.00
var energy = 100
var hapiness = 100 
var debt = 0.00

var totalSpent = 0.00

var maxMoney := 2000.00
var maxMoney := 1000.00
var maxDebt := 1000.00


const socialIcon = "res://assets/sprites/imgs_cards/img_card_exemplo1.png"
const graphIcon = "res://assets/sprites/imgs_cards/img_card_exemplo2.png"
const walletIcon = "res://assets/sprites/imgs_cards/img_card_exemplo3.png"

var extrato = "Você gastou R$" + str(totalSpent) + "!\nVocê tem R$"+ str(money) + " de dinheiro.\nVocê tem " + str(energy) + " de energia.\nVocê tem " + str(hapiness) + " de felicidade.\nVocê tem R$" + str(debt) + " de dívida.\nVocê tem R$" + str(money)

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
				"hapiness": -40,
				"debt": 0,
				"exists": true
			},
			{"exists": false}
		]
	},
#	{
#		"cardText": "Que demora...",
#		"icon": socialIcon, 
#		"choices": [
#			{"exists": false},
#			{
#				"choiceText": "Esperar Onibus que demora pra passar.",
#				"money": 0,
#				"energy": -5,
#				"hapiness": -5,
#				"debt": 0,
#				"exists": true
#			},
#			{"exists": false}
#		]
#	},
#	{
#		"cardText": "Esse ônibus não vem?",
#		"icon": socialIcon, 
#		"choices": [
#			{"exists": false},
#			{
#				"choiceText": "Esperar Onibus que demora pra passar.",
#				"money": 0,
#				"energy": -10,
#				"hapiness": -5,
#				"debt": 0,
#				"exists": true
#			},
#			{"exists": false}
#		]
#	},
#	{
#		"cardText": "Quer saber? Vou chamar um uber.",
#		"icon": socialIcon, "choices":
#		[
#			{"exists": false},
#			{
#				"choiceText": "Chamar uber",
#				"money": -150,
#				"energy": 0,
#				"hapiness": 0,
#				"debt": 0,
#				"exists": true
#			},
#			{"exists": false}
#		]
#	},
#	{
#		"cardText": "Assim eu chego mais rápido.",
#		"icon": socialIcon, 
#		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
#	},
#	{
#		"cardText": "Nossa, que fome. Preciso comer alguma coisa.",
#		"icon": socialIcon, 
#		"choices":
#		[
#			{"exists": false},
#			{
#				"choiceText": "Pão de queijo da faculdade",
#				"money": -600,
#				"energy": 0,
#				"hapiness": 0,
#				"debt": 0,
#				"exists": true
#			},
#			{"exists": false}
#		]
#	},
#	{
#		"cardText": "Preciso fazer amizade com o pessoal da faculdade.",
#		"icon": socialIcon, 
#		"choices":
#		[
#			{"exists": false},
#			{
#				"choiceText": "Ir para as festas da faculdade.",
#				"money": -250,
#				"energy": -10,
#				"hapiness": +15,
#				"debt": 0,
#				"exists": true
#			},
#			{"exists": false}
#		]
#	},
	{
		"cardText": "Por que esses lugares são tão caros?",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Agora vamos ver quanto eu gastei nesse mês.",
		"icon": socialIcon, 
		"choices":
		[
			{"exists": false},
			{
				"choiceText": str(extrato),
				"money": -50,
				"energy": -10,
				"hapiness": +15,
				"debt": 0,
				"exists": true
			},
			{"exists": false}
		]
	}
]

var secondMonthCards = [
	# Entry
	{
		"cardText": "Gastei de mais! Assim não vou conseguir quitar minha dívida com meu tio!",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{  # Card 1
		"cardText": "Preciso fazer alguma coisa...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText":
				"Vou começar a sair mais cedo de casa para pegar o ônibus que demora pra chegar, mas chegarei direto na faculdade.",
				"money": -90,
				"energy": -10,
				"hapiness": -10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Acho que vou de taxi só quando for muito necessário, como em dias de chuva ou se acordar atrasado.",
				"money": -100,
				"energy": -10,
				"hapiness": 10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Ah... vou manter como estava no mês passado...",
				"money": -210,
				"energy": -5,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Detesto pegar esse ônibus lotado... acho que essa decisão é melhor mesmo.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{  # Card 2
		"cardText": "Também gastei de mais com comida na faculdade...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Vou começar a trazer algo feito em casa pra comer então.",
				"money": -300,
				"energy": -30,
				"hapiness": -5,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Vou procurar um restaurante perto da faculdade.",
				"money": -630,
				"energy": +10,
				"hapiness": +5,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Comer? Pra que?",
				"money": 0,
				"energy": -20,
				"hapiness": -20,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Pronto, isso deve resolver.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{  # Card 3
		"cardText": "Mês passado fui a festas todos os sábados...",
		"icon": socialIcon, "choices":
		[
			{
				"choiceText": "Talvez se eu ficar em casa alguns fins de semana...",
				"money": -100,  # ???
				"energy": 20,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "A vida é muito curta... Quero é aproveitar!",
				"money": -200,
				"energy": -20,
				"hapiness": +10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Acho vida social desnecessária.",
				"money": 0,
				"energy": 0,
				"hapiness": -30,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Certo, agora sim ajustei minhas metas nesse mês!",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
]

# Shown in case the choice of Second month card is the third one - 2.3
var fallbackTwoThree = {
	"cardText": "Certo, agora sim ajustei minhas metas nesse mês!",
	"icon": socialIcon, 
	"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
}

var thirdMonthCards = [
	# Entry
	{
		"cardText": "Um novo mês, novas metas!",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Preciso ir comprar comida no mercado...",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Qual arroz eu devo escolher?",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Pacote de 1kg - R$5,80",
				"money": -80,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Pacote de 5kg - R$25,00",
				"money": -75,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Pacote de 500gr - R$3,50",
				"money": -75,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Agora o feijão...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Pacote de 1kg - R$9,50",
				"money": -85,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Pacote de 5kg - R$59,00",
				"money": -100,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Pacote de 500gr - R$5,00",
				"money": -90,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Hum... e um chocolatinho, por que não?",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Chocolate com guaraná",
				"money": -50,
				"energy": 20,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Chocolate saboroso",
				"money": -100,
				"energy": 0,
				"hapiness": 30,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Não comprar nenhum",
				"money": 0,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Agora vou checar os gastos do mês...",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
]

var fourthMonthCards = [
	# Entry
	{
		"cardText": "Certo, vamos definir minhas metas para o mês...",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Meus amigos na faculdade estão me chamando para um evento de negócios...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Eu vou, acho que vai ser importante, embora seja meio caro.",
				"money": -200,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true
			},
			{"choiceText": "Melhor não... não tenho dinheiro pra isso.",
				"money": -50,
				"energy": 0,
				"hapiness": 0,
				"debt": 0,
				"exists": true},
			{"exists": false}
		]
	},
	{
		"cardText": "Acho que se eu vendesse o meu violão eu conseguiria mais dinheiro...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "É, acho que um colega da turma está qurendo comprar um.",
				"money": 300,
				"energy": 20,
				"hapiness": 30,
				"debt": 0,
				"exists": true
			},
			{"choiceText": "Não, eu gosto muito do meu violão.",
				"money": -50,
				"energy": 0,
				"hapiness": 10,
				"debt": 0,
				"exists": true},
			{"exists": false}
		]
	},
	{
		"cardText": "Acho que se eu vendesse o meu violão eu conseguiria mais dinheiro...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "É, acho que um colega da turma está qurendo comprar um.",
				"money": 300,
				"energy": 20,
				"hapiness": 30,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Não, eu gosto muito do meu violão.",
				"money": -50,
				"energy": 0,
				"hapiness": 10,
				"debt": 0,
				"exists": true
				},
			{"exists": false}
		]
	},
	{
		"cardText": "Meus pais virão me visitar esse mês...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Vou aproveitar pra pedir pra trazerem comida pra alguns dias.",
				"money": 0,
				"energy": 20,
				"hapiness": 10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Vou pedir pra trazerem aquele bolo de chocolate que eu gosto.",
				"money": 0,
				"energy": 10,
				"hapiness": 20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Acho que não vou pedir nada...",
				"money": -200,
				"energy": 20,
				"hapiness": -20,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Vai ser bom ter eles por aqui, estou com saudades!",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Agora vamos ver quanto eu consegui economizar dessa vez...",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
]

# Shown in case the choice of Fourth month card is the second one - 4.2
var fallbackFourTwo = {
	"cardText": "Decisões assim são difíceis, mas essa é a vida.",
	"icon": socialIcon, 
	"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
}

var fifthMonthCards = [
	# Entry
	{
		"cardText":
		"Está chegando o dia de quitar a dívida... tenho apenas mais dois meses.\nE por conta da inflação as coisas do mercado estão ainda mais caras...\n\nInflação faz o dinheiro perder o valor com o tempo, já que as coisas ficam mais caras...\n(Investimento é acumular dinheiro de forma que ele ao menos não perca valor)",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText": "Então... agora o que devo comprar no mercado?",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Procurar produtos mais baratos",
				"money": -250,
				"energy": -20,
				"hapiness": -5,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Continuar comprando os mesmos produtos",
				"money": -300,
				"energy": -20,
				"hapiness": -5,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Comprar somente o necessário",
				"money": -200,
				"energy": -20,
				"hapiness": -10,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Inflação atrapalha bastante, mas não tem muito o que fazer, só aceitar.",
		"icon": socialIcon, 
		"choices": [{"exists": false}, {"exists": false}, {"exists": false}]
	},
	{
		"cardText":
		"Ihh... preciso encontrar meus amigos no fim de semana, mas o lugar é longe e eu nunca fui lá...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Ir de táxi",
				"money": -350,
				"energy": -10,
				"hapiness": 15,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Calma, eu consigo traçar um caminho pelo mapa! Nossa... 3 ônibus e um trem!",
				"money": -250,
				"energy": -40,
				"hapiness": -5,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Quer saber... acho que vou ficar em casa mesmo, infelizmente.",
				"money": 0,
				"energy": 20,
				"hapiness": -30,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Me falaram que educação financeira é importante para a vida...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Vou comprar uns materiais e cursos para estudar sobre",
				"money": -400,
				"energy": -10,
				"hapiness": 10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Acho que só uns vídeos na internet devem ajudar...",
				"money": -100,
				"energy": -10,
				"hapiness": -35,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Ouvir dizer que o Banco Bancário Brasileiro lançou um joguinho sobre isso. Vou testar!",
				"money": 0,
				"energy": 5,
				"hapiness": 35,
				"debt": 0,
				"exists": true
			}
		]
	},
]

var sixthMonthCards = [
	# Entry
	{
		"cardText": "No final desse mês eu preciso quitar a mnha dívida!",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Vou ter quer vender meu vídeo game...",
				"money": 300,
				"energy": 10,
				"hapiness": -30,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Acho que falta pouco, só esperar mesmo",
				"money": 100,
				"energy": -30,
				"hapiness": -10,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Ficar sem comer? Acho que dessa vez não dá pra escapar",
				"money": 0,
				"energy": -50,
				"hapiness": -35,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Prova?? Verdade! Esqueci de estudar.",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Cadê aquele chocolate com guaraná?",
				"money": 0,
				"energy": 30,
				"hapiness": 20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Vou confiar no que eu aprendi... eu acho",
				"money": 0,
				"energy": -30,
				"hapiness": -20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Chamar o táxi para reunir com os amigos e estudar agora mesmo",
				"money": -300,
				"energy": -20,
				"hapiness": 10,
				"debt": 0,
				"exists": true
			}
		]
	},
	{
		"cardText": "Meus amigos querem fazer algo no fim de semana, antes das férias...",
		"icon": socialIcon, 
		"choices":
		[
			{
				"choiceText": "Um passeio no parque? Pelo menos é de graça.",
				"money": 0,
				"energy": -30,
				"hapiness": 20,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText": "Uma última festa, vai... Como nos velhos tempos.",
				"money": -100,
				"energy": -30,
				"hapiness": 30,
				"debt": 0,
				"exists": true
			},
			{
				"choiceText":
				"Acho que dá pra chamar eles aqui em casa e cada um trazer algo e eu preparo a comida.",
				"money": 0,
				"energy": -25,
				"hapiness": 30,
				"debt": 0,
				"exists": true
			}
		]
	},
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

func _process(delta):
	money = money
	energy = energy
	hapiness = hapiness 
	debt = debt

	totalSpent = totalSpent
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
