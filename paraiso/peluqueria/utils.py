import openpyxl
from openpyxl.styles import Font
from openpyxl import Workbook
from openpyxl.writer.excel import save_virtual_workbook

def ArmoExcel(cumple_mes):
    wb = openpyxl.Workbook()
    wb = Workbook(encoding='utf-8')
    wb.get_sheet_names()
    sheet = wb.active
    sheet.title = 'Cumpleaños'
    sheet['A1']='Apellido y Nombre'
    sheet['B1']='E-Mail'
    sheet['C1']='Teléfono'
    sheet['D1']='Cumpleaños'

    font_title = Font('name=Times New Roman', bold=True)

    sheet['A1'].font= font_title
    sheet['B1'].font= font_title
    sheet['C1'].font= font_title
    sheet['D1'].font= font_title

    sheet.column_dimensions['A'].width = 20
    sheet.column_dimensions['B'].width = 20
    sheet.column_dimensions['C'].width = 20
    sheet.column_dimensions['D'].width = 20

    sheet.freeze_panes = 'A2'
    i = 1
    for cumple in cumple_mes:
         i = i + 1
         sheet['A'+ str(i)].value = cumple.Apellido+", "+cumple.Nombre
         sheet['B'+ str(i)].value = cumple.email
         sheet['C'+ str(i)].value = cumple.Teléfono
         sheet['D'+ str(i)].value = cumple.Cumpleaños.strftime("%d-%m")

    #wb.save('cumple_mes.xlsx')
    return save_virtual_workbook(wb)
