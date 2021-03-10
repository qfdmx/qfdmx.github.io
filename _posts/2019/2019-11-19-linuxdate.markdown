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
    QUIT    3    退出（同 Ctrl + \）
    TERM    15   终止
    KILL    9    强制终止
    CONT    18   继续（与STOP相反， fg/bg命令）
    STOP    19   暂停（同 Ctrl + Z）

    init进程不可杀

pkill

    Linux pkill 用于杀死一个进程，与 kill 不同的是它会杀死指定名字的所有进程，类似于 killall 命令。
    kill 命令杀死指定进程 PID，需要配合 ps 使用，而 pkill 直接对进程对名字进行操作，更加方便。

    -<sig>, --signal <sig>    signal to send (either number or name)
    -e, --echo                display what is killed
    -c, --count               count of matching processes
    -f, --full                use full process name to match
    -g, --pgroup <PGID,...>   match listed process group IDs
    -G, --group <GID,...>     match real group IDs
    -i, --ignore-case         match case insensitively
    -n, --newest              select most recently started
    -o, --oldest              select least recently started
    -P, --parent <PPID,...>   match only child processes of the given parent
    -s, --session <SID,...>   match session IDs
    -t, --terminal <tty,...>  match by controlling terminal
    -u, --euid <ID,...>       match by effective IDs
    -U, --uid <ID,...>        match by real IDs
    -x, --exact               match exactly with the command name
    -F, --pidfile <file>      read PIDs from file
    -L, --logpidfile          fail if PID file is not locked
    --ns <PID>                match the processes that belong to the same

    pkill -9  php-fpm          //结束所有的 php-fpm 进程

seq

    seq [选项]... 尾数
    seq [选项]... 首数 尾数
    seq [选项]... 首数 增量 尾数

    -f, --format=格式        使用printf 样式的浮点格式
    -s, --separator=字符串   使用指定字符串分隔数字（默认使用：\n）
    -w, --equal-width        在列前添加0 使得宽度相同

    sed -f"%03g" 9 11
    seq -f"str%03g" 9 11
    seq -w 98 101
    seq -s" " -f"str%03g" 9 11
    seq -s"`echo -e "/t"`" 9 11  #9到11用/t分隔
    seq -s"`echo -e "\n"`" 9 11  #1到11用9分隔

vmstat

    -a, --active           active/inactive memory
    -f, --forks            number of forks since boot
    -m, --slabs            slabinfo
    -n, --one-header       do not redisplay header
    -s, --stats            event counter statistics
    -d, --disk             disk statistics
    -D, --disk-sum         summarize disk statistics
    -p, --partition <dev>  partition specific statistics
    -S, --unit <char>      define display unit
    -w, --wide             wide output
    -t, --timestamp        show timestamp

    vmstat -t -S m 1

export

    -f：代表[变量名称]中为函数名称；
    -n：删除指定的变量。变量实际上并未删除，只是不会输出到后续指令的执行环境中；
    -p：列出所有的shell赋予程序的环境变量。

ulimit

    [root@localhost ~]# ulimit -a  #显示目前资源限制的设定；                                    
    core file size          (blocks, -c) 0           #core文件的最大值为100 blocks。
    data seg size           (kbytes, -d) unlimited   #进程的数据段可以任意大。
    scheduling priority             (-e) 0
    file size               (blocks, -f) unlimited   #文件可以任意大。
    pending signals                 (-i) 98304       #最多有98304个待处理的信号。
    max locked memory       (kbytes, -l) 32          #一个任务锁住的物理内存的最大值为32KB。
    max memory size         (kbytes, -m) unlimited   #一个任务的常驻物理内存的最大值。
    open files                      (-n) 1024        #一个任务最多可以同时打开1024的文件。
    pipe size            (512 bytes, -p) 8           #管道的最大空间为4096字节。
    POSIX message queues     (bytes, -q) 819200      #POSIX的消息队列的最大值为819200字节。
    real-time priority              (-r) 0
    stack size              (kbytes, -s) 10240       #进程的栈的最大值为10240字节。
    cpu time               (seconds, -t) unlimited   #进程使用的CPU时间。
    max user processes              (-u) 98304       #当前用户同时打开的进程（包括线程）的最大个数为98304。
    virtual memory          (kbytes, -v) unlimited   #没有限制进程的最大地址空间。
    file locks                      (-x) unlimited   #所能锁住的文件的最大个数没有限制。


pstree

    -a：显示每个程序的完整指令，包含路径，参数或是常驻服务的标示；
    -c：不使用精简标示法；
    -G：使用VT100终端机的列绘图字符；
    -h：列出树状图时，特别标明现在执行的程序；
    -H<程序识别码>：此参数的效果和指定"-h"参数类似，但特别标明指定的程序；
    -l：采用长列格式显示树状图；
    -n：用程序识别码排序。预设是以程序名称来排序；
    -p：显示程序识别码；
    -u：显示用户名称；
    -U：使用UTF-8列绘图字符；
    -V：显示版本信息。

shopt

    使用shopt命令显示当前所有可以设置的shell操作选项
    -s：激活指定的shell行为选项；
    -u：关闭指定的shell行为选项。
    shopt -s cdspell
    cdspell on

let

    自加操作let no++
    自减操作let no--
    简写形式let no+=10，let no-=20，分别等同于let no=no+10，let no=no-20

    let a=5+4 b=9-3
    echo $a $b

bind

    -d：显示按键配置的内容；
    -f<按键配置文件>：载入指定的按键配置文件；
    -l：列出所有的功能；
    -m<按键配置>：指定按键配置；
    -q<功能>：显示指定功能的按键；
    -v：列出目前的按键配置与其功能。

    bind -x '"\C-l":ls -l'    #直接按 CTRL+L 就列出目录

    showkey -a

tput

    tput clear # 清屏
    tput sc # 保存当前光标位置
    tput cup 10 13 # 将光标移动到 row col
    tput civis # 光标不可见
    tput cnorm # 光标可见
    tput rc # 显示输出
    exit 0

    tput sc ; tput cup 23 45

    tput setb 6 && tput setf 1
    0：黑色
    1：蓝色
    2：绿色
    3：青色
    4：红色
    5：洋红色
    6：黄色
    7：白色

    要将文本更改为粗体，请使用 bold 选项。要开始添加下划线，请使用 smul 选项。在完成显示带下划线的文本后，请使用 rmul 选项

    tput setb 6 && tput setf 1 && tput bold && tput smul

#### 文件管理
tput

tput clear # 清屏
tput sc # 保存当前光标位置
tput cup 10 13 # 将光标移动到 row col
tput civis # 光标不可见
tput cnorm # 光标可见
tput rc # 显示输出
exit 0

tput sc ; tput cup 23 45

tput setb 6 && tput setf 1
0：黑色
1：蓝色
2：绿色
3：青色
4：红色
5：洋红色
6：黄色
7：白色
tput setb 6 && tput setf 1 && tput bold && tput smul
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
    chmod 0777 file
    chmod 1777 file
    chmod 2777 file
    chmod 3777 file
    chmod 4777 file
    chmod 5777 file
    chmod 6777 file
    chmod 7777 file

    其他权限：除了读写执行权限外系统还支持强制位（s权限）和粘滞位（t权限）

    s权限： 设置使文件在执行阶段具有文件所有者的权限，相当于临时拥有文件所有者的身份. 典型的文件是passwd. 如果一般用户执行该文件, 则在执行过程中, 该文件可以获得root权限, 从而可以更改用户的密码.
    我们可以通过字符模式设置s权限：chmod a+s filename，也可以使用绝对模式进行设置
    注意：在设置s权限时文件属主、属组必须先设置相应的x权限，否则s权限并不能正真生效（c h m o d命令不进行必要的完整性检查，即使不设置x权限就设置s权限，chmod也不会报错，当我们ls -l时看到rwS，大写S说明s权限未生效）

    t权限：黏着位 t  解读(针对others设置，可以实现文件夹共享)，要删除一个文档，您不一定要有这个文档的写权限，但您一定要有这个文档的上级目录的写权限。也就是说，您即使没有一个文档的写权限，但您有这个文档的上级目录的写权限，您 也能够把这个文档给删除，而假如没有一个目录的写权限，也就不能在这个目录下创建文档。
    怎样才能使一个目录既能够让任何用户写入文档，又不让用户删除这个目录下他人的文档，t权限就是能起到这个作用。t权限一般只用在目录上，用在文档上起不到什么作用。
    在一个目录上设了t权限位后，（如/home，权限为1777)任何的用户都能够在这个目录下创建文档，但只能删除自己创建的文档(root除外)，这就对任何用户能写的目录下的用户文档 启到了保护的作用。
    可以通过chmod +t filename 来设置t权限

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

    cpm testfile testfile1            #比较两个指定的文件


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

split

    split命令可以将一个大文件分割成很多个小文件，有时需要将文件分割成更小的片段，比如为提高可读性，生成日志等。

    -b：值为每一输出档案的大小，单位为 byte。
    -C：每一输出档中，单行的最大 byte 数。
    -d：使用数字作为后缀。
    -l：值为每一输出档的列数大小。

    split -b 100k hello.tar
    cat xa* > hello.tar2

    文件被分割成多个带有字母的后缀文件，如果想用数字后缀可使用-d参数，同时可以使用-a length来指定后缀的长度：
    split -b 10k date.file -d -a 3
    split -b 10k date.file -d -a 3 split_file

    使用-l选项根据文件的行数来分割文件，例如把文件分割成每个包含10行的小文件
    split -l 10 date.file

od

    -a 　此参数的效果和同时指定"-ta"参数相同。
    -A   <字码基数> 　选择要以何种基数计算字码。
    -b 　此参数的效果和同时指定"-toC"参数相同。
    -c 　此参数的效果和同时指定"-tC"参数相同。
    -d 　此参数的效果和同时指定"-tu2"参数相同。
    -f 　此参数的效果和同时指定"-tfF"参数相同。
    -h 　此参数的效果和同时指定"-tx2"参数相同。
    -i 　此参数的效果和同时指定"-td2"参数相同。
    -j<字符数目>或--skip-bytes=<字符数目> 　略过设置的字符数目。
    -l 　此参数的效果和同时指定"-td4"参数相同。
    -N<字符数目>或--read-bytes=<字符数目> 　到设置的字符数目为止。
    -o 　此参数的效果和同时指定"-to2"参数相同。
    -s<字符串字符数>或--strings=<字符串字符数> 　只显示符合指定的字符数目的字符串。
    -t<输出格式>或--format=<输出格式> 　设置输出格式。
    -v或--output-duplicates 　输出时不省略重复的数据。
    -w<每列字符数>或--width=<每列字符数> 　设置每列的最大字符数。
    -x 　此参数的效果和同时指定"-h"参数相同。
    --help 　在线帮助。
    --version 　显示版本信息。

    echo abcdef g 123 > tmp
    od -b tmp
    od -c tmp

swapon

    -a：将/etc/fstab文件中所有设置为swap的设备，启动为交换区；
    -h：显示帮助；
    -p<优先顺序>：指定交换区的优先顺序；
    -s：显示交换区的使用状况；
    -V：显示版本信息。

    mkswap -c /dev/hdb4 （-c是检查有无坏块）
    swapon -v /dev/hdb4
    swapon -s

swapoff

    swapoff /dev/sda2

#### 网络管理

ss

    当服务器的socket连接数量变得非常大时，无论是使用netstat命令还是直接cat /proc/net/tcp，执行速度都会很慢。可能你不会有切身的感受，但请相信我，当服务器维持的连接达到上万个的时候，使用netstat等于浪费 生命，而用ss才是节省时间。

    -h：显示帮助信息；
    -V：显示指令版本信息；
    -n：不解析服务名称，以数字方式显示；
    -a：显示所有的套接字；
    -l：显示处于监听状态的套接字；
    -o：显示计时器信息；
    -m：显示套接字的内存使用情况；
    -p：显示使用套接字的进程信息；
    -i：显示内部的TCP信息；
    -4：只显示ipv4的套接字；
    -6：只显示ipv6的套接字；
    -t：只显示tcp套接字；
    -u：只显示udp套接字；
    -d：只显示DCCP套接字；
    -w：仅显示RAW套接字；
    -x：仅显示UNIX域套接字。

    ss -at    #显示ICP连接
    ss -au    #显示所有UDP Sockets
    ss -s     #显示 Sockets 摘要
    ss -pl    #查看进程使用的socket

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

cal

    Usage: cal [-jy] [[MONTH] YEAR]

    Display a calendar
    -j	Use julian dates
    -y	Display the entire year

    cal -y
    cal -j
    cal 2018
    cal 1 2018

alias

    alias 新的命令='原命令 -选项/参数'
    alias -p

mkfs

    fs：指定建立文件系统时的参数；
    -t<文件系统类型>：指定要建立何种文件系统；
    -v：显示版本信息与详细的使用方法；
    -V：显示简要的使用方法；
    -c：在制做档案系统前，检查该partition是否有坏轨。

    mkfs -V -t msdos -c /dev/hda5

    mkfs -t ext3 /dev/sda6     //将sda6分区格式化为ext3格式
    mkfs -t ext2 /dev/sda7     //将sda7分区格式化为ext2格式

### 常用命令

xargs

    xargs命令是给其他命令传递参数的一个过滤器，也是组合多个命令的一个工具。它擅长将标准输入数据转换成命令行参数，xargs能够处理管道或者stdin并将其转换成特定命令的命令参数。xargs也可以将单行或多行文本输入转换为其他格式，例如多行变单行，单行变多行。xargs的默认命令是echo，空格是默认定界符。这意味着通过管道传递给xargs的输入将会包含换行和空白，不过通过xargs的处理，换行和空白将被空格取代。xargs是构建单行命令的重要组件之一。

    cat test.txt | xargs
    a b c d e f g h i j k l m n o p q r s t u v w x y z

    cat test.txt | xargs -n3
    a b c
    d e f
    g h i
    j k l
    m n o
    p q r
    s t u
    v w x
    y z

    echo "nameXnameXnameXname" | xargs -dX
    name name name name

    echo "nameXnameXnameXname" | xargs -dX -n2
    name name
    name name

### strace

    strace ls
