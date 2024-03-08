import numpy as np
import pandas as pd
import warnings
warnings.filterwarnings('ignore')#忽略其中存在的某些警告
data = pd.read_csv('./51', encoding='gbk')  # 读入数据
data['薪资'] = data['薪资'].astype('str')#将该列的数据转换为str，否则下列代码会报错
#由于之前的代码中替换万等脏数据会报错，所以只能在这里替换
for i, j in enumerate(data['薪资']):
    j = j.replace('万','').replace('千','').replace('元','').replace('/年','').replace('/天','').replace('以上','').replace('及以下','').replace('2以下','').replace('·13薪','').replace('·14薪','').replace('·15薪','').replace('·16薪','').replace('·17薪','').replace('·18薪','').replace('·20薪','')
    data['薪资'][i] = j
#将数据统一格式并取中间值
for i, j in enumerate(data['薪资']):
    j1 = float(j.split('-')[0])
    #以-为分割符取下标为0
    if j1>2:#由于所爬去的数据有千或万的单位，经过分析万的并不超过3，所以判断超过3的单位为千，不超过的单位为万
        j1= j1*1000
    else:
        j1 = j1*10000
    j2 = float(j.split('-')[-1])#以-为分割符取下标为1的
    if j2>2:
        j2= j2*1000
    else:
        j2 = j2*10000
    j3 = 1/2*(j1+j2)#取中间值
    data['薪资'][i] = j3
data['薪资'].fillna(data['薪资'].mean(),inplace=True)#以中间值填充其中空白的
for i, j in enumerate(data['薪资']):
    j=int(j)
    data['薪资'][i] = j
data.to_csv('33333_test.csv',encoding='utf-8')#将清洗后的数据存储
