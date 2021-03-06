---
layout: post
title:  "markdown jekyll 书写参照"
date:   2018-06-27 06:01:52 +0800
categories: blog
tags: jekyll markdown
description: markdown格式书写参照.
---

###### 本文以jekyll中markdown显示格式为主，jekyll对于markdwon的支持便于blog的编写，同时jekyll优先处理ruby的格式显示，然后判定markdown的基本语法，本文参考其他markdown语法总结加上实例，介绍内容如下：

	使用">"添加注释
	使用"###### "添加注释控制字体大小

## 一、post标签

&emsp;&emsp;本来以为标题应该是放在第一位的，但是后后来发现不是，应该是post的起始标签是开篇第一位。格式如下：

	---
	layout: post
	title:  "markdown jekyll 书写推荐"
	date:   2018-06-27 09:01:51 +0800
	categories: gitHub
	tags: Jekyll markdown
	description: "这个是推荐语"
	---

>
	layout:标记文章位置
	title:标题
	date:日期，该日前需要标记时区
	categories:分类，最好用打的类型进行标记，可以在tag中继续细分
	tags:标签可以进行细分
	description:在博客首页用于标记博客内容推荐

&nbsp;&nbsp;

## 二、标题

&emsp;&emsp;标题建议使用"###"统一大小，多篇文章还是需要有个合适的统一格式，大小不一的标题格式或大或小会造成视觉混乱。此外这个段落使用了首行缩进字符，在此进行标记后面还会放在正文里面说。

	标题使用
	### 一、标题
	空格与首行缩进
	&emsp;&emsp;

### 标题说明

* 使用“=”和“-”

在文字下方添加“=”和“-”，他们分别表示一级标题和二级标题。

Jekyll
======

	Jekyll
	======

Jekyll
------

	Jekyll
	------

### 使用“#”

在文字开头加上 “#”，通过“#”数量表示几级标题。（一共只有1~6级标题，1级标题字体最大）

#Jekyll

	#Jekyll     

# Jekyll

	# Jekyll

###### Jekyll

	###### Jekyll

####### Jekyll

	####### Jekyll

&nbsp;

## 三、正文

&emsp;&emsp;无论正文与否先`每一行之间空一行都是必要的`，切记切记！

### 1.空格空行与首行缩进

&emsp;&emsp;`&emsp;`表示空格，两个`&emsp;`表示空格既可作为首行缩进使用，开始本不打算使用缩进，但为了浏览舒服我决定还是采用首行缩进比较好。

	空格：
	&emsp;
	空行：
	&nbsp;
	两个空格表示首行缩进
	&emsp;&emsp;

### 2.字体标记

&emsp;&emsp;字体作为正文重要内容是由一些格式需要显示的，如下

* `高亮显色`

		`高亮显色`

* **粗体**

		**粗体**

* *斜体*

		*斜体*

* ~~删除线~~

		~~删除线~~

### 3.插入链接

&emsp;&emsp;在文中可以直接使用链接地址插入，比如[GitHub Pages](https://pages.github.com)，注意斜线方向。此外这个也可以作为一种颜色显示方式，当地址为为空不进行链接，如[GitHub Pages]()

	插入链接
	[GitHub Pages](https://pages.github.com)
	颜色显示
	[GitHub Pages]()

### 4.插入图片

&emsp;&emsp;图片作为辅助插入显示，其实插入稍微繁琐，建议较少使用，同时大量图片会导致行文臃肿，但是关键必要的图片是文章辅助的必要。

&emsp;&emsp;建议使用post_image文件夹放入图片，然后使用链接，链接到该位置既可显示，图片的大小目前还没有进行研究。图片名称和post的名称一致，然后加上号避免混乱，然后在正文中使用地址链接进行位置插入，`该种插入不能使用图片地址链接`，如下：

![2018-06-27-jekyll-1.png]({{ site.baseurl }}\assets\post_image\2018\2018-06-27-jekyll-1.png)

	![图片名称任意]({{ site.baseurl }}\assets\post_image\2018\2018-06-27-jekyll-1.png)

&emsp;&emsp;此外，防止图片过小或者想进行图片点击链接地址，可以图片+链接方式，推荐文章插入图片使用该方式，如下：

[![fgo奶光]({{ site.baseurl }}\assets\post_image\2018\2018-06-27-jekyll-2.png)](https://qfdmx.github.io/assets/post_image/2018/2018-06-27-jekyll-2.png)

	[![fgo奶光]({{ site.baseurl }}\assets\post_image\2018\2018-06-27-jekyll-2.png)](https://qfdmx.github.io/assets/post_image/2018/2018-06-27-jekyll-2.png)

### 5.插入列表

>列表分为无序列表和有序列表两种

有序列表（注意数字与内容间的空格）

1. 有序列表1
	* 有序
1. 有序列表2
1. 有序列表3

		使用如下
		1. 有序列表1
			* 有序
		2. 有序列表2
		3. 有序列表3

无序列表（\*/-/+效果相同）

* 无序列表1
	* 无序2级
* 无序列表2
* 无序列表3

		使用如下
		* 无序列表1
			* 无序2级
		* 无序列表2
		* 无序列表3


### 6.注释显示

单行注释：

>我是单行注释
>>我是二级注释

	>我是单行注释
	>>我是二级注释

块注释

<blockquote>
我是块注释
</blockquote>

	<blockquote>
	我是块注释
	</blockquote>

&nbsp;

## 四、代码

* 简易代码行

大片文字需要实现代码框。使用Tab或四个空格,建议空两行(jekyll不支持)

	使用tab进行分割

* jekyll-ruby格式（markdown不支持）

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

		{% highlight ruby %}
		{% endhighlight %}

&nbsp;

## 五、表格

日期|周一|周二
:-:|:-:|:-:
上午|数学|语文
上午|数学|语文

	日期|周一|周二
	:-:|:-:|:-:		#居中
	上午|数学|语文
	上午|数学|语文
