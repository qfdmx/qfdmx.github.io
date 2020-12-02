---
layout: post
title:  "tcpip报文分析与wireshark"
date:   2020-09-27 08:00:01 +0800
categories:
tags:  tcpip wireshark
description: wireshark报文筛选
---
### tcpip报文

tcpip握手、传输、挥手

[![2020-09-27-wireshark-01.png]({{ site.baseurl }}\assets\post_image\2020\2020-09-27-wireshark-01.png)](https://qfdmx.github.io/assets/post_image/2020/2020-09-27-wireshark-01.png)

[seq、ack计算参考链接](https://blog.csdn.net/huaishu/article/details/93739446)

TCP连接的建立是通过三次握手来实现的

|序号|方向|seq|ack|SYN|ACK|
|-|-|-|-|-|-|
|1|A->B|10000(ISN)|0|1|0|
|2|A<-B|20000(ISN)|10000+1=10001|1|1
|3|A->B|10001|20000+1=20001|0|1|

解释：

    1：(A) –> [SYN] –> (B)
    A向B发起连接请求，以一个随机数初始化A的seq,这里假设为10000，此时ACK＝0
    2：(A) <– [SYN/ACK] <–(B)
    B收到A的连接请求后，也以一个随机数初始化B的seq，这里假设为20000，意思是：你的请求我已收到，我这方的数据流就从这个数开始。B的ACK是A的seq加1，即10000＋1＝10001
    3：(A) –> [ACK] –> (B)
    A收到B的回复后，它的seq是它的上个请求的seq加1，即10000＋1＝10001，意思也是：你的回复我收到了，我这方的数据流就从这个数开始。A此时的ACK是B的seq加1，即20000+1=20001

数据传输过程

|序号|方向|seq|ack|数据长度|数据包长度|
|-|-|-|-|-|-|
|23|A->B|40000|70000|1460|1514|
|24|A<-B|70000|40000+1514-54=41460|0|54|
|25|A->B|41460|70000+54-54=70000|1460|1514|
|26|A<-B|70000|41460+1514-54=42920|0|54|

解释：

    23：B接收到A发来的seq=40000,ack=70000,size=1518的数据包
    24：于是B向A也发一个数据包，告诉A，你的上个包我收到了。A的seq就以它收到的数据包的ack填充，ack是它收到的数据包的seq加上数据包的大小(不包括：以太网协议头=14字节，IP头=20字节，TCP头=20字节)，以证实B发过来的数据全收到了。
    25：A在收到B发过来的ack为41460的数据包时，一看到41460，正好是它的上个数据包的seq加上包的大小，就明白，上次发送的数据包已安全到达。于是它再发一个数据包给B。
    26：B->A这个正在发送的数据包的seq也以它收到的数据包的ack填充，ack 就以它收到的数据包的seq(70000)加上包的size(54)填充,即ack=70000+54-54(全是头长，没数据项)。通过tcpdump发现确认包ack，确认传输过程中最后字节长度。

四次挥手过程

|序号|方向|seq|ack|FIN|ACK|
|-|-|-|-|-|-|
|1|A->B|80000|90000|1|1|
|2|A<-B|90000|80000+1=80001|0|1|
|3|A<-B|90000|80001|1|1|
|4|A->B|80001|90000+1=90001|0|1|

解释：

    1：(A) –> [FIN/ACK] –> (B)
    客户端A没有要发送给服务端B的数据了，想要关闭链接，则发送一个FIN=1，ACK=1的包，告诉B可以关闭连接了，我没有什么数据要给你了。
    2：(A) <– [ACK] <– (B)
    然后B会发送ACK=1的包给A，告诉A我知道你没有什么想给我的了，但是我还有数据要给你，你先等下，我先不想FINISH呢。
    3：(A) <– [FIN/ACK] <– (B)
    等B把数据都发送给A之后，B会再次发送一个包，这次FIN=1，表示我这边也想关闭了，咱俩一起关把。在2和3之间，可能还会有很多B->A的传递，ack均为80001。
    4：(A) –> [ACK] –> (B)
    然后A回应一个ACK，表示我知道了，一起关吧。B收到这个ACK后，就会CLOSE。但是实际上A不会直接CLOSE，还会进入一个等待时间状态TIME_WAIT，持续2倍的MSL（Maximum Segment Lifetime，报文段在网络上能存活的最大时间）。过了这个状态，才会CLOSE。


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

    tsval是发送端发送这条消息的时间戳，tsecr是接收到对方消息的时间戳

#### 数据传输分析

实际过程中的数据交换多是数据传输，所以针对实际数据传输的截图如下

[![2020-09-27-wireshark-01.png]({{ site.baseurl }}\assets\post_image\2020\2020-09-27-wireshark-01.png)](https://qfdmx.github.io/assets/post_image/2020/2020-09-27-wireshark-01.png)

    seq=ack(-1) #即为该服务器接收对端的ack的值，图示绿色部分
    ack=seq(-1)+len(-1) #即为该服务器接收对端的seq+len的值，图示红色部分
    当为蓝色出现即seq数据少了1证明有丢包现象，所以后面又重新进行了补发（wireshark中黑色是坏的部分）

[包丢失 DUP](https://blog.csdn.net/chenfengdejuanlian/article/details/53761004)

    TCP dup ack XXX#X原因分析：
    就是重复应答#前的表示报文到哪个序号丢失，#后面的是表示第几次丢失。
    tcp previous segment not captured原因分析
    意思就是报文没有捕捉到，出现报文的丢失。

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
