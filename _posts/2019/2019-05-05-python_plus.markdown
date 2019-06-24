---
layout: post
title:  "python积累"
date:   2019-05-05 00:00:01 +0800
categories: program
tags: python time database
description: python技巧积累，散装python技能
---
<<<<<<< HEAD
## 时间戳打印
参考：https://www.v2ex.com/t/450061

  import time
=======
##### 经常有些知识是散的，聚在一起也就多了
>>>>>>> b3986117995e4cef430367c97ea0d0a93aebd116

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

{% highlight ruby %}
#未完待续
{% endhighlight %}
