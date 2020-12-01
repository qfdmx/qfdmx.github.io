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

#### 关于数据分析

SYN,FIN,ACK,PSH,RST,DATA,TSval,TSecr

    在data上右键选择复制字节数偏移十六进制
    它们的含义是：   
    SYN表示建立连接，
    FIN表示关闭连接，
    ACK表示响应，   
    PSH表示有 DATA数据传输，
    RST表示连接重置。
    其中，ACK是可能与SYN，FIN等同时使用的，比如SYN和ACK可能同时为1，它表示的就是建立连接之后的响应，
    如果只是单个的一个SYN，它表示的只是建立连接。

    概念补充-TCP三次握手：
    TCP(Transmission Control Protocol)传输控制协议
    TCP是主机对主机层的传输控制协议，提供可靠的连接服务，采用三次握手确认建立一个连接：
    位码即tcp标志位，有6种标示：SYN(synchronous建立联机) ACK(acknowledgement 确认) PSH(push传送) FIN(finish结束) RST(reset重置) URG(urgent紧急)Sequence number(顺序号码) Acknowledge number(确认号码)
    第一次握手：主机A发送位码为syn＝1，随机产生seq number=1234567的数据包到服务器，主机B由SYN=1知道，A要求建立联机；
    第二次握手：主机B收到请求后要确认联机信息，向A发送ack number=(主机A的seq+1)，syn=1，ack=1，随机产生seq=7654321的包；
    第三次握手：主机A收到后检查ack number是否正确，即第一次发送的seq number+1，以及位码ack是否为1，若正确，主机A会再发送ack number=(主机B的seq+1)，ack=1，主机B收到后确认seq值与ack=1则连接建立成功。
    完成三次握手，主机A与主机B开始传送数据。

    tsval是发送端发送这条消息的时间戳，tsecr是接收到对方消息的时间戳

[包丢失 DUP](https://blog.csdn.net/chenfengdejuanlian/article/details/53761004)

    TCP dup ack XXX#X原因分析：
    就是重复应答#前的表示报文到哪个序号丢失，#后面的是表示第几次丢失。
    tcp previous segment not captured原因分析
    意思就是报文没有捕捉到，出现报文的丢失。
