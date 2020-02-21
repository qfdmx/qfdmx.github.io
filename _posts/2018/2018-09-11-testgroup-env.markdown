---
layout: post
title:  "测试环境搭建"
date:   2018-09-11 00:00:01 +0800
categories: software_test
tags: kvm smba wiki zentao
description: kvm+smba+wiki+zentao
---
### 一、网络服务配置

### 1.静态地址配置

	vi  /etc/sysconfig/network-scripts/ifcfg-eno49
	-----------------------------------------
	IPADDR=192.168.25.250
	GATEWAY=192.168.25.93
	DNS1=192.168.25.93
	-----------------------------------------
	/etc/init.d/network restart
	ifconfig

### 2.使用笔记本连接外网

[参考链接](https://jingyan.baidu.com/article/0eb457e53dcc9e03f1a9058c.html)

功能简述：笔记本使用无线网卡连接外网，然后将此网络通过以太网卡共享给本地服务器

1.在无线网卡的适配器上进行网络共享

2.在以太网网卡上进行ip修改(共享后可能重置网络为192.168.137.1)

3,配置服务器网关和DNS

	vi  /etc/sysconfig/network-scripts/ifcfg-eno49
	-----------------------------------------
	GATEWAY=192.168.25.93
	DNS1=192.168.25.93
	-----------------------------------------
	/etc/init.d/network restart

4.网络连接测试及维护

ping www.baidu.com 能通即可
当出现不能上网情况，请卸载windows无线网卡和以太网卡，重新配置即可

3.ssh连接变慢问题

[参考链接](https://blog.csdn.net/qq_14821541/article/details/61915589)

关闭ssh服务DNS反馈（ssh登录速度慢的问题）

	vi/etc/ssh/sshd_config
	---------------------------------
	UseDNS no
	----------------------------------
	systemctl restart sshd

### 二、配置yum源

### 1.配置本地yum源

[参考链接](https://www.linuxidc.com/Linux/2017-08/146364.htm)

* 加载 CentOS的ISO镜像并挂载：


	mkdir /media/CentOS
	mount /opt/CentOS-7-x86_64-DVD-1611.iso /media/CentOS/

* 修改yum配置文件：


	vi /etc/yum.repos.d/CentOS-Media.repo
	---------------------------------------------------------------------
	[c7-media]
	name=CentOS-$releasever - Media
	baseurl=file:///media/CentOS/      -->这一行改成前边我们新建的CentOS目录
	#        file:///media/cdrom/            -->这一行加#号注释掉
	#        file:///media/cdrecorder/    -->这一行加#号注释掉
	gpgcheck=1
	enabled=1                                  -->这一行把0改成1来启用源
	gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
	------------------------------------------------------------------------

* 暂时关闭mirror源，建立本地yum缓存


	mv CentOS-Base.repo CentOS-Base.repo_bk
	yum clean all
	yum makecache

* 设置开机加载镜像


	vi /etc/rc.local
	---------------------------------------------------------
	mount /opt/CentOS-7-x86_64-DVD-1611.iso /media/CentOS/
	---------------------------------------------------------

### 2.配置网络镜像（mirror）源

配置网络镜像源以USTC mirror为最佳，需要保证可以使用外网才能配置网络yum源

进入[USTC官网](http://mirrors.ustc.edu.cn/help/centos.html)
将centos7的mirror的配置粘贴到/etc/yum.repos.d/CentOS-Base.repo中

	vi /etc/yum.repos.d/CentOS-Base.repo

然后修改yum配置文件保留本地缓存配置

	vi /etc/yum.conf
	-----------------
	keepcache=1

建立yum缓存

	yum makecache

### 3.配置epel源和ntfs支持

阿里云elep

	wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
	yum makecache

以下为了安装php所用

	yum install epel-release
	rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

安装ntfs和vim

	yum install ntfs-3g
	yum install vim

以下仅作保留不要进行执行：

yum install epel-release

https://webtatic.com/packages/php56/
https://blog.csdn.net/langeldep/article/details/79677109
https://www.cnblogs.com/gy1010/p/5787137.html

### 三、网络虚拟化与kvm虚拟机安装

#### 1.支持虚拟化配置校验

	cat /proc/cpuinfo | egrep 'vmx|svm'

#### 2.虚拟化网卡

功能简述：配置虚拟网卡br0桥接到当前网卡

添加br0网卡

	cp -v /etc/sysconfig/network-scripts/ifcfg-eno49 /etc/sysconfig/network-scripts/ifcfg-br0
	vi /etc/sysconfig/network-scripts/ifcfg-br0
	-----------------------------------
	DEVICE=br0
	ONBOOT=yes
	TYPE=Bridge
	BOOTPROTO=static
	IPADDR=192.168.25.250
	NETMASK=255.255.255.0
	NETWORK=192.168.25.0
	GATEWAY=192.168.25.93
	DNS1=192.168.25.93
	DEFROUTE=yes
	-----------------------------------

编辑以太网卡

	vi /etc/sysconfig/network-scripts/ifcfg-eno49
	-----------------------------------------
	TYPE=Ethernet
	NM_CONTROLLED=no
	BOOTPROTO=none
	NAME=eno49
	DEVICE=eno49
	ONBOOT=yes
	BRIDGE=br0
	#HWADDR=
	-------------------------------------

重启网络并查看网卡

	systemctl restart network
	ifconfig

此时br0虚拟网卡上显示ip地址而eno49无ip配置

	br0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
	        inet 192.168.25.250  netmask 255.255.255.0  broadcast 192.168.25.255
	        inet6 fe80::4adf:37ff:fe15:20a0  prefixlen 64  scopeid 0x20<link>
	        ether 48:df:37:15:20:a0  txqueuelen 1000  (Ethernet)
	        RX packets 151  bytes 13302 (12.9 KiB)
	        RX errors 0  dropped 0  overruns 0  frame 0
	        TX packets 134  bytes 18654 (18.2 KiB)
	        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

	eno49: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
	        inet6 fe80::4adf:37ff:fe15:20a0  prefixlen 64  scopeid 0x20<link>
	        ether 48:df:37:15:20:a0  txqueuelen 1000  (Ethernet)
	        RX packets 44359528  bytes 63466221275 (59.1 GiB)
	        RX errors 0  dropped 4  overruns 0  frame 0
	        TX packets 4541819  bytes 456117131 (434.9 MiB)
	        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
	        device memory 0x92f00000-92ffffff

#### 3.kvm虚拟机安装

`不要使用ustc源安装高版本virt-manager有bug`

直接使用aili云epel源virt-manager-1.4.0可以使用，然后重装virt-viewer即可[参考链接](https://blog.csdn.net/github_27924183/article/details/76914322?utm_source=copy )

	# 安装 kvm 基础包
	# ------------------------
	yum -y install kvm

	# 安装 kvm 管理工具
	# ------------------------
	yum -y install qemu-kvm python-virtinst libvirt libvirt-python virt-manager libguestfs-tools bridge-utils virt-install

	# qemu-kvm: KVM模块

	# pyhon-virtinst: 包含python模块和工具（virt-install，virt-clone和virt-image），
	# 用于安装和克隆虚拟机使用libvirt。 它完全支持paravirtulized客人和客人虚拟客人。
	# 支持的虚拟机管理程序是Xen，qemu（QEMU）和kvm

	# libvirt: 虚拟管理模块
	# virt-manager: 图形界面管理虚拟机
	# libguestfs* : virt-cat等命令的支持软件包


	# 重启宿主机，以便加载 kvm 模块
	# ------------------------
	reboot

	# 查看KVM模块是否被正确加载
	# ------------------------
	lsmod | grep kvm

	kvm_intel             162153  0
	kvm                   525259  1 kvm_intel
	---------------------

#### 4.图形界面安装配置虚拟机


* 使用vnc连接登录centos7（见七远程centos7）


* 安装虚拟机

#### 5. 虚拟机快照

关于虚拟机快照，目前图形virt-manager问题，只支持关闭虚拟机情况下保存快照

#### 6.虚拟机相关FAQ

Q：鼠标偏移问题、键盘失灵？

A：vnc或者其他类型远程桌面，请不要设置多种鼠标和键盘类型会导致鼠标和键盘问题。默认使用p/2类型即可。然后在虚拟机关闭的情况下添加input设备，重启即可

Q：使用virsh（非图形安装）出现鼠标键盘偏移问题

A：

	1)关闭虚机
	# virsh  shutdown  vm1
	2)编辑虚机配置文件
	# virsh edit vm1
	在<devices>标签内，插入一行
	<input type='tablet' bus='usb'/>
	保存退出
	3)启动虚机
	# virsh  start  vm1

### 四、smb服务部署

[参考链接](https://www.linuxidc.com/Linux/2018-01/150448.htm)

1.smb服务命令

	systemctl start smb
	systemctl status smb
	systemctl stop smb

	systemctl disable firewalld
	systemctl stop firewalld

2.添加用户修改组权限

	useradd  admin  -G  root
	smbpasswd -a admin
	pdbedit -L

	chown nobody:nobody shared/
	chown -R nobody:nobody shared/
	chmod -R 777 shared/

3.修改配置文件

	vi /etc/samba/smb.conf
	----------------------------------------
	[public]
		comment = Public Stuff
		path = /shared/public
		public = yes
		writable = no
		printable = no
		write list = +staff

	[admin]
	    # 共享文件目录描述
	    comment = Shared Directories
	    # 共享文件目录
	    path = /shared/admin
	    # 是否允许guest访问
	    public = yes
	    # 指定管理用户
	    admin users = admin
	    # 可访问的用户组、用户
	    valid users = @admin
	    # 是否浏览权限
	    browseable = yes
	    # 是否可写权限
	    writable = yes
	    # 文件权限设置
	    create mask = 0777
	    directory mask = 0777
	    force directory mode = 0777
	    force create mode = 0777
	-----------------------------------------

4.windows登录

`win+R`呼出运行输入\\\192.168.25.250\admin

### 五、media wiki安装使用说明

### 1.安装

为安装php55w做mirror准备

	yum install epel-release
	rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm


	yum install httpd php55w php55w-mysql php55w-gd php55w-xml mariadb-server mariadb php55w-mbstring


启动数据库和httpd

	systemctl enable mariadb
	systemctl enable httpd

	systemctl start mariadb
	systemctl start httpd

	mysql_secure_installation设置密码

配置数据库

	mysql -u root -p
	CREATE USER 'wiki'@'localhost' IDENTIFIED BY 'THISpasswordSHOULDbeCHANGED';
	CREATE DATABASE wikidatabase;
	GRANT ALL PRIVILEGES ON wikidatabase.* TO 'wiki'@'localhost';
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
	FLUSH PRIVILEGES;

	SHOW DATABASES;
	SHOW GRANTS FOR 'wiki'@'localhost';
	exit

安装wiki

	cd /var/www/
	tar -xzvf /shared/public/mediawiki-1.27.4.tar.gz
	ln -s mediawiki-1.27.4/ mediawiki

	vi /etc/httpd/conf/httpd.conf
	------------------------------------------------------------------------------
	DocumentRoot "/var/www"
	<Directory "/var/www">     <-- this is the SECOND "<Directory" entry, not the 'root' one
	DirectoryIndex index.html index.html.var index.php
	-------------------------------------------------------------------------------

	systemctl restart httpd

### 2.配置

登录wiki进行首次配置
http://192.168.25.250/mediawiki/

admin/\*admin123

将配置完的生成LocalSettings.php放入/var/www/mediawiki中

登录地址
http://192.168.25.250/mediawiki/index.php/首页

### 3.mediawiki使用

https://www.cnblogs.com/ycyoes/p/5482805.html
http://dreamfromars.blog.sohu.com/246299854.html

搜索MediaWiki:Sidebar然后修改侧边栏
http://120.25.171.202:12306/zentao

### 六、禅道

安装启动

	tar xzvf zbox_20180908.tar.gz
	/opt/zbox/zbox start

### 七、centos7远程服务

### vnc

* vnc安装


	yum install tigervnc  tigervnc-server
	-----------------------------
	fltk-1.3.0-13.el7.x86_64                   
	tigervnc-1.3.1-9.el7.x86_64
	tigervnc-icons-1.3.1-9.el7.noarch
	tigervnc-server.x86_64 0:1.3.1-9.el7

* windows端安装tigerVNC

* vnc连接

1.服务器端192.168.25.250启动vncsever

	vncserver			#启动vncserver服务
	vncserver -list			#产看启动列表
	------------------------------
	TigerVNC server sessions:

	X DISPLAY #	PROCESS ID
	:2		21647


2.windows连接vncserver远程centos7

启动tiger vncviewer

输入192.168.25.250:2

密码123456

按F8呼出菜单可以全屏（推荐vnc全屏，不推荐虚拟全屏）


3.重启vncserver

	vncserver -list
	vncserver -kill :2
	vncserver

### xmanager

由于centos7.2问题，xmanger连接出错
