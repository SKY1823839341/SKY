import numpy as np
import pandas as pd
import warnings

#定义函数
def data_clean(data):
    # 统一岗位名称为数据分析师
    for i, j in enumerate(data['工作名称']):
        if '数据分析' in j:
            j = '数据分析师'
        data['工作名称'] = j
    # 对薪资这一列进行清洗，替换掉其中的千，万等字
    for i, j in enumerate(data['薪资']):
        j = j.replace('[', '').replace(']', '').replace("'", '')#去除其中存在的"["等脏数据
        j1 = j.split('·')[0]  # 对数据进行拆分，去掉后面的13薪等
        data['薪资'][i] = j1
    # 对公司名称这一列进行清洗
    for i,j in enumerate(data['公司名称']):
        j = j.replace('[','').replace(']','').replace("'",'')#去除其中存在的"["等脏数据
        data['公司名称'][i] = j
    #对工作地点这一列进行数据清洗
    for i,j in enumerate(data['工作地点']):
        j = j.replace('[','').replace(']','').replace("'",'')#去除其中存在的"["等脏数据
        data['工作地点'][i] = j
    #对学历这一列进行数据清洗
    for i,j in enumerate(data['学历']):
        j = j.replace('[','').replace(']','').replace("'",'')#去除其中存在的"["等脏数据
        data['学历'][i] = j
    data['学历'].value_counts()
    #对详情页链接这一列去掉[]
    for i,j in enumerate(data['详情页链接']):
        j = j.replace('[','').replace(']','').replace("'",'')#去除其中存在的"["等脏数据
        data['详情页链接'][i] = j
    return data
if __name__=='__main__':
    warnings.filterwarnings('ignore')#忽略其中存在的某些警告
    data = pd.read_csv('test.csv', encoding='gbk')  # 读入数据
    data = data_clean(data)
    data.to_csv('test_clean.csv',encoding='gbk')#将清洗后的数据存储
