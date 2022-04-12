import csv
import json
import pandas as pd

allCards = []

secondMonthCards = []
thirdMonthCards = []
fourthMonthCards = []
fifthMonthCards = []
sixthMonthCards = []

with open('gameHistory.csv', mode='r') as file:
  csvFile = csv.reader(file)

  for lines in csvFile:
    item = {
      'month': lines[0],
      'cardText': lines[1],
      'icon': lines[2],
      'choices': [
        {
          'exists': lines[3],
          'choiceText': lines[4],
          'money': lines[5],
          'energy': lines[6],
          'happiness': lines[7],
          'debt': lines[8]
        }, {
          'exists': lines[9],
          'choiceText': lines[10],
          'money': lines[11],
          'energy': lines[12],
          'happiness': lines[13],
          'debt': lines[14]
        }, {
          'exists': lines[15],
          'choiceText': lines[16],
          'money': lines[17],
          'energy': lines[18],
          'happiness': lines[19],
          'debt': lines[20]
        }
      ]
    }
    
    switch = item['month']
    if switch == '2':
      secondMonthCards.append(item)
      f = open('./gameData/secondMonthCards.json', 'w')
      f.write(json.dumps(secondMonthCards, indent=2))
    elif switch == '3':
      thirdMonthCards.append(item)
      f = open('./gameData/thirdMonthCards.json', 'w')
      f.write(json.dumps(thirdMonthCards, indent=2))
    elif switch == '4':
      fourthMonthCards.append(item)
      f = open('./gameData/fourthMonthCards.json', 'w')
      f.write(json.dumps(fourthMonthCards, indent=2))
    elif switch == '5':
      fifthMonthCards.append(item)
      f = open('./gameData/fifthMonthCards.json', 'w')
      f.write(json.dumps(fifthMonthCards, indent=2))
    elif switch == '6':
      sixthMonthCards.append(item)
      f = open('./gameData/sixthMonthCards.json', 'w')
      f.write(json.dumps(sixthMonthCards, indent=2)) 

    allCards.append(item)

  allCards.pop(0)

  f = open('gameHistory.json', 'w')
  f.write(json.dumps(allCards, indent=2))


# f = open('gameHistory.json', 'r')
# data = json.load(f)
# print(data)

print(allCards)