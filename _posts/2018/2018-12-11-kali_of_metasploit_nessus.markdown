---
layout: post
title:  "kali系统中metasploi配置与Nessus配置"
date:   2018-12-11 00:00:02 +0800
categories: kali
tags: 渗透测试 metasploitable kali Nessus
description: kali系统自带metasploit，Nessus需要自行安装，本文以更新维护metasploit和Nessus为主，工欲善其事必先利其器。
---
### 简介

本文使用kali2018.4版本(kali-linux-2018.4-amd64.iso)和Nessus8.1.0(Nessus-8.1.0-debian6_amd64.deb)，建议直接从官网上下载速度也不会慢，关于Nessus版本选择，kali系统由Ubuntu改为debian(cat /proc/version)。目录如下：

	Nessus安装
	msfconsole search加速

### Nessus安装

	dpkg -i Nessus-8.1.0-debian6_amd64.deb		#下载后，安装deb包
	/etc/init.d/nessusd start		#启动Nessus
	https://ip:8834/		#网页访问Nessus，注册登录更新

### Nessus Plugins首次安装失败重装

	nessus Linux版本默认安装位置为/opt下面
	cd /opt/nessus/sbin
	./nessuscli update --all		#首次安装失败后重装
	./nessuscli update --plugins-only		#只更新plugins

### msfconsole search加速

[参考链接](https://www.jianshu.com/p/a9037db3ed5c)

search过程中经常遇到"Module database cache not built yet, using slow search"提示，依次运行下面几条命令就行了。

	systemctl start postgresql		#启动数据库
	systemctl enable postgresql		#数据库开机自启
	msfdb init		#数据库初始化port 5432
	msfconsole		#进入msf
	db_rebuild_cache		#进入后，进行数据库缓存，等待几分钟后完成
