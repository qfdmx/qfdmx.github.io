---
layout: post
title:  "python3常用模块"
date:   2019-11-24 22:00:01 +0800
categories: language
tags: python3
description: python3常用模块
---

参数模块argparse

{% highlight python %}
#! /home/xjb/py3/bin/python3
# -*- coding: utf-8 -*-
#date:20191124
#author:xjb

import argparse


parser = argparse.ArgumentParser(description='Batch Register')
parser.add_argument("topic", help="请输入topic", type=str)
parser.add_argument("file", help="请输file", type=str)
parser.add_argument('--ip','-i',type=str, default="192.168.25.121", help='The box ip address')
parser.add_argument('--time','-t',type=int, default="10", help='相邻两条时间间隔')
parser.add_argument('--trun','-n',type=int, default="0", help='每秒发送条数')

args = parser.parse_args()

print(args.topic,args.file,args.ip,args.time,args.trun)
{% endhighlight %}

执行情况

    ./test.py -i 192.168.25 pf_warn file
    pf_warn file 192.168.25 10 0
