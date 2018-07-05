---
layout: post
title:  "生成器与迭代器"
date:   2018-07-04 21:59:33  +0800
categories: python3
tags: 生成器 迭代器
description: 
---
### 列表生成器

{% highlight ruby %}
#列表生成式
[ i*2 for i in range(10) ]
[ func(i) * 2 for i in range(10) ]

#等效写法
a = []
for i in range(10):
	a.append(i*2)
{% endhighlight %}

#生成器 

* 只有在电泳是才会生成相应的数据
* 只记录当前位置
* 只有一个__next__()方法  next()

{% highlight ruby %}
( i*i for i in range(10) )

{% endhighlight %}

{% highlight ruby %}
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        #print(b)
        yield b
        a, b = b, a + b
        #t=(b,a+b)
        n = n + 1
    return 'done'
f = fib(3)
# print(f.__next__())
# print(f.__next__())
# print(f.__next__())
# print(f.__next__())
# print(f.__next__())
# for i in f:
#     print(i)
g=fib(3)
while True:
    try:
        x=next(g)
        print('g:',x)
    except StopIteration as e:
        print('Generator return value:',e.value)
        break

{% endhighlight %}

yield实现的是中断函数并保留状态，下次返回时候继续从此处执行

下面是使用yield实现单线程多并发例子

{% highlight ruby %}
import time
def consumer(name):
    print("准备吃包子了%s"%name)
    while True:
        baozi = yield
        print("包子[%s]来了，[%s]吃完了"%(baozi,name))

c = consumer("alex")
c.__next__()
c.send("韭菜馅")

def producer():
    c1=consumer("A")
    c2=consumer("B")
    c1.__next__()
    c2.__next__()
    print("老纸准备做包子了")
    for i in range(10):
        print("包子做好了，分成两半")
        time.sleep(1)
        c1.send(i)
        c2.send(i)

producer()
{% endhighlight %}

### 迭代器

可以直接作用于for循环的数据结构有以下几种：

一类是集合数据类型，如list、tuple、dict、set、str等；

一类是generator，包括生成器和带yield的generator function。

这些可以直接作用于for循环的对象统称为迭代对象：Iterable。

可以使用isinstance()判断一个对象是否是Iterable对象：

{% highlight ruby %}
>>> from collections import Iterable
>>> isinstance([],Iterable)
True
sinstance({},Iterable)
True
>>> isinstance('abc',Iterable)
True
>>> isinstance((x for x in range(10)),Iterable)
True
>>> isinstance(100,Iterable)
False
{% endhighlight %}

而生成器不但可以作用于for循环，还可以被__next__()函数不断调用并返回一个值，直到最后抛出StopIteraion错误表示无法继续返回下一个值了。

	可以被next()函数调用并不断返回下一个值的对象称为迭代器：Iterator

可以使用isinstance()，判断是否是一个迭代器Iterator对象：

{% highlight ruby %}
>>> from collections import Iterator
>>> isinstance((x for x in range(10)),Iterable)
True
>>> isinstance([],Iterator)
False
>>> isinstance({},Iterator)
False
>>> isinstance('abc',Iterator)
False
{% endhighlight %}

生成器都是Iterator对象，但list、dict、str虽然是Iterable，却不是Iterator。。

把list、dict、str等Iterable变成Iterator可以使用iter()函数：

{% highlight ruby %}
>>> isinstance(iter([]),Iterator)
True
>>> isinstance(iter('abc'),Iterator)
True
{% endhighlight %}

这是因为python的Iterator对象表示的是一个数据流，Iterator对象可以被next()函数调用并返回下一个数据，直到没有数据时抛出StopIteration错误。可以把这个数据流看做是有一个有序序列，但我们不能提前知道序列长度，只能不断地通过next()函数实现下一个数据，所以Iterator的计算是惰性的，只有在需要返回下一个数据时它才会计算。

Iterator甚至可以表示一个无限大的数据流，例如全体自然数，而使用list是永远不能存储全体自然数的。

### 小结

凡是可作用于for循环的对象都是Iterable类型

凡是可作用于next()函数的对象都是Iterator类型，他们表示一个惰性计算的序列：

集合数据类型如：list、dict、str等是Iterable但不是Iterator；不过可以通过iter()函数获得一个Iterator对象。

python的for循环本质上就是通过不断调用next()函数实现的，例如：

python 3中 range(10)本质是迭代器，python2中是列表，xrange(10)是迭代器
{% highlight ruby %}
for x in range(5)
	pass

#完全等同于

it = iter([0,1,2,3,4])

while True:
	try:
		x = next(it)
	except StopIteration:
		break

迭代器取文件

for line in f:
	print(line)

{% endhighlight %}
