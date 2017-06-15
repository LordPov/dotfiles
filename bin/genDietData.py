#!/usr/bin/env python

import gdata.spreadsheet.service

def login(gd, email, password):
    gd.email = email
    gd.password = password
    gd.source = 'Rendos Diet Charter'
    gd.ProgrammaticLogin()

def sheet_id(gd, name):
    feed = gd.GetSpreadsheetsFeed()
    for entry in feed.entry:
        if entry.title.text == name:
            id_parts = entry.id.text.split('/')
            return id_parts[len(id_parts) - 1]

def worksheet_id(gd, sheet):
    feed = gd.GetWorksheetsFeed(sheet)
    id_parts = feed.entry[0].id.text.split('/')
    return id_parts[len(id_parts) - 1]

def sheet_data(gd, sheet, worksheet):
    data = {'date':[], 'desired':[], 'actual':[]}
    for i, entry in enumerate(gd.GetListFeed(sheet, worksheet).entry):
        data['date'].append(entry.custom['date'].text)
        if entry.custom['desired'].text:
            data['desired'].append(entry.custom['desired'].text)
        else:
            data['desired'].append('?0.0')
        if entry.custom['actual'].text:
            data['actual'].append(entry.custom['actual'].text)
        else:
            data['actual'].append('?0.0')
    return data

def save(dates, data):
    for i in range(len(dates)):
        print("%s %s %s" % (dates[i], data['Desired'][i], data['Actual'][i]))

def main():
    gd = gdata.spreadsheet.service.SpreadsheetsService()
    login(gd, 'lordpov@gmail.com', 'vmbjbvjelsvjfliq')
    sheet = sheet_id(gd, "Brendon's Diet Measurements")
    worksheet = worksheet_id(gd, sheet)
    data = sheet_data(gd, sheet, worksheet)
    save(data['date'], {'Desired':data['desired'], 'Actual':data['actual']})

if __name__ == '__main__':
    main()

