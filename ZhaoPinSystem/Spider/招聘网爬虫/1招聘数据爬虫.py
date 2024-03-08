# 导入数据请求模块
import requests
# 导入格式化输出模块
from pprint import pprint
# 导入csv模块
import csv
from time import sleep
import time

# 创建文件
f = open('job_kaifa.csv', mode='w', newline='', encoding='utf-8')
#  f 创建的文件对象, fieldnames 字段名
csv_writer = csv.DictWriter(f, fieldnames=[
    '职位',
    '公司',
    '薪资',
    '城市',
    '经验',
    '学历',
    '公司性质',
    '公司规模',
    '公司领域',
    '职位详情页',
    '公司详情页',
])
# 写入表头
csv_writer.writeheader()


def spider1(page):
    """
    1. 发送请求, 模拟浏览器对url地址发送请求
    保存Excel:
        pandas openpyxl
    """
    # url地址
    url1 = 'https://cupidjob.51job.com/open/noauth/search-pc?api_key=51job&timestamp=1684153847&keyword=开发&searchType=2&function=&industry=&jobArea=010000%2C020000%2C030200%2C040000%2C090200&jobArea2=&landmark=&metro=&salary=&workYear=&degree=&companyType=&companySize=&jobType=&issueDate=&sortType=0&pageNum='
    url2 = '&requestId=&pageSize=20&source=1&accountId=&pageCode=sou%7Csou%7Csoulb'
    url = url1 + str(page) + url2
    # 伪装模拟浏览器
    '''headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.0.0 Safari/537.36'
    }'''
    headers = {
        'Cookie': 'guid=68be8c8887c7a038d4002e1bcd0031c3; nsearch=jobarea%3D%26%7C%26ord_field%3D%26%7C%26recentSearch0%3D%26%7C%26recentSearch1%3D%26%7C%26recentSearch2%3D%26%7C%26recentSearch3%3D%26%7C%26recentSearch4%3D%26%7C%26collapse_expansion%3D; slife=lowbrowser%3Dnot%26%7C%26; search=jobarea%7E%60010000%2C020000%2C030200%2C040000%2C090200%7C%21ord_field%7E%600%7C%21recentSearch0%7E%60010000%2C020000%2C030200%2C040000%2C090200%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21recentSearch1%7E%60080400%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21recentSearch2%7E%60270600%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21recentSearch3%7E%60190200%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21recentSearch4%7E%60140200%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21collapse_expansion%7E%601%7C%21; uid=wKhJQmQv9ooWMAvrCpOXAg==; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%2268be8c8887c7a038d4002e1bcd0031c3%22%2C%22first_id%22%3A%22181ed478990936-0652622f9e3c428-c4c7526-3686400-181ed47899140a%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_referrer%22%3A%22%22%7D%2C%22identities%22%3A%22eyIkaWRlbnRpdHlfY29va2llX2lkIjoiMTgxZWQ0Nzg5OTA5MzYtMDY1MjYyMmY5ZTNjNDI4LWM0Yzc1MjYtMzY4NjQwMC0xODFlZDQ3ODk5MTQwYSIsIiRpZGVudGl0eV9sb2dpbl9pZCI6IjY4YmU4Yzg4ODdjN2EwMzhkNDAwMmUxYmNkMDAzMWMzIn0%3D%22%2C%22history_login_id%22%3A%7B%22name%22%3A%22%24identity_login_id%22%2C%22value%22%3A%2268be8c8887c7a038d4002e1bcd0031c3%22%7D%2C%22%24device_id%22%3A%22181ed478990936-0652622f9e3c428-c4c7526-3686400-181ed47899140a%22%7D; Hm_lvt_1370a11171bd6f2d9b1fe98951541941=1682167626,1683812919,1684129948,1684155364; acw_tc=ac11000116842149507745317e00d97b6d40888bb480d659dae6f4fb74d1c4; JSESSIONID=9EFBB511F6CD945A5EE0022187FE06D2; ssxmod_itna=Yqjxc7itKGqDqYK0QDXDnDEi4utGFdFQqoWKaiDlxOixA5D8D6DQeGTWuwtWqtqQBGxGkWojbi4t7O24TYe17QexaQMOh4GLDmKDymQG4x3D4SKGwD0eG+DD4DWDmnHDnxAQDjxGpycuTXBDi3Dbg=Df4DmDGAybqDgDYQDGdIUD7QDIM=4m0hy7jdY2qTMmGrYGB=DjTTD/RGHxpb7pcxV7eaadWpnDB6sxBQZ0MXX0eDHmq0Z3n5dWOD6SODKthPoGGhezb44nfpKWBM0TY35CDPqKdwzC5DA7v+yPD===; ssxmod_itna2=Yqjxc7itKGqDqYK0QDXDnDEi4utGFdFQqoWKbD6p4p0D05hP03tu609quqXilublR9N4/D3mBjCYN8q0=5y2WRjA3hePeNqlCY2g=55Vx9I6myIOj3=44VaK4gOFAqxFCzucqO/O2AuDSe8vsKA5oYSEkmiY89OQ4D4KY63IOf3foyOuQXOitunvU7CwHbBuA/YYzjq+UImX7XgcWOBIHKGhWT7veKkD80cGzGAmStlPo+krbLkEHz4R10i888Et09D80jiuQ5mkqZoa8DkDpbYPDKkQDFqD2CiD',
        # 'Referer': 'https://we.51job.com/',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36',
    }
    # 发送请求

    response = requests.get(url=url, headers=headers)
    # <Response [200]> 响应对象, 表示请求成功
    print(response)
    """
    2. 获取数据, 获取服务器返回响应数据
        response.text 获取响应文本数据, 返回字符串数据类型
        response.json() 获取响应字典数据, 返回字典数据类型

    公开课讲解的内容, 以简单基础为主, 数据库 JS逆向 反爬 系统课程里面是有的

    3. 解析数据, 提取我们想要的数据内容
        键值对取值: 根据冒号左边的内容[键], 提取冒号右边的内容[值]

    dict = {
        '键A': '值A',
        '键B': '值B',
        '键C': {
        '键C-1': '值C-1'    
        }
    }
    dict['键C']['键C-1'] --> 一层一层往下提取

    """
    items = response.json()['resultbody']['job']['items']
    for index in items:
        # 把数据保存到字典里面
        dit = {
            '职位': index['jobName'],
            '公司': index['fullCompanyName'],
            '薪资': index['provideSalaryString'],
            '城市': index['jobAreaString'],
            '经验': index['workYearString'],
            '学历': index['degreeString'],
            '公司性质': index['companyTypeString'],
            '公司规模': index['companySizeString'],
            '公司领域': index['industryType2Str'],
            '职位详情页': index['jobHref'],
            '公司详情页': index['companyHref'],
        }
        # 写入数据
        csv_writer.writerow(dit)
        print(dit)


def spider(a, b):
    for i in range(a, b, 1):
        spider1(i)
        time.sleep(0.3)  # 休息间隔，避免爬取海量数据时被误判为攻击，IP遭到封禁


import threading

if __name__ == '__main__':
    '''
    for i in range(1,3,1):
        spider(i)'''
    ''''''
    for i in range(1, 5000, 40):
        t1 = threading.Thread(target=spider, args=(i + 0,i + 10))  # 多开几个线程
        t2 = threading.Thread(target=spider, args=(i + 10,i + 20))
        t3 = threading.Thread(target=spider, args=(i + 20,i + 30))
        t4 = threading.Thread(target=spider, args=(i + 30,i + 40))
        t1.start()
        t2.start()
        t3.start()
        t4.start()
