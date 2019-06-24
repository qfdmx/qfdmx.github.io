---
layout: post
title:  "python积累"
date:   2019-05-05 00:00:01 +0800
categories: program
tags: python time database
description: python技巧积累，散装python技能
---
##### 经常有些知识是散的，聚在一起也就多了

### 1.时间戳打印

&emsp;&emsp;程序运行的变量只能赋值一次，不能继续刷新，函数调用会更新时间戳

{% highlight ruby %}
import time

#currenttime=time.localtime() #变量只能赋值一次，函数调用会更新时间戳
currenttime=lambda:time.strftime("%Y%m%d-%H:%M:%S",time.localtime())

timer=5

while 1:
   print(currenttime())
   time.sleep(timer)
{% endhighlight %}

### 2.使用JDBC连接数据库

&emsp;&emsp;很多国内的数据库（对，垃圾的金仓和dm）对于ODBC支持并不友好，但是绝大多数都是支持JDBC连接数据库。所以python使用JDBC进行通用数据库连接调试是相当必要的。

&emsp;&emsp;python中的[JayDeBeApi模块](https://pypi.org/project/JayDeBeApi/)![版本](https://warehouse-camo.cmh1.psfhosted.org/f50baa120696661e3b1dcea5e955f62786de00dc/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f7461672f62617a7469616e2f6a6179646562656170692e737667)![python版本](https://warehouse-camo.cmh1.psfhosted.org/f108bdb35685369d1463c477b80127439170b46a/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f707974686f6e2d322e362c5f322e372c5f332e342d626c75652e737667)(A bridge from JDBC database drivers to Python DB-API.)目前已通过测试的数据库包括 HSQLDB 和 DB2。建议联网状态下使用pip安装该版本，同时当前时间20190624建议python3版本在3.6.4

    pip install JayDeBeApi

然后将JDBC.jar放在指定位置，使用如下代码进行调试。

{% highlight ruby %}
#!/home/p2000/test//Python3/bin/python3

import jaydebeapi

#dm数据库配置，金仓需要使用金仓的jdbc文件
user='我是账户'
password='我是密码'

#dm
url='jdbc:dm://192.168.25.117/PSGSM2000V2'
dirver='dm.jdbc.driver.DmDriver'
jarFile='/home/p2000/test/Python3/jdbc/DmJdbcDriver.jar'

sqlStr='select * from CONF_BROKER'

#连接语句,连接测试单句
#conn=jaydebeapi.connect('dm.jdbc.driver.DmDriver','jdbc:dm://192.168.25.161/PSGSM2000V2',['我是账户','我是密码'],'/home/p2000/test/install_sendKafka/DmJdbcDriver.jar')
conn=jaydebeapi.connect(dirver,url,[user,password],jarFile)

curs = conn.cursor()
curs.execute(sqlStr)
result=curs.fetchall()
print(result)
curs.close()
conn.close()
{% endhighlight %}
