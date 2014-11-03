#!/usr/bin/env python

import xlwt


wb = xlwt.Workbook()
ws = wb.add_sheet('colors')

for i in range(83):
    test = xlwt.easyxf('pattern: pattern solid;')
    test.pattern.pattern_fore_colour = i
    ws.write(i+2, 0, i)
    ws.write(i+2, 1, '', test)

wb.save('colors.xls')
