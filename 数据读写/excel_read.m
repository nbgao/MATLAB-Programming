data1 = xlsread('data.xls', 'Sheet1', 'A3:C5')

data2 = xlsread('data.xls','Sheet1', 'A1:B3')

data(isnan(data)) = 0