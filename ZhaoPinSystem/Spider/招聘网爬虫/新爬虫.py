"""
[课程内容]: Python采集招聘网站数据

[授课老师]: 青灯教育-自游老师   [授课时间]: 20:05 可以点歌  可以问问题

[环境使用]:
    Python 3.8
    Pycharm

[模块使用]:
第三方模块 需要安装的
    requests  >>> pip install requests
    csv

win + R 输入cmd 输入安装命令 pip install 模块名 (如果你觉得安装速度比较慢, 你可以切换国内镜像源)
先听一下歌 等一下后面进来的同学,20:05正式开始讲课 [有什么喜欢听得歌曲 也可以在公屏发一下]
相对应的安装包/安装教程/激活码/使用教程/学习资料/工具插件 可以加邀课老师微信
---------------------------------------------------------------------------------------------------

爬虫思路: <公式>

一. 数据来源分析
    1. 明确需求:
        明确采集网站以及数据内容是什么?
        - https://we.51job.com/pc/search?jobArea=010000,020000,030200,040000,090200&keyword=python&searchType=2&sortType=0&metro=
        - 招聘基本数据内容
    2. 抓包分析 <通过浏览器自带开发者工具> 开发者工具 会1 不会0
        - 打开开发者工具: F12 / 右键点击检查选择network
        - 刷新网页: 让本网页的数据内容重新加载出来
        - 通过关键字搜索数据所对应数据包<url>
            关键字: 你要获取的数据内容
        https://cupidjob.51job.com/open/noauth/search-pc?api_key=51job&timestamp=1684152717&keyword=python&searchType=2&function=&industry=&jobArea=010000%2C020000%2C030200%2C040000%2C090200&jobArea2=&landmark=&metro=&salary=&workYear=&degree=&companyType=&companySize=&jobType=&issueDate=&sortType=0&pageNum=1&requestId=&pageSize=20&source=1&accountId=&pageCode=sou%7Csou%7Csoulb

二. 代码实现步骤
    1. 发送请求, 模拟浏览器对于 url地址 发送请求
    2. 获取数据, 获取服务器返回响应数据
    3. 解析数据, 提取我们想要的数据内容
    4. 保存数据, 保存表格文件


系统课程教授内容:
    核心编程基础 爬虫实战 数据分析 网站开发 人工智能 自动化办公 Vue框架

全部学完是 7个月左右的时间

就业 --> 1
    岗位: 爬虫工程师 / 算法工程师 / 数据分析师 / 开发工程师
    爬虫工程师: 核心编程基础 爬虫实战 <数据分析>
    数据分析师: 核心编程基础 <爬虫实战> 数据分析 算法
    开发工程师: 核心编程基础 网站开发 <Vue框架>
    算法工程师: 核心编程基础 数据分析 人工智能

学习内容越多, 掌握知识点就越多, 就业面也就越广

掌握 80%左右知识点:
    8-15K左右薪资待遇是OK的

接单 --> 2
    核心编程基础 爬虫实战 数据分析
    外包价格: 200-5000左右不等
    在校学生: 1000-3000左右收入

平均400左右的外包价格, 一个月接3个外包

兴趣 --> 3
    核心编程基础 一定要掌握
    后续就根据自己最感兴趣的学习即可


加婧琪老师微信: python1018
    - 可以免费获取学习路线图
        精心制作的: 教授知识点, 符合各大企业招聘需求

系统课程服务:
    - 直播授课 20:00-22:00 一周三节课 周135或者246
    - 课后资料 <录播/源码/笔记/文档>
    - 老师解答辅导, 多对一解答
        文字 语音 远程操作
    - 作业 / 考核
    - 电话通知听课, 班主任老师监督学习
    - 免费重修 <学会为止>
        一遍不OK, 学两遍
        两遍不OK, 学三遍
        三遍不OK, 不可能
    - 外包指导
        1. 提供外包接单平台 / 渠道
        2. 提供外包问题解答辅导
    - 就业指导
        1. 提供简历修改和制作
        2. 提供企业面试试题
        3. 提供企业面试技巧
        4. 企业工作相关问题也可以解答
    - 培训合同
    - 发票

从你入学开始, 到学完一系列都是有相关的服务措施

按时听课 --> 坚持学习
按时完成作业 --> 多敲多练
认真学习态度 --> 不懂多问
我可以保证你能学会掌握

对于VIP学员:
    1. 在学习的过程中, 遇到任何不懂的地方, 一定要多问老师, 不要觉得不好意思 <为了让你学的更好>
    2. 有任何事情, 都可以找任何一个老师反馈 <为让我们服务做的更好>

全套课程
    核心编程: 2260
    爬虫实战: 2980
    数据分析: 2180
    网站开发: 2980
    人工智能 <限时赠送> 2680
    自动化办公 <限时赠送> 1680
    vue框架 <限时赠送> 2180
总计学费: 16940

加婧琪老师微信: python1018
    预定 300 学费, 可以享受学费优惠
        - 全套高薪就业班: 减免学费 --> 8580
        - 外包兼职班: 核心编程 爬虫实战 数据分析 总计 7420 减免 --> 6380
        - 获得三个精品课程赠送
            人工智能 <限时赠送> 2680
            自动化办公 <限时赠送> 1680
            vue框架 <限时赠送> 2180
        - 申请先学后付, 先学习后支付
            全套高薪就业班:
                8580 / 12 = 713
                8580 / 18 = 476
            外包兼职班:
                6380 / 12 = 531
                6380 / 18 = 371
今天报名预定300元学费, 直接进班学习, 学完一个月之后
    6月15号, 支付第一个月学费: 476
    7月15号, 支付第二个月学费: 476
    -----------------学完爬虫之后可以接单-------------------
    8月15号, 支付第三个月学费: 476  --> 可以通过你自己接单赚钱, 赚回来
        476 相当于 1-2个外包 <学费就回来了>

接单:
    最短2个月左右, 学完爬虫是可以接单
就业:
    学完掌握相关内容,是可以就业工作

"""
# 导入数据请求模块 --> 第三方模块, 需要安装 pip install requests
import requests
# 导入格式化输出模块
from pprint import pprint
# 导入csv
import csv
import time

f = open('job_fenxi.csv', mode='w', encoding='utf-8', newline='')
csv_writer = csv.DictWriter(f, fieldnames=[
    '职位',
    '公司',
    '薪资',
    '城市',
    '区域',
    '经验',
    '学历',
    '公司性质',
    '公司规模',
    '公司领域',
    '公司详情页',
    '职位详情页',
])
csv_writer.writeheader()

"""
1. 发送请求, 模拟浏览器对于 url地址 发送请求 <代码基本上都可以直接复制>
    - 模拟浏览器: headers 请求头
        作用: 防止被反爬
    - url地址
    - 发送请求 <请求方式>
"""


# 模拟浏览器 --> 字典数据类型, 要构建完整键值对
def spider1(page):
    headers = {
        'Cookie': 'guid=68be8c8887c7a038d4002e1bcd0031c3; nsearch=jobarea%3D%26%7C%26ord_field%3D%26%7C%26recentSearch0%3D%26%7C%26recentSearch1%3D%26%7C%26recentSearch2%3D%26%7C%26recentSearch3%3D%26%7C%26recentSearch4%3D%26%7C%26collapse_expansion%3D; slife=lowbrowser%3Dnot%26%7C%26; search=jobarea%7E%60010000%2C020000%2C030200%2C040000%2C090200%7C%21ord_field%7E%600%7C%21recentSearch0%7E%60010000%2C020000%2C030200%2C040000%2C090200%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21recentSearch1%7E%60080400%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21recentSearch2%7E%60270600%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21recentSearch3%7E%60190200%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21recentSearch4%7E%60140200%A1%FB%A1%FA000000%A1%FB%A1%FA0000%A1%FB%A1%FA00%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA99%A1%FB%A1%FA9%A1%FB%A1%FA99%A1%FB%A1%FA%A1%FB%A1%FA0%A1%FB%A1%FApython%A1%FB%A1%FA2%A1%FB%A1%FA1%7C%21collapse_expansion%7E%601%7C%21; uid=wKhJQmQv9ooWMAvrCpOXAg==; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%2268be8c8887c7a038d4002e1bcd0031c3%22%2C%22first_id%22%3A%22181ed478990936-0652622f9e3c428-c4c7526-3686400-181ed47899140a%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_referrer%22%3A%22%22%7D%2C%22identities%22%3A%22eyIkaWRlbnRpdHlfY29va2llX2lkIjoiMTgxZWQ0Nzg5OTA5MzYtMDY1MjYyMmY5ZTNjNDI4LWM0Yzc1MjYtMzY4NjQwMC0xODFlZDQ3ODk5MTQwYSIsIiRpZGVudGl0eV9sb2dpbl9pZCI6IjY4YmU4Yzg4ODdjN2EwMzhkNDAwMmUxYmNkMDAzMWMzIn0%3D%22%2C%22history_login_id%22%3A%7B%22name%22%3A%22%24identity_login_id%22%2C%22value%22%3A%2268be8c8887c7a038d4002e1bcd0031c3%22%7D%2C%22%24device_id%22%3A%22181ed478990936-0652622f9e3c428-c4c7526-3686400-181ed47899140a%22%7D; Hm_lvt_1370a11171bd6f2d9b1fe98951541941=1682167626,1683812919,1684129948,1684155364; acw_tc=ac11000116842149507745317e00d97b6d40888bb480d659dae6f4fb74d1c4; JSESSIONID=9EFBB511F6CD945A5EE0022187FE06D2; ssxmod_itna=Yqjxc7itKGqDqYK0QDXDnDEi4utGFdFQqoWKaiDlxOixA5D8D6DQeGTWuwtWqtqQBGxGkWojbi4t7O24TYe17QexaQMOh4GLDmKDymQG4x3D4SKGwD0eG+DD4DWDmnHDnxAQDjxGpycuTXBDi3Dbg=Df4DmDGAybqDgDYQDGdIUD7QDIM=4m0hy7jdY2qTMmGrYGB=DjTTD/RGHxpb7pcxV7eaadWpnDB6sxBQZ0MXX0eDHmq0Z3n5dWOD6SODKthPoGGhezb44nfpKWBM0TY35CDPqKdwzC5DA7v+yPD===; ssxmod_itna2=Yqjxc7itKGqDqYK0QDXDnDEi4utGFdFQqoWKbD6p4p0D05hP03tu609quqXilublR9N4/D3mBjCYN8q0=5y2WRjA3hePeNqlCY2g=55Vx9I6myIOj3=44VaK4gOFAqxFCzucqO/O2AuDSe8vsKA5oYSEkmiY89OQ4D4KY63IOf3foyOuQXOitunvU7CwHbBuA/YYzjq+UImX7XgcWOBIHKGhWT7veKkD80cGzGAmStlPo+krbLkEHz4R10i888Et09D80jiuQ5mkqZoa8DkDpbYPDKkQDFqD2CiD',
        # 'Referer': 'https://we.51job.com/',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36',
    }

    url = 'https://cupidjob.51job.com/open/noauth/search-pc'

    data = {
        'api_key': '51job',
        'timestamp': '1684153847',
        'keyword': 'python',
        'searchType': '2',
        'function': '',
        'industry': '',
        'jobArea': '010000,020000,030200,040000,090200',
        'jobArea2': '',
        'landmark': '',
        'metro': '',
        'salary': '',
        'workYear': '',
        'degree': '',
        'companyType': '',
        'companySize': '',
        'jobType': '',
        'issueDate': '',
        'sortType': '0',
        'pageNum': '1',
        'requestId': 'a0f6a9ec9617d2e3c1ab3478f21c4a3f',
        'pageSize': '20',
        'source': '1',
        'accountId': '',
        'pageCode': 'sou|sou|soulb',
    }
    # 发送请求
    response = requests.get(url=url, params=data, headers=headers)
    """
    # <Response [200]> 响应对象, 200状态码: 表示请求成功

    2. 获取数据, 获取服务器返回响应数据
    response.json() --> 获取响应json字典数据

    报错信息: requests.exceptions.JSONDecodeError: Expecting value: line 1 column 1 (char 0)
    因为你获取的数据, 不是完整json数据格式
    请求之后没有得到我们想要的数据内容 --> 被反爬了, 得到的数据不是我们想要的
    就是因为你请求头伪装的不够 --> 请求头参数加上
    
    3. 解析数据, 提取我们想要的数据内容
    字典数据类型 --> 通过键值对取值提取数据内容
    
    
    csv_writer.writerow(response.json())"""
    print(response.json())



def spider(a, b):
    for i in range(a, b, 1):
        spider1(i)


import threading

if __name__ == '__main__':
    '''
    for i in range(1,3,1):
        spider(i)'''
    '''
    for i in range(1, 1000, 40):
        t1 = threading.Thread(target=spider, args=(i + 0,i + 10))  # 多开几个线程
        t2 = threading.Thread(target=spider, args=(i + 10,i + 20))
        t3 = threading.Thread(target=spider, args=(i + 20,i + 30))
        t4 = threading.Thread(target=spider, args=(i + 30,i + 40))
        t1.start()
        t2.start()
        t3.start()
        t4.start()'''

spider1(1)