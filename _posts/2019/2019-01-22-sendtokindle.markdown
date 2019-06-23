---
layout: post
title:  "sendtokindle"
date:   2019-01-22 00:00:01 +0800
categories: read
tags: kindle
description: sendtokindle不完全靠谱指南
---
## sendtokindle不完全靠谱指南

##### &emsp;&emsp;本文用于将内容发送到kindle上，kindle真是对眼睛有点好处，而且可以沉浸阅读。kindle平时建议使用飞行模式省电，最好不要开启商店，看也看不清，可以买完了推送。此外，kindle除了使用在商店购买的书籍，也可以进行导入。

&nbsp;

## USB直连

&emsp;&emsp;直接连线在windows上就能看见，在document，放文件就不做介绍，主要支持文本如下：

* mobi，pdf

&nbsp;

## 邮件推送

&emsp;&emsp;kindle还支持一中邮箱附件推送的形式，就是给你的kindle分配一个邮箱，并支持配置多个可信任的邮箱，此邮箱将文件作为附件发送到kindle邮箱，可以联网推送到kindle上，支持附件类型如下：

* Microsoft Word (.doc, .docx)
* RTF文件(.rtf)
*  HTML(.htm, .html)
*  TXT文件(.txt)
*  Zip, x-zip压缩文件
*  Mobi格式电子书

使用什么方式发触发这个机制是本文重点，大概有分为：

*  web内容推送（使用Chrome插件）
*  微信内容或者图片（使用亚马逊公众号推送）
*  文件推送（使用官方sendtokindle，使用ifttt通过网盘推送）

### 2.1web推送



### 2.2微信内容或者图片

### 2.3文件推送

&nbsp;

## 官方软件(sendtokinle)推送

&emsp;&emsp;到官网上下载sendtokinle软件，`但是该软件只支持美国亚马逊账号绑定kindle`，这样国内的亚马逊无法购买书籍，对于一部分人来说很不方便，所以建议使用ifttt方式解决

&nbsp;

## ifttt的applets推送

&emsp;&emsp;ifttt的功能简单说就是，可以通过一个应用或者动作触发另一个应用自动进行后面的操作。比如现在，可以在网盘指定的文件夹内上传一个文件，触发gmail服务去将文件发送到kindle邮箱。（经常使用ifttt让它当我在tumblr或者ins上点缀然后将文件存到网盘或者推送到ipad图库上）

&emsp;&emsp;目前已知Dropbox推送到kindle有现成可以用的applets（应用）。问题是国内上Dropbox也很费劲。。。所以我动了个脑筋，使用国内支持的onedrive云盘直接触发gmail发邮件，结果证明不可行，弱鸡的onedrive给gmail传了附件不带文件后缀。。。本来想试一下所有其他国内可用，而且ifttt支持的云盘，但是放弃了，没时间，索性直接使用onedrive直接上传文件推送到Dropbox，然后Dropbox去处理后面算了，可行，天朝sendtokindle可以绕地球两圈。

&emsp;&emsp;注意使用这样就使用了两个applets，这两个applets要想顺利完成，首先注册ifttt，然后注册onedrive、Dropbox、gmail，并授权给ifttt，虽然账号有点多但真是方便啊。而且这些账号常爬墙头的人都是挺多的。添加两个应用使用注意添加顺序，一定要按照onedrive到Dropbox应用，然后Dropbox触发gmail发邮件，否则倒序将可能导致Dropbox异步处理产生两个同名文件夹，尤其是在指定的文件夹存在文件时（我碰上了）。

&emsp;&emsp;其实可以在ifttt上搜kindle，使用印象笔记和pocket推送kindle的也很多的。
