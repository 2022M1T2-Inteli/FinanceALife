import csv
import json
import pandas as pd

allCards = []

secondMonthCards = []
thirdMonthCards = []
fourthMonthCards = []
fifthMonthCards = []
sixthMonthCards = []

try:
  with open('gameHistory.csv', mode='r') as file:
    csvFile = csv.reader(file)

    # remove the first line
    next(csvFile)
    

    for lines in csvFile:
      item = {
        'month': int(lines[0]),
        'cardText': lines[1],
        'icon': lines[2],
        'choices': [
          {
            'choiceText': lines[3],
            'exists': lines[4],
            'money': float(lines[5]),
            'energy': int(lines[6]),
            'happiness': int(lines[7]),
            'debt': float(lines[8])
          }, {
            'choiceText': lines[9],
            'exists': lines[10],
            'money': float(lines[11]),
            'energy': int(lines[12]),
            'happiness': int(lines[13]),
            'debt': float(lines[14])
          }, {
            'choiceText': lines[15],
            'exists': lines[16],
            'money': float(lines[17]),
            'energy': int(lines[18]),
            'happiness': int(lines[19]),
            'debt': float(lines[20])
          }
        ]
      }

      if item['choices'][0]['exists'] == 'TRUE':
        item['choices'][0]['exists'] = True
      else:
        item['choices'][1]['exists'] = False
      
      if item['choices'][1]['exists'] == 'TRUE':
        item['choices'][1]['exists'] = True
      else:
        item['choices'][1]['exists'] = False
      
      if item['choices'][2]['exists'] == 'TRUE':
        item['choices'][2]['exists'] = True
      else:
        item['choices'][2]['exists'] = False
      
      switch = item['month']
      if switch == 2:
        secondMonthCards.append(item)
        f = open('./gameData/secondMonthCards.json', 'w')
        f.write(json.dumps(secondMonthCards, indent=2, ensure_ascii=False))
      elif switch == 3:
        thirdMonthCards.append(item)
        f = open('./gameData/thirdMonthCards.json', 'w')
        f.write(json.dumps(thirdMonthCards, indent=2, ensure_ascii=False))
      elif switch == 4:
        fourthMonthCards.append(item)
        f = open('./gameData/fourthMonthCards.json', 'w')
        f.write(json.dumps(fourthMonthCards, indent=2, ensure_ascii=False))
      elif switch == 5:
        fifthMonthCards.append(item)
        f = open('./gameData/fifthMonthCards.json', 'w')
        f.write(json.dumps(fifthMonthCards, indent=2, ensure_ascii=False))
      elif switch == 6:     
        sixthMonthCards.append(item)
        f = open('./gameData/sixthMonthCards.json', 'w')
        f.write(json.dumps(sixthMonthCards, indent=2, ensure_ascii=False)) 

      allCards.append(item)

    f = open('.\src\InvestALife1.2\IAL Game\assets\gameHistory.csv', 'w')
    f.write(json.dumps(allCards, indent=2, ensure_ascii=False))

  print("Wrote secondMonthCards.json...\nWrote thirdMonthCards.json...\nWrote fourthMonthCards.json...\nWrote fifthMonthCards.json...\nWrote sixthMonthCards.json...\nWrote gameHistory.json...\nDone, exiting.")
except:
  print("Error\nMaybe you didn't add the file to the assets/data folder?")