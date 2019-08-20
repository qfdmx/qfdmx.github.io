---
layout: post
title:  "shell绝技"
date:   2018-10-15 00:00:02 +0800
categories: program
tags: shell
description: linux命令行精选
---
#### 将所有输出流使用管道过滤

	rbapol  2>& 1  |grep Usage

#### 使用循环杀死多个进程

	ps -ef |grep -i drbd | awk '{print $2}'| while read line ;do  kill -9 $line ;done

#### 杀死一个文件夹下所有用户(umount提示失败情况)

	fuser -c /dev/pts/ 2>/dev/null | xargs kill -9

#### 循环去除最后一个换行符

	awk -F: '{print $2}' app/version | awk -F '' '{for(i=1;i<NF;i++){printf $i}}'|xargs

#### 将多个空格元素进行换行

	./redisTool -hgetall "runindex" | sed 's/ /\n/g ' | grep -w  WARNINGNUMLOCAL|awk -F ':|]' '{print $2}'

#### 计算一个列表文件的md5值并写入txt

	while read list ;do md5sum $list;done<extra/md5list >> extra/md5.txt

#### 打包备份程序

	crontab -l

	MAILTO=""
	50 23 * * 1-5  (cd /home/admin/ && ./backupBydate.sh )

	cat backupBydate.sh

	#!/bin/bash
	shdate=`date "+%Y%m%d-%H%M"`
	twagodate=`date -d '2 weeks ago' "+%Y%m%d"`
	delfile=`ls | grep -v "testbulid" | grep -v "grep" | grep "$twagodate" | xargs `
	#version=`cat app/version  | awk -F ':' '{print $NF}' | tail -1`
	version=`awk -F: '{print $2}' app/version | awk -F '' '{for(i=1;i<NF;i++){printf $i}}'|xargs `
	filename=app_$shdate-$version.tar.gz &&\
	tar czvf $filename app/ 	&&\
	echo "备份完成$filename"	&&\
	echo "$shdate `md5sum $filename` 备份完成" >> version_record &&\
	echo "$shdate 删除两周前的版本 $delfile" >> version_record
	rm -fv $delfile

#### tar命令排除目录打包

	所有排除文件操作不要在后面加/
	排除log及其子文件和目录
	tar czvf elasticsearch-odbc.tar.gz --exclude=elasticsearch-odbc/log elasticsearch-odbc/
	排除log下子文件和目录
	tar czvf elasticsearch-odbc.tar.gz --exclude=elasticsearch-odbc/log/* elasticsearch-odbc/

#### top

	-c 显示具体文件路径
	-b 批量刷新
	-nX 循环刷新X次
