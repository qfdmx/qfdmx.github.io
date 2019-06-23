---
layout: post
title:  "metasploitable2练习"
date:   2018-10-22 00:00:02 +0800
categories: 安全测试
tags: metasploitable kali
description: 使用kali工具练习metasploitable2
---

### 练习准备

metasploitable2的vmvare虚拟机系统、kali虚拟机系统

### metasploitable修改密码与网络配置

[参考链接](https://zerlong.com/426.html)

metasploitable2众所周知的账户密码为msfadmin，使用此账户密码登录后可以使用sudo权限

	sudo passwd
	ifconfig eth0 192.168.0.99


### 使用nmap和msf进行评估

[参考链接1](https://www.cnblogs.com/yuleitest/articles/8393202.html)

[参考链接2](http://www.freebuf.com/articles/system/34571.html)

	msfconsole
