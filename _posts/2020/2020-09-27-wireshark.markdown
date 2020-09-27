---
layout: post
title:  "wireshark"
date:   2020-09-27 08:00:01 +0800
categories:
tags:  wireshark
description: wireshark报文筛选
---

### wireshark报文筛选

1.条件连接符号
    and    or   not

2.判断符号
    < >  >=   <=  ==  !=

3.筛选条件
    源地址 ip.src
    目的值 ip.dst
    应用数据长度 data.len
    协议（不要参数） ssh   tcp   udp  ntp

4.常用命令推荐

按照协议和应用层数据长度进行筛选
    tcp and data.len>0    （推荐）
    tcp and data.len>0 and ip.src==192.168.8.200


数据长度筛选
    data.len >2 and data.len <100
    data.len >0 and data.data contains "68"
    data.len >0 and data.data matches "68"

data起始位和终止位指定数值
    data.data[0]==68
    data.data[-1]==67

时间段筛选
    frame.time <"2020-09-24 15:21:00.000000"

复合筛选
    data.data[0]==68 and data.len > 6 and data.data[6]!=d2

[其他筛选推荐](https://blog.csdn.net/liuchaoxuan/article/details/81605257)

5.关于应用层报文内容复制
    在data上右键选择复制字节数偏移十六进制
