---
layout: post
title:  "linux cmd"
date:   2019-11-19 09:00:01 +0800
categories: opeartion_system
tags: linux
description: linux命令积累
---
#### shell内建命令

jobs,bg,fg

    jobs
    `-l：显示进程号；`
    -p：仅任务对应的显示进程号；
    -n：显示任务状态的变化；
    -r：仅输出运行状态（running）的任务；
    -s：仅输出停止状态（stoped）的任务。

    fg
    fg 任务号
    fg %任务号

    bg
    bg 任务号
    bg %任务号

    实例
    使用 sleep 10000 & 后
    查看任务jobs -l
    将后台任务调到前台执行 fg 1
    挂起当前任务  ctrl+z (等同于kill -19 %任务号)
    查看任务jobs -l
    将后台任务继续执行 bg 1

kill

    `-l  信号，若果不加信号的编号参数，则使用“-l”参数会列出全部的信号名称(42种)`
    -a  当处理当前进程时，不限制命令名和进程号的对应关系
    -p  指定kill 命令只打印相关进程的进程号，而不发送任何信号
    -s  指定发送信号
    `-u  指定用户`

    HUP     1    终端断线
    INT     2    中断（同 Ctrl + C）
    QUIT    3    退出（同 Ctrl + \\）
    TERM    15   终止
    KILL    9    强制终止
    CONT    18   继续（与STOP相反， fg/bg命令）
    STOP    19   暂停（同 Ctrl + Z）

#### 文件管理

cp

    -a：此参数的效果和同时指定"-dpR"参数相同；
    -d：当复制符号连接时，把目标文件或目录也建立为符号连接，并指向与源文件或目录连接的原始文件或目录；
    -f：强行复制文件或目录，不论目标文件或目录是否已存在；
    -i：覆盖既有文件之前先询问用户；
    -l：对源文件建立硬连接，而非复制文件；
    -p：保留源文件或目录的属性；
    -R/r：递归处理，将指定目录下的所有文件与子目录一并处理；
    -s：对源文件建立符号连接，而非复制文件；
    -u：使用这项参数后只会在源文件的更改时间较目标文件更新时或是名称相互对应的目标文件并不存在时，才复制文件；
    -S：在备份文件时，用指定的后缀“SUFFIX”代替文件的默认后缀；
    -b：覆盖已存在的文件目标前将目标文件备份；
    -v：详细显示命令执行的操作。

cat

    -n或-number：有1开始对所有输出的行数编号；
    -b或--number-nonblank：和-n相似，只不过对于空白行不编号；
    -s或--squeeze-blank：当遇到有连续两行以上的空白行，就代换为一行的空白行；
    -A：显示不可打印字符，行尾显示“$”；
    -e：等价于"-vE"选项；
    -t：等价于"-vT"选项；

    -nbs三个参数用于输出编号和空格展示
    -e参数在"syntax error"时候用于查看不支持的字符，如windows换行符在linux下不支持，使用-A参数可以看到shell脚本的结尾"$",但是异常字符需要使用-e进行打印
    -t会将tab转换为^I,同时转换中文字符等

chattr

    文件属性
    a：让文件或目录仅供附加用途；(适用于各种日志)
    b：不更新文件或目录的最后存取时间；
    c：将文件或目录压缩后存放；
    d：将文件或目录排除在倾倒操作之外；
    i：不得任意更动文件或目录；(适用于重要文件)
    s：保密性删除文件或目录；
    S：即时更新文件或目录；
    u：预防意外删除。

    选项
    -R：递归处理，将指令目录下的所有文件及子目录一并处理；
    +<属性>：开启文件或目录的该项属性；
    -<属性>：关闭文件或目录的该项属性；
    =<属性>：指定文件或目录的该项属性。
    -v<版本编号>：设置文件或目录版本；
    -V：显示指令执行过程；

    # chattr +a logfile
    # chattr +i merging.py
    # lsattr
    -------------e-- ./sendlist.tar.gz
    ----i--------e-- ./merging.py
    -----a-------e-- ./logfile
    -------------e-- ./sendlist

chmod

    u User，即文件或目录的拥有者；
    g Group，即文件或目录的所属群组；
    o Other，除了文件或目录拥有者或所属群组之外，其他用户皆属于这个范围；
    a All，即全部的用户，包含拥有者，所属群组以及其他用户；
    r 读取权限，数字代号为“4”;
    w 写入权限，数字代号为“2”；
    x 执行或切换权限，数字代号为“1”；
    - 不具任何权限，数字代号为“0”；
    s 特殊功能说明：变更文件或目录的权限。

    -c或——changes：效果类似“-v”参数，但仅回报更改的部分；
    -f或--quiet或——silent：不显示错误信息；
    -R或——recursive：递归处理，将指令目录下的所有文件及子目录一并处理；
    -v或——verbose：显示指令执行过程；
    --reference=<参考文件或目录>：把指定文件或目录的所属群组全部设成和参考文件或目录的所属群组相同；
    <权限范围>+<权限设置>：开启权限范围的文件或目录的该选项权限设置；

    chmod u+x,g+w f01　　//为文件f01设置自己可以执行，组员可以写入的权限
    chmod u=rwx,g=rw,o=r f01
    chmod 764 f01
    chmod a+x f01　　//对文件f01的u,g,o都设置可执行属性

find

    -iname<范本样式>：此参数的效果和指定“-name”参数类似，但忽略字符大小写的差别；
    -o:同时查询
    -inum<inode编号>：查找符合指定的inode编号的文件或目录；
    -exec<执行指令>：假设find指令的回传值为True，就执行该指令；
    find . -type 类型参数
      f 普通文件
      l 符号连接
      d 目录
      c 字符设备
      b 块设备
      s 套接字
      p Fifo

    在/home目录下查找以.txt结尾的文件名
    find /home -name "*.txt"
    同上，但忽略大小写
    find /home -iname "*.txt"
    当前目录及子目录下查找所有以.txt和.pdf结尾的文件
    find . -name "*.txt" -o -name "*.pdf"
    当出现乱码的情况可以使用node改名字
    ls -ali
    find -inum node -exec mv {} 123.txt \;

    匹配文件路径或者文件
    find /usr/ -path "*local*"
    基于正则表达式匹配文件路径
    find . -regex ".*\(\.txt\|\.pdf\)$"
    同上，但忽略大小写

    find . -iregex ".*\(\.txt\|\.pdf\)$"

    find . -name -f




cksum

    文件值校验类似于md5sum
    sksum testfile1

cpm

    -c或--print-chars：除了标明差异处的十进制字码之外，一并显示该字符所对应字符；
    -i<字符数目>或--ignore-initial=<字符数目>：指定一个数目；
    -l或——verbose：标示出所有不一样的地方；
    -s或--quiet或——silent：不显示错误信息；
    -v或——version：显示版本信息；
    --help：在线帮助。

    cmp testfile testfile1            #比较两个指定的文件


  tar

    -A或--catenate：新增文件到以存在的备份文件；
    -B：设置区块大小；
    -c或--create：建立新的备份文件；
    -C <目录>：这个选项用在解压缩，若要在特定目录解压缩，可以使用这个选项。
    -d：记录文件的差别；
    -x或--extract或--get：从备份文件中还原文件；
    -t或--list：列出备份文件的内容；
    -z或--gzip或--ungzip：通过gzip指令处理备份文件；
    -Z或--compress或--uncompress：通过compress指令处理备份文件；
    -f<备份文件>或--file=<备份文件>：指定备份文件；
    -v或--verbose：显示指令执行过程；
    -r：添加文件到已经压缩的文件；
    -u：添加改变了和现有的文件到已经存在的压缩文件；
    -j：支持bzip2解压文件；
    -v：显示操作过程；
    -l：文件系统边界设置；
    -k：保留原有文件不覆盖；
    -m：保留文件不被覆盖；
    -w：确认压缩文件的正确性；
    -p或--same-permissions：用原来的文件权限还原文件；
    -P或--absolute-names：文件名使用绝对名称，不移除文件名称前的“/”号；
    -N <日期格式> 或 --newer=<日期时间>：只将较指定日期更新的文件保存到备份文件里；
    --exclude=<范本样式>：排除符合范本样式的文件。

    tar czvf scf.tar.gz scf/*
    tar tzvf scf.tar.gz
    tar xvf scf.tar.gz       #防止因为j或者z导致的属性不匹配解压失败
    tar xzvf scf.tar.gz
    tar --exclude scf/service -zcvf scf.tar.gz scf/*

#### 系统管理

  ps

    -A：显示所有程序
    -e：此选项的效果和指定"A"选项相同
    -f：显示UID,PPIP,C与STIME栏位
    a：显示现行终端机下的所有程序，包括其他用户的程序
    u：以用户为主的格式来显示程序状况
    x：显示所有程序，不以终端机来区分

    -o 或者 -0 指定格式输出
    STANDARD FORMAT SPECIFIERS（标准输出格式也有BSD和AIX格式，以下仅为部分）
    CODE        HEADER    DESCRIPTION
    cmd         CMD       see args.  (alias args, command).
    cputime     TIME      cumulative CPU time, "[DD-]hh:mm:ss" format.  (alias time).
    etime       ELAPSED   elapsed time since the process was started, in the form [[DD-]hh:]mm:ss.
    etimes      ELAPSED   elapsed time since the process was started, in seconds.
    lstart      STARTED   time the command started.  See also bsdstart, start, start_time, and stime.
    pid         PID       a number representing the process ID (alias tgid).
    start       STARTED   time the command started.  If the process was started less than 24 hours ago, the output format is "HH:MM:SS"

    常用参数举例
    ps -ef
    ps aux
    ps -eo pid,rsz,vsz,lstart,etime,cmd

   date

    ##格式化输出
    date "+%Y-%m-%d %H:%M:%S"
    date -d "20200216 23:59:59" "+%Y-%m-%d %H:%M:%S"
    ##指定时间至1970初始时间到秒的双向转换
    date +%s
    date -d "2020-02-16 23:59:59" +%s
    date -d @1581868799  "+%Y-%m-%d %H:%M:%S"

### strace

    strace ls
