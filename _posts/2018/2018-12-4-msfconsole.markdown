---
layout: post
title:  "msfconsole"
date:   2018-10-15 00:00:01 +0800
categories: linux
tags: msfconsole
description: ssh遇到问题集合
---
3.1	Vsftp 2.3.4 版本
Module：exploit/unix/ftp/vsftpd_234_backdoor
Payload：cmd/unix/interact

3.2	Web服务（80端口）


输入参数：

3.3	Php CGI注入
Module：exploit/multi/http/php_cgi_arg_injection
Payload：php/meterpreter/bind_tcp

3.4	SMB目录共享
139端口，445端口这两个都是smb类型的，是共享服务，首选我们需要知道它的共享目录有哪些
Module：auxiliary/scanner/smb/smb_enumusers

Module：auxiliary/admin/smb/samba_symlink_traversal



3.5	Msfable后门

3.6	JAVA反序列化

3.7	Distccd服务远程命令
Module：exploit/unix/misc/distcc_exec
Payload：cmd/unix/bind_perl

3.8	Postgresql弱密码

3.9	VNC服务

3.10	IRC服务

3.11	Tomcat服务

3.12	Drb服务
Module：exploit/linux/misc/drb_remote_codeexec
Payload：cmd/unix/bind_perl
