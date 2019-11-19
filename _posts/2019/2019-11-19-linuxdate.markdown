---
layout: post
title:  "linux命令参数新发现"
date:   2019-11-19 09:00:01 +0800
categories: system
tags: linux
description: 每日更新一个
---

#### 文件管理

cat
{% highlight ruby %}
'-n或-number：有1开始对所有输出的行数编号；
-b或--number-nonblank：和-n相似，只不过对于空白行不编号；
-s或--squeeze-blank：当遇到有连续两行以上的空白行，就代换为一行的空白行；'
-A：显示不可打印字符，行尾显示“$”；
-e：等价于"-vE"选项；
-t：等价于"-vT"选项；


-nbs三个参数用于输出编号和空格展示
-e参数在"syntax error"时候用于查看不支持的字符，如windows换行符在linux下不支持，使用-A参数可以看到shell脚本的结尾"$",但是异常字符需要使用-e进行打印
-t会将tab转换为^I,同时转换中文字符等
{% endhighlight %}


chattr

{% highlight ruby %}
文件属性
a：让文件或目录仅供附加用途；(适用于各种日志)
b：不更新文件或目录的最后存取时间；
c：将文件或目录压缩后存放；
d：将文件或目录排除在倾倒操作之外；
`i：不得任意更动文件或目录；(适用于重要文件)`
s：保密性删除文件或目录；
S：即时更新文件或目录；
u：预防意外删除。

选项
`-R：递归处理，将指令目录下的所有文件及子目录一并处理；`
-v<版本编号>：设置文件或目录版本；
-V：显示指令执行过程；
`+<属性>：开启文件或目录的该项属性；
-<属性>：关闭文件或目录的该项属性；
=<属性>：指定文件或目录的该项属性。`

'# chattr +a logfile'
'# chattr +i merging.py'
'# lsattr'
-------------e-- ./sendlist.tar.gz
----i--------e-- ./merging.py
-----a-------e-- ./logfile
-------------e-- ./sendlist
{% endhighlight %}

{% highlight ruby %}
{% endhighlight %}
