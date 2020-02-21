---
layout: post
title:  "网络命令"
date:   2020-02-21 08:00:01 +0800
categories: network
tags: cli
description: 网络常用命令nc
---
### nc

[参考链接](https://www.cnblogs.com/xiangtingshen/p/10909077.html)

nc是netcat的简写，有着网络界的瑞士军刀美誉。因为它短小精悍、功能实用，被设计为一个简单、可靠的网络工具。常用功能如下

    #nc参数如下
    1) -l
    用于指定nc进行端口监听并接受连接，被当作server，而非向其它地址发起连接。
    2) -p <port>
    暂未用到（老版本的nc可能需要在端口号前加-p参数，下面测试环境是centos6.6，nc版本是nc-1.84，未用到-p参数）
    3) -s
    指定发送数据的源IP地址，适用于多网卡机
    4) -u
     指定nc使用UDP协议，默认为TCP
    5) -v
    输出交互或出错信息，有的版本是打印版本号
    6）-w
    超时秒数，后面跟数字
    7）-z
    表示zero，表示扫描时不发送任何数据

#### 1.网络连通性测试和端口扫描

    #被访问主机启动端口监听
    nc -l 8888
    #访问主机发起连接
    nc 192.168.5.100 8888

#### 2.文件传输和目录

    ##单个文件传输如下
    #先启动监听端口接收文件
    nc -l 5555 >file
    #访问的主机发送文件
    nc 192.168.5.100 5555 < zabbix.rpm
    ##目录及多个文件传输如下
    nc -l 5555 | tar xvfz -
    tar czvf - * | nc 192.168.5.100 5555

#### 3.测试网速

    #需要安装dstat
    yum install -y dstat
    #一台机器给另一台机器发送无线个0
    nc -l 9999 > /dev/null
    nc 192.168.5.100 9999 </dev/zero

### dstat网速计算
