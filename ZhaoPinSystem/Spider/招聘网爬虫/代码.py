from pymysql import *
from random import *
from datetime import *
import tkinter as tk
import tkinter.messagebox
from PIL import Image, ImageTk
from tkinter import ttk

# 定义变量
db_url = "pc-bp18rn0tqu85a1600-public.rwlb.rds.aliyuncs.com"
db_name = "polardb_mysql_6941vbh"
db_account = "lab_58778344"
db_psw = "cbe49581e347_#@Aa"
user = ""


class BaseDesk:
    def __init__(self, master):
        self.root = master
        self.root.config()
        self.root.title("毕业生管理系统")  # 标题
        self.root.geometry('800x450')  # 窗口默认大小
        self.root.resizable(False, False)  # 禁止水平和垂直调整大小
        Initface(self.root)  # 初始界面
        # Modify(self.root)
        # RegisterPage(self.root)
        # OperatePage(self.root)
        # StudentsInfo(self.root)
        # Emp(self.root)
        # Cert(self.root)
        # Acad(self.root)
        # Dele(self.root)


class Initface:
    def frames_destroy(self):  # 销毁框架（下同）
        self.bg_frame.destroy()
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()
        self.frame4.destroy()
        self.frame5.destroy()

    def __init__(self, master):
        self.master = master
        self.bg_frame = tk.Frame(self.master)
        self.frame1 = tk.Frame(self.master)  # 账号框架
        self.frame2 = tk.Frame(self.master)  # 密码框架
        self.frame3 = tk.Frame(self.master)  # 按钮框架
        self.frame4 = tk.Frame(self.master)  # 退出按钮框架
        self.frame5 = tk.Frame(self.master)  # 注册按钮框架
        #背景框架
        self.bg_frame.place(x=0, y=0)
        self.photo = ImageTk.PhotoImage(Image.open('img1.png'))
        self.image_l = tk.Label(self.bg_frame, image=self.photo).pack()
        # 账号框架
        self.frame1.place(x=80, y=120)
        tk.Label(self.frame1, font=("", "12"), text='账号:').grid(column=2, row=4)
        self.Account = tk.StringVar()
        self.entry_Account = tk.Entry(self.frame1, bd=3, textvariable=self.Account)
        self.entry_Account.grid(column=3, row=4)
        # 密码框架
        self.frame2.place(x=80, y=160)
        tk.Label(self.frame2, font=("", "12"), text='密码:').grid(column=2, row=5)
        self.inputPW = tk.StringVar()
        self.entry_inputPW = tk.Entry(self.frame2, bd=3, show='●', textvariable=self.inputPW)
        self.entry_inputPW.grid(column=3, row=5)
        # 登录按钮框架
        self.frame3.place(x=110, y=200)
        self.sign_up = tk.Button(self.frame3, bd=3, bg='LightBlue', cursor='hand2', font=("", "12"), text='登录->',
                                 width=20, command=self.operate_log)
        self.sign_up.grid()
        # 退出按钮框架
        self.frame4.place(x=110, y=250)
        self.go_quit = tk.Button(self.frame4, bd=3, bg='LightBlue', cursor='hand2', font=("", "12"), text='退出',
                                 width=20, command=self.quit_out)
        self.go_quit.grid()
        # 注册按钮框架
        self.frame5.place(x=290, y=135)
        self.go_register = tk.Button(self.frame5, bd=3, bg='LightBlue', cursor='hand2', font=("", "12"),
                                     text='修改密码',
                                     width=10, command=self.modify)
        self.go_register.grid()

    def modify(self):
        self.frames_destroy()
        Modify(self.master)

    def operate_log(self):
        global user  # 全局变量存储本次登录用户的id（其他类相同）
        me = BankSystem()
        log_account = self.entry_Account.get()
        log_pw = self.entry_inputPW.get()
        if log_account == '':  # 如果输入为空
            tk.messagebox.showerror(title='错误', message='请输入账号密码！')
        else:
            my_sql = "select Account,Password from User where Account=%s and Password=%s" % \
                     (log_account, log_pw)
            me.execute_sql(my_sql)
            if len(me.data) != 0:  # 验证数据库运行结果是否为空值(为空说明账号密码不在数据库)
                tk.messagebox.showinfo(title='提示', message='登录成功')
                user = self.entry_Account.get()
                self.frames_destroy()
                OperatePage(self.master)
            else:
                tk.messagebox.showerror(title='错误', message='账号密码不匹配！')

    def quit_out(self):  # 退出系统
        self.frames_destroy()
        quit()


class Modify:
    def frames_destroy(self):
        self.bg_frame.destroy()
        self.frame0.destroy()
        self.frame3.destroy()
        self.frame4.destroy()
        self.frame5.destroy()
        self.frame6.destroy()

    def __init__(self, master):
        self.master = master
        self.bg_frame = tk.Frame()
        self.frame0 = tk.Frame()

        self.frame3 = tk.Frame()
        self.frame4 = tk.Frame()
        self.frame5 = tk.Frame()
        self.frame6 = tk.Frame()

        self.frame3.place(x=350, y=202)
        self.frame4.place(x=350, y=238)
        self.frame5.place(x=350, y=274)
        self.frame6.place(x=600, y=330)
        self.bg_frame.place(x=0, y=0)
        self.photo = ImageTk.PhotoImage(Image.open('img1.png'))

        self.icon3 = ImageTk.PhotoImage(Image.open('身份证.png'))
        self.icon4 = ImageTk.PhotoImage(Image.open('密码.png'))
        self.icon5 = ImageTk.PhotoImage(Image.open('确认密码.png'))
        tk.Label(self.bg_frame, image=self.photo).pack()

        tk.Label(self.frame3, image=self.icon3).grid(column=0, row=0)
        tk.Label(self.frame4, image=self.icon4).grid(column=0, row=0)
        tk.Label(self.frame5, image=self.icon5).grid(column=0, row=0)

        tk.Label(self.frame3, font=("", "12"), text='账  号:').grid(column=1, row=0)
        tk.Label(self.frame4, font=("", "12"), text='旧密码:').grid(column=1, row=0)
        tk.Label(self.frame5, font=("", "12"), text='新密码:').grid(column=1, row=0)

        # 身份证输入框
        self.ID = tk.StringVar()
        self.entry_ID = tk.Entry(self.frame3, textvariable=self.ID)
        self.entry_ID.grid(column=2, row=0)
        # 首次密码输入框
        self.firstPW = tk.StringVar()
        self.entry_firstPW = tk.Entry(self.frame4, show='*', textvariable=self.firstPW)
        self.entry_firstPW.grid(column=2, row=0)
        # 再次密码输入框
        self.againPW = tk.StringVar()
        self.entry_againPW = tk.Entry(self.frame5, show='*', textvariable=self.againPW)
        self.entry_againPW.grid(column=2, row=0)

        self.sign_up = tk.Button(self.frame6, bd=3, font=("", "12"), text='确认修改',
                                 bg='LightBlue', command=self.operate_pw)
        self.sign_up.grid(column=0, row=0)

        self.go_back = tk.Button(self.frame0, bd=3, font=("", "12"), text='< 返回',
                                 bg='LightBlue', command=self.back)
        self.go_back.grid(column=0, row=0)
        self.frame0.place(x=5, y=5)

    def operate_pw(self):
        global user  # 全局变量存储本次登录用户的id（其他类相同）
        me = BankSystem()
        # 输入框
        acc = self.entry_ID.get()
        pw1 = self.entry_firstPW.get()
        pw2 = self.entry_againPW.get()
        if acc == '' or pw1 == '':  # 如果输入为空
            tk.messagebox.showerror(title='错误', message='请输入账号和旧密码！')
        elif pw2 == pw1:
            tk.messagebox.showerror(title='错误', message='新密码不能和旧密码相同！')
        else:
            my_sql = "select Account,Password from user where Account=%s and Password=%s" % \
                     (acc, pw1)
            me.execute_sql(my_sql)
            if len(me.data) != 0:  # 验证数据库运行结果
                sql = "UPDATE user SET Password = %s WHERE Account = %s" % (pw2, acc)
                # 执行SQL语句更新数据库
                me.execute_sql(sql)
                tk.messagebox.showinfo(title='提示', message='修改成功\n您的新密码为%s' % pw2)
                self.frames_destroy()
                self.back()
            else:
                tk.messagebox.showerror(title='错误', message='账号密码不匹配！')

    def back(self):
        self.frames_destroy()
        Initface(self.master)


class RegisterPage:
    def frames_destroy(self):
        self.bg_frame.destroy()
        self.frame0.destroy()
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()
        self.frame4.destroy()
        self.frame5.destroy()
        self.frame6.destroy()
        self.frame7.destroy()

    def __init__(self, master):
        self.master = master
        self.bg_frame = tk.Frame()
        self.frame0 = tk.Frame()
        self.frame1 = tk.Frame()
        self.frame2 = tk.Frame()
        self.frame3 = tk.Frame()
        self.frame4 = tk.Frame()
        self.frame5 = tk.Frame()
        self.frame6 = tk.Frame()
        self.frame7 = tk.Frame()
        self.frame1.place(x=350, y=130)
        self.frame2.place(x=350, y=166)
        self.frame3.place(x=350, y=202)
        self.frame4.place(x=350, y=238)
        self.frame5.place(x=350, y=274)
        self.frame6.place(x=600, y=330)
        self.frame7.place(x=350, y=310)
        self.bg_frame.place(x=0, y=0)
        self.photo = ImageTk.PhotoImage(Image.open('img2.png'))
        self.icon1 = ImageTk.PhotoImage(Image.open('姓名.png'))
        self.icon2 = ImageTk.PhotoImage(Image.open('电话.png'))
        self.icon3 = ImageTk.PhotoImage(Image.open('身份证.png'))
        self.icon4 = ImageTk.PhotoImage(Image.open('密码.png'))
        tk.Label(self.bg_frame, image=self.photo).pack()
        tk.Label(self.frame1, image=self.icon1).grid(column=0, row=0)
        tk.Label(self.frame2, image=self.icon2).grid(column=0, row=0)
        tk.Label(self.frame3, image=self.icon3).grid(column=0, row=0)
        tk.Label(self.frame4, image=self.icon4).grid(column=0, row=0)
        tk.Label(self.frame1, font=("", "12"), text='学生姓名:').grid(column=1, row=0)
        tk.Label(self.frame2, font=("", "12"), text='入学年份:').grid(column=1, row=0)
        tk.Label(self.frame3, font=("", "12"), text='学生专业:').grid(column=1, row=0)
        tk.Label(self.frame4, font=("", "12"), text='学生电话:').grid(column=1, row=0)
        # 姓名输入框
        self.name = tk.StringVar()
        self.entry_name = tk.Entry(self.frame1, textvariable=self.name)
        self.entry_name.grid(column=2, row=0)
        # 年份输入框
        self.year = tk.StringVar()
        self.entry_year = tk.Entry(self.frame2, textvariable=self.year)
        self.entry_year.grid(column=2, row=0)
        # 专业输入框
        self.maj = tk.StringVar()
        self.entry_maj = tk.Entry(self.frame3, textvariable=self.maj)
        self.entry_maj.grid(column=2, row=0)
        # 电话输入框
        self.phone = tk.StringVar()
        self.entry_phone = tk.Entry(self.frame4, show='*', textvariable=self.phone)
        self.entry_phone.grid(column=2, row=0)

        self.sign_up = tk.Button(self.frame6, bd=3, font=("", "12"), text='确认录入',
                                 bg='LightBlue', command=self.operate_pw)
        self.sign_up.grid(column=0, row=0)

        self.go_back = tk.Button(self.frame0, bd=3, font=("", "12"), text='< 返回',
                                 bg='LightBlue', command=self.back)
        self.go_back.grid(column=0, row=0)
        self.frame0.place(x=5, y=5)

    def operate_pw(self):
        me = BankSystem()
        account = choice(me.b_c_list)
        stu_id = account
        me.b_c_list.remove(stu_id)
        year = self.entry_year.get()
        maj = self.entry_maj.get()
        phone = self.entry_phone.get()
        # 输入框
        name = self.entry_name.get()
        create_time = datetime.now()  # 获取当前时间
        sql = "insert into students values('%d','%s','%s','%s','%s','%s')" % \
              (stu_id, name, year, maj, phone, create_time)
        me.execute_sql(sql)
        me.execute_sql("select * from students")

        sure = tk.messagebox.showinfo(title='成功', message='录入成功\n学生ID是%s。' % stu_id)
        if sure:  # 确认注册成功后
            self.frames_destroy()
            Initface(self.master)
        else:
            tk.messagebox.showerror(title='错误', message='录入信息失败！')

    def back(self):
        self.frames_destroy()
        OperatePage(self.master)


class OperatePage:
    def frames_destroy(self):
        self.bg_frame.destroy()
        self.frame0.destroy()
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()
        self.frame4.destroy()
        self.frame5.destroy()

    def __init__(self, master):
        self.master = master
        self.bg_frame = tk.Frame()
        self.frame0 = tk.Frame()
        self.frame1 = tk.Frame()
        self.frame2 = tk.Frame()
        self.frame3 = tk.Frame()
        self.frame4 = tk.Frame()
        self.frame5 = tk.Frame()
        self.bg_frame.place(x=0, y=0)
        self.frame0.place(x=5, y=5)
        self.frame1.place(x=100, y=50)
        self.frame2.place(x=220, y=50)
        self.frame3.place(x=340, y=50)
        self.frame4.place(x=460, y=50)
        self.frame5.place(x=580, y=50)
        self.photo = ImageTk.PhotoImage(Image.open('img2.png'))
        tk.Label(self.bg_frame, image=self.photo).pack()
        self.show_info = tk.Button(self.frame1, bd=3, font=("", "12"), cursor='hand2',
                                   text='基本信息', command=self.show_info_page)
        self.show_info.grid(column=3, row=1)
        self.show_balance = tk.Button(self.frame2, bd=3, font=("", "12"), cursor='hand2',
                                      text='就业信息',
                                      command=self.show_emp_page)
        self.show_balance.grid(column=3, row=2)
        self.withdraw = tk.Button(self.frame3, bd=3, font=("", "12"), cursor='hand2',
                                  text='证书信息', command=self.show_cert_page)
        self.withdraw.grid(column=3, row=3)
        self.save = tk.Button(self.frame4, bd=3, font=("", "12"), cursor='hand2',
                              text='成绩信息', command=self.show_acad_page)
        self.save.grid(column=3, row=4)
        self.dele = tk.Button(self.frame5, bd=3, font=("", "12"), cursor='hand2',
                              text='删除信息', command=self.dele_page)
        self.dele.grid(column=3, row=4)

        self.go_back = tk.Button(self.frame0, bd=3, bg='LightBlue', font=("", "12"), cursor='hand2',
                                 text='<返回', command=self.back)
        self.go_back.grid(column=4, row=8)

    def show_info_page(self):
        self.frames_destroy()
        StudentsInfo(self.master)

    def show_emp_page(self):
        self.frames_destroy()
        Emp(self.master)

    def show_cert_page(self):
        Cert(self.master)
        self.frames_destroy()

    def show_acad_page(self):
        Acad(self.master)
        self.frames_destroy()

    def dele_page(self):
        self.frames_destroy()
        Dele(self.master)

    def back(self):
        self.frames_destroy()
        Initface(self.master)


class StudentsInfo:
    def __init__(self, master):
        self.master = master
        self.frame1 = tk.Frame()
        self.frame2 = tk.Frame()
        self.frame3 = tk.Frame()
        self.frame1.place(x=5, y=5)
        self.frame2.place(x=200, y=20)
        self.frame3.place(x=350, y=15)
        self.go_back = tk.Button(self.frame1, font=("", "12"), bd=3, text='< 返回', command=self.back)
        self.go_back.grid(column=0, row=0)
        self.en_search = tk.StringVar()
        self.en = tk.Entry(self.frame2, textvariable=self.en_search)
        self.en.grid(column=0, row=0)
        self.bt_search = tk.Button(self.frame3, font=("", "12"), bd=3, text='搜索', command=self.search)
        self.bt_search.grid(column=0, row=0)
        self.roll = ttk.Scrollbar(self.master, orient='vertical')  # 竖直滚动条
        self.show()

    def back(self):
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()
        self.roll.destroy()
        OperatePage(self.master)

    def search(self):
        a = '%'
        _input = a + str(self.en_search.get()) + a
        me = BankSystem()
        columns = ("学号", "姓名", "年级", "专业", "电话", "录入时间")
        tree = ttk.Treeview(self.master, height=15, show="headings", columns=columns)  # 表格
        tree.column("学号", width=80, anchor='w')  # 表示列,不显示
        tree.column("姓名", width=80, anchor='w')
        tree.column("年级", width=70, anchor='w')
        tree.column("专业", width=150, anchor='w')
        tree.column("电话", width=120, anchor='w')
        tree.column("录入时间", width=150, anchor='w')

        tree.heading("学号", text="学号")
        tree.heading("姓名", text="姓名")
        tree.heading("年级", text="年级")  # 显示表头
        tree.heading("专业", text="专业")
        tree.heading("电话", text="电话")
        tree.heading("录入时间", text="录入时间")
        tree.place(x=50, y=50)
        info1 = []
        info2 = []
        info3 = []
        info4 = []
        info5 = []
        info6 = []
        sql = "select * from students where" \
              " StudentID LIKE'%s' or Name LIKE'%s' or Tel LIKE'%s'" % (_input, _input, _input)
        # 实现模糊查询
        info_all = me.execute_sql(sql)
        for i in range(len(info_all)):
            info1.append(info_all[i][0])
            info2.append(info_all[i][1])
            info3.append(info_all[i][2])
            info4.append(info_all[i][3])
            info5.append(info_all[i][4])
            info6.append(info_all[i][5])
        for k in range(len(info1)):  # 写入数据
            tree.insert('', k, values=(info1[k], info2[k], info3[k], info4[k], info5[k], info6[k]))

    def show(self):
        me = BankSystem()
        columns = ("学号", "姓名", "年级", "专业", "电话", "录入时间")
        tree = ttk.Treeview(self.master, height=15, show="headings", columns=columns)  # 表格
        tree.column("学号", width=80, anchor='w')  # 表示列,不显示
        tree.column("姓名", width=80, anchor='w')
        tree.column("年级", width=70, anchor='w')
        tree.column("专业", width=150, anchor='w')
        tree.column("电话", width=120, anchor='w')
        tree.column("录入时间", width=150, anchor='w')
        tree.heading("学号", text="学号")
        tree.heading("姓名", text="姓名")
        tree.heading("年级", text="年级")  # 显示表头
        tree.heading("专业", text="专业")
        tree.heading("电话", text="电话")
        tree.heading("录入时间", text="录入时间")
        tree.place(x=50, y=50)
        tree1 = ttk.Treeview(self.master, show='headings', columns=columns, yscrollcommand=self.roll.set)
        self.roll['command'] = tree1.yview()
        self.roll.pack(side='right', fill='y')
        info1 = []
        info2 = []
        info3 = []
        info4 = []
        info5 = []
        info6 = []
        info_all = me.execute_sql("select StudentID,Name,Grade,Major,Tel,CreateTime from students")
        for i in range(len(info_all)):
            info1.append(info_all[i][0])
            info2.append(info_all[i][1])
            info3.append(info_all[i][2])
            info4.append(info_all[i][3])
            info5.append(info_all[i][4])
            info6.append(info_all[i][5])
        for k in range(len(info1)):  # 写入数据
            tree.insert('', k, values=(info1[k], info2[k], info3[k], info4[k], info5[k], info6[k]))


class Emp:
    def __init__(self, master):
        self.master = master
        self.frame1 = tk.Frame()
        self.frame2 = tk.Frame()
        self.frame3 = tk.Frame()
        self.frame1.place(x=5, y=5)
        self.frame2.place(x=200, y=20)
        self.frame3.place(x=350, y=15)

        # 添加编辑按钮
        # self.edit_button = tk.Button(self.frame1, font=("", "12"), bd=3, text='编辑', )
        # self.edit_button.grid(column=1, row=0)

        # 添加保存按钮
        # self.save_button = tk.Button(self.frame1, font=("", "12"), bd=3, text='保存',
        #                              state=tk.DISABLED)
        # self.save_button.grid(column=2, row=0)
        self.go_back = tk.Button(self.frame1, font=("", "12"), bd=3, text='< 返回', command=self.back)
        self.go_back.grid(column=0, row=0)
        self.en_search = tk.StringVar()
        self.en = tk.Entry(self.frame2, textvariable=self.en_search)
        self.en.grid(column=0, row=0)
        self.bt_search = tk.Button(self.frame3, font=("", "12"), bd=3, text='搜索', command=self.search)
        self.bt_search.grid(column=0, row=0)
        self.roll = ttk.Scrollbar(self.master, orient='vertical')  # 竖直滚动条
        self.show()

    def back(self):
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()
        self.roll.destroy()
        OperatePage(self.master)

    def search(self):
        a = '%'
        _input = a + str(self.en_search.get()) + a
        me = BankSystem()
        columns = ("学号", "状态", "单位", "职位", "入职时间", "薪资")
        tree = ttk.Treeview(self.master, height=15, show="headings", columns=columns)  # 表格
        tree.column("学号", width=80, anchor='w')  # 表示列,不显示
        tree.column("状态", width=80, anchor='w')
        tree.column("单位", width=150, anchor='w')
        tree.column("职位", width=120, anchor='w')
        tree.column("入职时间", width=150, anchor='w')
        tree.column("薪资", width=70, anchor='w')

        tree.heading("学号", text="学号")
        tree.heading("状态", text="状态")
        tree.heading("单位", text="单位")  # 显示表头
        tree.heading("职位", text="职位")
        tree.heading("入职时间", text="入职时间")
        tree.heading("薪资", text="薪资")
        tree.place(x=50, y=50)
        info1 = []
        info2 = []
        info3 = []
        info4 = []
        info5 = []
        info6 = []
        sql = "select * from employmentinformation where" \
              " StudentID LIKE'%s' " % _input
        # 实现查询
        info_all = me.execute_sql(sql)
        for i in range(len(info_all)):
            info1.append(info_all[i][0])
            info2.append(info_all[i][1])
            info3.append(info_all[i][2])
            info4.append(info_all[i][3])
            info5.append(info_all[i][4])
            info6.append(info_all[i][5])
        for k in range(len(info1)):  # 写入数据
            tree.insert('', k, values=(info1[k], info2[k], info3[k], info4[k], info5[k], info6[k]))

    def show(self):
        me = BankSystem()
        columns = ("学号", "状态", "单位", "职位", "入职时间", "薪资")
        tree = ttk.Treeview(self.master, height=15, show="headings", columns=columns)  # 表格
        tree.column("学号", width=80, anchor='w')  # 表示列,不显示
        tree.column("状态", width=80, anchor='w')
        tree.column("单位", width=150, anchor='w')
        tree.column("职位", width=120, anchor='w')
        tree.column("入职时间", width=150, anchor='w')
        tree.column("薪资", width=70, anchor='w')
        tree.heading("学号", text="学号")
        tree.heading("状态", text="状态")
        tree.heading("单位", text="单位")  # 显示表头
        tree.heading("职位", text="职位")
        tree.heading("入职时间", text="入职时间")
        tree.heading("薪资", text="薪资")
        tree.place(x=50, y=50)
        tree1 = ttk.Treeview(self.master, show='headings', columns=columns, yscrollcommand=self.roll.set)
        self.roll['command'] = tree1.yview()
        self.roll.pack(side='right', fill='y')
        info1 = []
        info2 = []
        info3 = []
        info4 = []
        info5 = []
        info6 = []
        info_all = me.execute_sql("select * from employmentinformation")
        for i in range(len(info_all)):
            info1.append(info_all[i][0])
            info2.append(info_all[i][1])
            info3.append(info_all[i][2])
            info4.append(info_all[i][3])
            info5.append(info_all[i][4])
            info6.append(info_all[i][5])
        for k in range(len(info1)):  # 写入数据
            tree.insert('', k, values=(info1[k], info2[k], info3[k], info4[k], info5[k], info6[k]))


class Cert:
    def __init__(self, master):
        self.master = master
        self.frame1 = tk.Frame()
        self.frame2 = tk.Frame()
        self.frame3 = tk.Frame()
        self.frame1.place(x=5, y=5)
        self.frame2.place(x=200, y=20)
        self.frame3.place(x=350, y=15)
        self.go_back = tk.Button(self.frame1, font=("", "12"), bd=3, text='< 返回', command=self.back)
        self.go_back.grid(column=0, row=0)
        self.en_search = tk.StringVar()
        self.en = tk.Entry(self.frame2, textvariable=self.en_search)
        self.en.grid(column=0, row=0)
        self.bt_search = tk.Button(self.frame3, font=("", "12"), bd=3, text='搜索', command=self.search)
        self.bt_search.grid(column=0, row=0)
        self.roll = ttk.Scrollbar(self.master, orient='vertical')  # 竖直滚动条
        self.show()

    def back(self):
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()
        self.roll.destroy()
        OperatePage(self.master)

    def search(self):
        a = '%'
        _input = a + str(self.en_search.get()) + a
        me = BankSystem()
        columns = ("学号", "证书名称", "发行单位", "发行日期", "其他信息")
        tree = ttk.Treeview(self.master, height=15, show="headings", columns=columns)  # 表格
        tree.column("学号", width=80, anchor='w')  # 表示列,不显示
        tree.column("证书名称", width=150, anchor='w')
        tree.column("发行单位", width=150, anchor='w')
        tree.column("发行日期", width=120, anchor='w')
        tree.column("其他信息", width=150, anchor='w')

        tree.heading("学号", text="学号")
        tree.heading("证书名称", text="证书名称")
        tree.heading("发行单位", text="发行单位")  # 显示表头
        tree.heading("发行日期", text="发行日期")
        tree.heading("其他信息", text="其他信息")
        tree.place(x=50, y=50)
        info1 = []
        info2 = []
        info3 = []
        info4 = []
        info5 = []
        sql = "select * from certificates where" \
              " StudentID LIKE'%s'" % _input
        # 实现模糊查询
        info_all = me.execute_sql(sql)
        for i in range(len(info_all)):
            info1.append(info_all[i][0])
            info2.append(info_all[i][1])
            info3.append(info_all[i][2])
            info4.append(info_all[i][3])
            info5.append(info_all[i][4])
        for k in range(len(info1)):  # 写入数据
            tree.insert('', k, values=(info1[k], info2[k], info3[k], info4[k], info5[k]))

    def show(self):
        me = BankSystem()
        columns = ("学号", "证书名称", "发行单位", "发行日期", "其他信息")
        tree = ttk.Treeview(self.master, height=15, show="headings", columns=columns)  # 表格
        tree.column("学号", width=80, anchor='w')  # 表示列,不显示
        tree.column("证书名称", width=150, anchor='w')
        tree.column("发行单位", width=150, anchor='w')
        tree.column("发行日期", width=120, anchor='w')
        tree.column("其他信息", width=150, anchor='w')

        tree.heading("学号", text="学号")
        tree.heading("证书名称", text="证书名称")
        tree.heading("发行单位", text="发行单位")  # 显示表头
        tree.heading("发行日期", text="发行日期")
        tree.heading("其他信息", text="其他信息")
        tree.place(x=50, y=50)
        tree1 = ttk.Treeview(self.master, show='headings', columns=columns, yscrollcommand=self.roll.set)
        self.roll['command'] = tree1.yview()
        self.roll.pack(side='right', fill='y')
        info1 = []
        info2 = []
        info3 = []
        info4 = []
        info5 = []
        info_all = me.execute_sql("select * from certificates")
        for i in range(len(info_all)):
            info1.append(info_all[i][0])
            info2.append(info_all[i][1])
            info3.append(info_all[i][2])
            info4.append(info_all[i][3])
            info5.append(info_all[i][4])
        for k in range(len(info1)):  # 写入数据
            tree.insert('', k, values=(info1[k], info2[k], info3[k], info4[k], info5[k]))


class Acad:
    def __init__(self, master):
        self.master = master
        self.frame1 = tk.Frame()
        self.frame2 = tk.Frame()
        self.frame3 = tk.Frame()
        self.frame1.place(x=5, y=5)
        self.frame2.place(x=200, y=20)
        self.frame3.place(x=350, y=15)
        self.go_back = tk.Button(self.frame1, font=("", "12"), bd=3, text='< 返回', command=self.back)
        self.go_back.grid(column=0, row=0)
        self.en_search = tk.StringVar()
        self.en = tk.Entry(self.frame2, textvariable=self.en_search)
        self.en.grid(column=0, row=0)
        self.bt_search = tk.Button(self.frame3, font=("", "12"), bd=3, text='搜索', command=self.search)
        self.bt_search.grid(column=0, row=0)
        self.roll = ttk.Scrollbar(self.master, orient='vertical')  # 竖直滚动条
        self.show()

    def back(self):
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()
        self.roll.destroy()
        OperatePage(self.master)

    def search(self):
        a = '%'
        _input = a + str(self.en_search.get()) + a
        me = BankSystem()
        columns = ("学号", "科目", "分数", "学期", "教师", "评价")
        tree = ttk.Treeview(self.master, height=15, show="headings", columns=columns)  # 表格
        tree.column("学号", width=80, anchor='w')  # 表示列,不显示
        tree.column("科目", width=100, anchor='w')
        tree.column("分数", width=70, anchor='w')
        tree.column("学期", width=120, anchor='w')
        tree.column("教师", width=100, anchor='w')
        tree.column("评价", width=180, anchor='w')

        tree.heading("学号", text="学号")
        tree.heading("科目", text="科目")
        tree.heading("分数", text="分数")  # 显示表头
        tree.heading("学期", text="学期")
        tree.heading("教师", text="教师")
        tree.heading("评价", text="评价")
        tree.place(x=50, y=50)
        info1 = []
        info2 = []
        info3 = []
        info4 = []
        info5 = []
        info6 = []
        sql = "select * from academicscores where" \
              " StudentID LIKE'%s'" % _input
        # 实现模糊查询
        info_all = me.execute_sql(sql)
        for i in range(len(info_all)):
            info1.append(info_all[i][0])
            info2.append(info_all[i][1])
            info3.append(info_all[i][2])
            info4.append(info_all[i][3])
            info5.append(info_all[i][4])
            info6.append(info_all[i][5])
        for k in range(len(info1)):  # 写入数据
            tree.insert('', k, values=(info1[k], info2[k], info3[k], info4[k], info5[k], info6[k]))

    def show(self):
        me = BankSystem()
        columns = ("学号", "科目", "分数", "学期", "教师", "评价")
        tree = ttk.Treeview(self.master, height=15, show="headings", columns=columns)  # 表格
        tree.column("学号", width=80, anchor='w')  # 表示列,不显示
        tree.column("科目", width=100, anchor='w')
        tree.column("分数", width=70, anchor='w')
        tree.column("学期", width=120, anchor='w')
        tree.column("教师", width=100, anchor='w')
        tree.column("评价", width=180, anchor='w')
        tree.heading("学号", text="学号")
        tree.heading("科目", text="科目")
        tree.heading("分数", text="分数")  # 显示表头
        tree.heading("学期", text="学期")
        tree.heading("教师", text="教师")
        tree.heading("评价", text="评价")
        tree.place(x=50, y=50)
        tree1 = ttk.Treeview(self.master, show='headings', columns=columns, yscrollcommand=self.roll.set)
        self.roll['command'] = tree1.yview()
        self.roll.pack(side='right', fill='y')
        info1 = []
        info2 = []
        info3 = []
        info4 = []
        info5 = []
        info6 = []
        info_all = me.execute_sql("select * from academicscores ")
        for i in range(len(info_all)):
            info1.append(info_all[i][0])
            info2.append(info_all[i][1])
            info3.append(info_all[i][2])
            info4.append(info_all[i][3])
            info5.append(info_all[i][4])
            info6.append(info_all[i][5])
        for k in range(len(info1)):  # 写入数据
            tree.insert('', k, values=(info1[k], info2[k], info3[k], info4[k], info5[k], info6[k]))


class Dele:
    def frames_destroy(self):
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()

    def __init__(self, master):
        self.master = master
        self.frame1 = tk.Frame()
        self.frame2 = tk.Frame()
        self.frame3 = tk.Frame()

        self.frame1.place(x=5, y=5)
        self.frame2.place(x=200, y=20)
        self.frame3.place(x=350, y=15)
        self.go_back = tk.Button(self.frame1, font=("", "12"), bd=3, text='< 返回', command=self.back)
        self.go_back.grid(column=0, row=0)
        self.en_search = tk.StringVar()
        self.en = tk.Entry(self.frame2, textvariable=self.en_search)
        self.en.grid(column=0, row=0)
        self.bt_search = tk.Button(self.frame3, font=("", "12"), bd=3, text='删除', command=self.do)
        self.bt_search.grid(column=0, row=0)


    def back(self):
        self.frame1.destroy()
        self.frame2.destroy()
        self.frame3.destroy()

        OperatePage(self.master)

    def do(self):
        _input = self.en_search.get()
        me = BankSystem()
        check = "SELECT * FROM students WHERE StudentID = '%s';" % _input
        me.execute_sql(check)
        if len(me.data) == 0:
            tk.messagebox.showerror(title='错误', message='未找到信息！')
        else:
            sure = tk.messagebox.showinfo(title='提示', message='确定删除该学生所有信息吗？')
            if sure:
                sql = "Delete from academicscores where StudentID = '%s' ;" \
                      "Delete from certificates where StudentID = '%s' ;" \
                      "Delete from employmentinformation where StudentID = '%s' ;" \
                      "Delete from students where StudentID = '%s' ;" % (_input, _input, _input, _input)
                me.execute_sql(sql)
                tk.messagebox.showerror(title='成功', message='已删除学生“%s”的全部信息' % _input)
                self.frames_destroy()
                Initface(self.master)
            else:
                Dele(self.master)


class BankSystem:
    def __init__(self):
        # self.db = connect(db_url, db_account, db_psw, db_name,user)  # 连接数据库
        self.db = connect(host=db_url, user=db_account, password=db_psw, database=db_name)
        self.cursor = self.db.cursor()
        self.data = None
        self.b_c_list = [i for i in range(666000, 667000)]

    def execute_sql(self, my_sql) -> tuple:  # 元组储存数据库控制台显示的信息
        try:
            self.cursor.execute(my_sql)  # 执行数据库语句
            # 事务提交
            self.db.commit()
            self.data = self.cursor.fetchall()
        except Exception as err:
            # 事务回滚
            self.db.rollback()
            print("SQL执行错误，原因：", err)  # 控制台抛出异常
        return self.data  # 返回运行后信息


def main():
    root = tk.Tk()
    BaseDesk(root)
    root.mainloop()  # 开启循环


if __name__ == '__main__':
    try:
        main()
    except Exception as e:
        print("异常的类型是:%s" % type(e))
        print("异常的内容是:%s" % e)
    else:
        print("正常运行")
