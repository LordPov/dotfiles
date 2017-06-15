#!/usr/bin/python

import gdata.spreadsheet.service
import pygal

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
            data['desired'].append({'value': float(entry.custom['desired'].text), 'label': entry.custom['date'].text})
        else:
            data['desired'].append(None)
        if entry.custom['actual'].text:
            data['actual'].append({'value': float(entry.custom['actual'].text), 'label': entry.custom['date'].text})
        else:
            data['actual'].append(None)
    return data

def plot(dates, data):
    line_chart = pygal.Line(x_label_rotation=30, x_labels_major_every=7, show_minor_x_labels=False)
    line_chart.title = 'Rendo\'s Diet'
    line_chart.x_labels = dates
    line_chart.add('Desired', data['Desired'])
    line_chart.add('Actual',  data['Actual'])
    #line_chart.render_to_file('BrendonsDiet.svg')
    line_chart.render_to_png('BrendonsDiet.png')

def main():
    gd = gdata.spreadsheet.service.SpreadsheetsService()
    login(gd, 'lordpov@gmail.com', 'vmbjbvjelsvjfliq')
    sheet = sheet_id(gd, "Brendon's Diet Measurements")
    worksheet = worksheet_id(gd, sheet)
    data = sheet_data(gd, sheet, worksheet)
    plot(data['date'], {'Desired':data['desired'], 'Actual':data['actual']})

if __name__ == '__main__':
    main()

