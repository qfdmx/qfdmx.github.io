---
layout: post
title:  "uefi与legacy"
date:   2018-12-26 00:00:01 +0800
categories: boot
tags: uefi与legacy
description: BIOS与启动项问题
---
### 一、名词解析


    BIOS  - 硬盘分区表
    Legacy  - MBR
    UEFI  - GPT


MBR：主引导记录（Master Boot Record，缩写：MBR），又叫做主引导扇区，是计算机开机后访问硬盘时所必须要读取的首个扇区，它在硬盘上的三维地址为（柱面，磁头，扇区）＝（0，0，1）。

GPT：全局唯一标识分区表（GUID Partition Table，缩写：GPT）是一个实体硬盘的分区表的结构布局的标准。它是可扩展固件接口（EFI）标准（被Intel用于替代个人计算机的BIOS）的一部分，被用于替代BIOS系统中的一32bits来存储逻辑块地址和大小信息的主引导记录（MBR）分区表。对于那些扇区为512字节的磁盘，MBR分区表不支持容量大于2.2TB（2.2×1012字节）的分区，然而，一些硬盘制造商（诸如希捷和西部数据）注意到这个局限性，并且将他们的容量较大的磁盘升级到4KB的扇区，这意味着MBR的有效容量上限提升到16 TiB。

`在MBR硬盘中，分区信息直接存储于主引导记录（MBR）中（主引导记录中还存储着系统的引导程序）。但在GPT硬盘中，分区表的位置信息储存在GPT头中。但出于兼容性考虑，硬盘的第一个扇区仍然用作MBR，之后才是GPT头。`

BIOS：是英文"Basic Input Output System"的缩略词，直译过来后中文名称就是"基本输入输出系统"。其实，它是一组固化到计算机内主板上一个ROM芯片上的程序，它保存着计算机最重要的基本输入输出的程序、开机后自检程序和系统自启动程序，它可从CMOS中读写系统设置的具体信息。 其主要功能是为计算机提供最底层的、最直接的硬件设置和控制。简单来说就是电脑开机后最先启动的一种程序，为操作系统的启动做准备，比如初始化cpu、内侧、主板等各个部分，然后将操作系统加载到内存启动操作系统，这个过程就是我们电脑从按开机键开始到最后看见桌面的整个过程。

UEFI BIOS：UEFI全称“统一的可扩展固件接口”(Unified Extensible Firmware Interface)， 是一种详细描述类型接口的标准。这种接口用于操作系统自动从预启动的操作环境，加载到一种操作系统上。通俗的说，UEFI是一种新的主板引导初始化的标注设置，具有启动速度快、安全性高和支持大容量硬盘而闻名。出现这种技术的主要作用基本上就是为了实现开机快的效果，由于win8系统支持这种引导方式的启动，所以速度略显的有点快，但也因电脑而已。

legacy[ˈlegəsē] BIOS：`顾名思义就是指传统的BIOS，其中UEFI BIOS包括UEFI引导启动和Legacy引导启动`

两者的区别如下图所示：

[![2018-12-26-uefi_legacy-1.png]({{ site.baseurl }}\assets\post_image\2018\2018-12-26-uefi_legacy-1.png)](https://qfdmx.github.io/assets/post_image/2018/2018-12-26-uefi_legacy-1.png)

### 二、BIOS配置重点项

#### 1、OS Optimized Defaults系统默认优化设置

对于预装Win8的电脑中，会有这个选项，一般在Exit这个选项中的最下面OS Optimized Defaults表示的意思是：加载最优的系统设置，比如UEFI和安全启动（注意，这两个设置选项非常重要）。切换到“EXIT（退出）”选项卡，如下图的位置可以找到它：

[![2018-12-26-uefi_legacy-2.png]({{ site.baseurl }}\assets\post_image\2018\2018-12-26-uefi_legacy-2.png)](https://qfdmx.github.io/assets/post_image/2018/2018-12-26-uefi_legacy-2.png)

如果，要把win8系统更换为win7，首先需要把这个选项给禁用，即设置为：Disable。

#### 2、CSM兼容模块设置

CSM（Compatibility support Module）表示兼容模块，该选项专为兼容只能在legacy模式下工作的设备以及不支持或不能完全支持UEFI的操作系统而设置。因此，安装win7系统还需要把Launch CSM设置为Enable，表示支持Legacy引导方式。如下图所示：

[![2018-12-26-uefi_legacy-3.png]({{ site.baseurl }}\assets\post_image\2018\2018-12-26-uefi_legacy-3.png)](https://qfdmx.github.io/assets/post_image/2018/2018-12-26-uefi_legacy-3.png)

#### 3、Secure Boot Control安全启动控制设置

对于有些主板来说，只有把Secure Boot Control即安全启动控制设置为Disable的时候才能把Launch CSM选项设置为Legacy，因此2和3的步骤对有些主板而言是不同的顺序。

#### 4、Boot Mode[UEFI/Legacy]启动模式

把启动模式设置为Legacy启动模式。

### 三、BIOS设置对系统影响

从U盘启动完系统以后第一件事情就是备份数据，因为需要把硬盘的分区表格式改变一下，win8的格式是guid格式，而win7支持的MBR格式，具体的方法是系统启动后，利用电脑维护工具软件Disk Genius即可完成，改变分区表的类型会使硬盘的所有数据全部丢失，所以必须首先进行数据备份，然后进行操作。操作完之后，将下载好的系统镜像文件拷贝到系统的非C盘的某一个盘，然后利用一键安装系统的安装器进行系统安装。

### 四、系统使用与BIOS建议

对于使用win10及以上版本windows的直接使用UEFI+GPT，保证系统开机极快的良好体验。包括近年来的一些新更新的linux系统近期版本，像arch linux、gentoo、Ubuntu等。而且这些支持UEFI的系统在装多系统时候，不用担心系统主分区仅限制为3个的问题。

对于需要时候旧版windows和多操作系统的情况下，使用legacy模式比较合适。当然这需要windows从早到晚顺时安装且不能超过3个windows系统，然后将需要的linux安装在逻辑分区上。

对于多硬盘混用现象，尤其是固态硬盘ssd和机械音频混用，最好把固态硬盘的启用放在机械硬盘后面。甚至某些时刻在安装多系统时候，需要拔掉ssd避免，分区表写在固态硬盘上，是两个硬盘都有自己的主分区引导（无论是MBR还是GPT），独立的硬盘分区引导避免一块硬盘故障引发所有系统问题。


### 五、一些安装技巧

win7避免100M保留分区

    正常安装状态完成后，将win7删掉主要分区，只留下100M保留分区，然后进行分区扩容。

win8更换win7的方法的两个步骤：

    （1）、设置BIOS支持Legacy启动，具体目标就是设置secure boot control为Disable，兼容功能CSM选项设置为Enable，启动模式Boot Mode[UEFI/Legacy]设置为Legacy模式。
    （2）、将硬盘的分区表类型由GUID变为MBR模式。

### 六、grub默认启动项

centos 7

    #执行grub2-set-default0设置内核配置开机选单为第0项（第一个）
    #执行grub2-editenv list确认设置成功（saved_entry=0）
    grub2-set-default 0
    grub2-editenv list

其他linux

    vi /boot/grub/grub.cfg
    set default = 0


-------------------

参考链接：

[UEFI和Legacy及UEFI+Legacy启动的区别](https://www.cnblogs.com/net5x/p/6850801.html)

[MBR主引导记录](https://zh.wikipedia.org/wiki/%E4%B8%BB%E5%BC%95%E5%AF%BC%E8%AE%B0%E5%BD%95)

[GPT全局唯一标识分区表](https://zh.wikipedia.org/wiki/GUID%E7%A3%81%E7%A2%9F%E5%88%86%E5%89%B2%E8%A1%A8)

[win7避免100M保留分区](https://jingyan.baidu.com/article/14bd256e6a1e48bb6d261221.html)

[CentOS7设置GRUB系统内核开机选单](https://blog.csdn.net/csdn_duomaomao/article/details/78963761)
