---
layout: post
title:  "装饰器"
date:   2018-07-01 16:02:45  +0800
categories: python3
tags: decorator
description: 装饰器初识
---
### 装饰器

定义：本质是函数（装饰其他函数），就是为其他函数添加附加功能

原则：

* 不能修改被装饰函数的源代码
* 不能修改被装饰函数的调用方式

实现装饰器知识储备：

1,函数即"变量"

2,高阶函数

	* 把一个函数名当做实参传给另一个函数（在不修改被装饰函数源代码的情况下为其添加功能）
	* 返回值中包含函数名（不修改函数的调用方式）

3,嵌套函数

内嵌函数定义完成必须进行调用，否则只是定义，将不生效

{% highlight ruby %}
x = 0
def gradpa():
    x = 1
    def dad():
        x = 2
        def son():
            x = 3
            print(x)
        son()
    dad()


gradpa()	#调用gradnpa函数，函数内部里面定义dad并调用才会生效内部函数
{% endhighlight %}


高阶函数+嵌套函数=>装饰器

### example

现有一个函数test1，使用装饰器给其添加执行时间功能

test1

{% highlight ruby %}
import time
def test1():
    time.sleep(2)
    print("in the test1")
{% endhighlight %}

传递函数地址，函数体现变量赋值的特点

{% highlight ruby %}
import time
def test1():
    time.sleep(2)
    print("in the test1")

def timer(func):	#func=test1
    func()		#test1() 
    return func 

timer(test1)		#传递内存地址test1
print(timer)		#打印内存地址

test1=timer(test1)      #实现变量赋值功能
{% endhighlight %}

修改调用方式实现的装饰功能

{% highlight ruby %}
import time

def test1():
    time.sleep(2)
    print("in the test1")

def timer(func): #func=test1
    start_time=time.time()
    func()       #test1()
    end_time=time.time()
    print("runtime is %s"%(end_time -start_time))
    return func

timer(test1)		#实现了装饰的功能，改变其调用方式
print("------1-------")
#如果使用如下方式进行调用
test1=timer(test1)	#传递地址test1
print("------2-------")
test1()			#导致传参执行一次调用，同时传参只是将test1最终传回test1,那么传参就要讲整体都传回来，需要一个内嵌函数
{% endhighlight %}

	结果如下：
	in the test1
	runtime is 2.0007898807525635
	------1-------
	in the test1
	runtime is 2.000873565673828
	------2-------
	in the test1

使用高阶函数传参+内嵌函数实现装饰功能

{% highlight ruby %}
import time

def timer(fun):
    def deco(*args,**kwargs):
        start_time = time.time()
        fun(*args,**kwargs)
        end_time = time.time()
        print("run time is %s"%(end_time - start_time))
    return deco   #装饰器传的是地址！！！

def test1():
    time.sleep(2)
    print("in the test1")

test1=timer(test1)	#使用内嵌函数将一个定义完全的新函数传回，传递过程中不执行次参数
test1()
{% endhighlight %}

python3中推荐的装饰器使用方法

{% highlight ruby %}
import time

def timer(fun):			#把原函数地址传进来fun=test1
    def deco(*args,**kwargs):	#对于可变参数传递方式
        start_time = time.time()
        fun(*args,**kwargs)
        end_time = time.time()
        print("run time is %s"%(end_time - start_time))
    return deco   #装饰器传的是函数地址地址！！！

@timer   #test1=timer(test1)
def test1():
    time.sleep(2)
    print("in the test1")
test1=timer(test1)

@timer
def test2(name):
    print(name)

test1()
test2("alex")
{% endhighlight %}

装饰器进阶用法

1.原函数中包含return值

2.装饰器传递一个参数

{% highlight ruby %}
user = "alex"
passwd = "12345"
def login(login_type):		#@longin参数先传递到第一层
    def out_wrapper(func):	#第二次开始传递函数名
        def wrapper(*args,**kwargs):
            if login_type == "local":
                username = input("username:").strip()
                password = input("password:").strip()
                if username == user and password == passwd:
                    res = func(*args,**kwargs)
                    print("----after authentication")
                    return res
                else:
                    print("username or password is invalid")
                    exit()
            elif login_type == "ldap":
                print("搞毛线ldap")
        return wrapper
    return out_wrapper

def index():
    print("welcome to index")

@login(login_type="local")	#加入传递参数
def home():
    print("welcome to home")
    return "for home"

@login(login_type="ldap")	#加入传递参数
def bbs():
    print("welcome to bbs")

index()
print(home())
bbs()
{% endhighlight %} 
