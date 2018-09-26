---
layout: post
title:  "启动项问题"
date:   2018-09-27 00:00:01 +0800
categories: boot
tags: win linux grub
description: 固态硬盘+机械硬盘多windows和linux系统混合启动项问题
---

Windows启动项
在保留分区中/EFI/Boot/\*.efi

当多windows安装在同一块盘或者多盘windows系统时候，如果所有bootx64.efi等启动文件装在同一个保留分区，就会出现windows系统可以选择启动的形式。（也会出现在未清理保留分区，而重装win但bootx64文件为覆盖产生两个启动文件的情况）
进入方式：右键我的电脑-（左侧）高级系统设置-高级-启动和故障恢复，点击设置，切换默认操作系统就是在切换当前启动分区中的*efi文件。

Gpt支持都是主分区，但是grub2必须保留一个2M的空间并设置为bios_grub
Grub-install  XXXXX
Grub-mkconfig –o /boot/grub/grub.cfg

多系统需要设置/etc/grub/40_custom
获取uuid
Ls –l /dev/disk/by-uuid
自定义参数获取
Grub-probe XXXXXX
	# grub-probe --target=fs_uuid esp/EFI/Microsoft/Boot/bootmgfw.efi
1ce5-7f28
grub-probe --target=hints_string esp/EFI/Microsoft/Boot/bootmgfw.efi
--hint-bios=hd0,gpt1 --hint-efi=hd0,gpt1 --hint-baremetal=ahci0,gpt1

Invalid signature报错是硬盘问题（从新分区或者不支持的类型如固态硬盘）
