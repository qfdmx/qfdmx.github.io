---
layout: post
title:  "markdown jekyll 书写参照"
date:   2018-06-27 06:01:51 +0800
categories: format
tags: Jekyll markdown
description: markdown格式书写参照.
---

本文以jekyll中markdown显示格式为主，jekyll对于markdwon的支持便于blog的编写，同时jekyll优先处理ruby的格式显示，然后判定markdown的基本语法，本文参考其他markdown语法总结加上实例，介绍内容如下：

## 一、标题

### 1.使用“=”和“-”

在文字下方添加“=”和“-”，他们分别表示一级标题和二级标题。

Jekyll
======

	Jekyll
	======

Jekyll
------

	Jekyll
	------

### 2.使用“#”

在文字开头加上 “#”，通过“#”数量表示几级标题。（一共只有1~6级标题，1级标题字体最大）

#Jekyll

	#Jekyll     

# Jekyll

	# Jekyll


## Jekyll

	## Jekyll

### Jekyll

	### Jekyll

#### Jekyll

	#### Jekyll

##### Jekyll

	##### Jekyll

###### Jekyll

	###### Jekyll

####### Jekyll

	####### Jekyll

其他常用举例：

# [Jekyll](https://jekyllrb.com/)

	# [Jekyll](https://jekyllrb.com/)

## [Jekyll]()

	## [Jekyll]()

# `jekyll`

	# `jekyll`

带链接标题推荐格式

1，[Jekyll][jekyll-url]

2，[Bootstrap][bootstrap-url]

3，[Github][github-url]

4，[Jekyll Clean Theme][Jekyll-Clean-Theme-url]

[jekyll-url]: http://jekyllrb.com/
[bootstrap-url]: http://getbootstrap.com/
[github-url]: https://github.com/
[Jekyll-Clean-Theme-url]: https://github.com/scotte/jekyll-clean
[xixia-url]: http://xixia.info/

### 3.无序列表

在文字开头添加(*, +, and -)实现无序列表。但是要注意在(*, +, and -)和文字之间需要添加空格。（建议：一个文档中只是用一种无序列表的表示方式）

* 无序列表1
* 无序列表1


+ 无序列表2
+ 无序列表2


- 无序列表3
- 无序列表3


	* 无序列表1
	* 无序列表1


	+ 无序列表2
	+ 无序列表2


	- 无序列表3
	- 无序列表3

`两级无序列表，建议无序列表使用一种，两个无序列表间需要空两行避免相互影响`

- 无序列表上级
- 无序列表上级
	* 无序列表下级
	* 无序列表下级

### 4.有序列表

使用数字后面跟上句号。（还要有空格）(数字即使错误也会自动更正)

1. 有序列表
1. 有序列表
1. 有序列表


## 二、正文

### 书写特点

markdown正文每个段落间需要空一行，不空行表示一个段落，虽然标题和正文之间不需要空行，但是为了书写的方便建议还是使用空行，介绍如下：

原句:Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.

两行书写不空行或者空多行，不空行显示为一行，空一行或者多行显示为两个段落

Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.
Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.



Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.

	Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.
	Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.



	Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.

### 首行缩进与空格

首行缩进用空格（占字符），对于中建议使用两个全角占位符

&emsp;&emsp;首行缩进与空格

	&ensp;或&#8194;//半角
	&emsp;或&#8195;//全角
	&nbsp;或&#160;//不断行的空白格

&ensp;&ensp;&ensp;&ensp;这是一个段落用来测试首行缩进和不断行空白位置。&ensp;&ensp;&ensp;&ensp;这是一个段落用来测试首行缩进和不断行空白位置。半角需要使用4个下面的字符：

	&ensp;或&#8194;

&emsp;&emsp;这是一个段落用来测试首行缩进和不断行空白位置。&emsp;&emsp;这是一个段落用来测试首行缩进和不断行空白位置。全角需要使用下面2个字符：

	&emsp;或&#8195;

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是一个段落用来测试首行缩进和不断行空白位置。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是一个段落用来测试首行缩进和不断行空白位置。这个字符为普通空格需要使用下面7个字符：

	&nbsp;或&#160;


## 三、特殊标记

### 1.斜体

将需要设置为斜体的文字两端使用1个"\*"或者"\_"夹起来

*斜体1*   

_斜体2_

	*斜体1*   

	_斜体2_

### 2.粗体

将需要设置为斜体的文字两端使用2个"\*"或者"\_"夹起来

**粗体1**

__粗体2__

	**粗体1**

	__粗体2__

### 3.删除线

要加删除线的文字左右分别用两个~~号包起来

~~删除~~

	~~删除~~

### 4.使用\(\`\`\)提示性字体

`Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.`

	`Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.`

### 5.其他类型举例

***粗斜体1***

___粗斜体2___

__*`粗斜体+提示性`*__

`***粗斜体+提示性(失败粗斜)***`

	***粗斜体1***
	___粗斜体2___
	__*`粗斜体+提示性`*__
	`***粗斜体+提示性(失败粗斜)***`

## 四、插入

### 块注释（blockquote）

通过在文字开头添加“>”表示块注释。（当>和文字之间添加五个blank时，块注释的文字会有变化。）

>注释：这是一注释
>>注释2
>>>>>>>使用多个`>`

使用`<blockquote>`。（`不是单引号而是左上角的ESC下面~中的`）

<blockquote>
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
</blockquote>

### 代码

* jekyll-ruby格式（markdown不支持）

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

* 大片文字需要实现代码框。使用Tab或四个空格,建议空两行(jekyll不支持)


	def print_hi(name)
	  puts "Hi, #{name}"
	end
	print_hi('Tom')
	#=> prints 'Hi, Tom' to STDOUT.


### 图片

* 本地引用（仅适用于jekyll blog）

建议使用本地图片，对于不确定的网络图片可能失效

The content of this theme is distributed and licensed under a![License Badge]({{ site.baseurl }}/assets/images/cc_by_88x31.png)

	The content of this theme is distributed and licensed under a![License Badge]({{ site.baseurl }}/assets/images/cc_by_88x31.png)

* 网络引用

	![alt text][id] 	
	[id]: /path/to/img.jpg "Title"

![Gem Version](https://img.shields.io/gem/v/jekyll.svg)

### 超链接

* \[文字\]\(URL\)形式

Jekyll is the engine behind [GitHub Pages](https://pages.github.com), which you can use to host sites right from your GitHub repositories.

	[GitHub Pages](https://pages.github.com)

* \[文字\]\[注释\]配合文章底部加注释链接形式\[注释\]:URL

Jekyll is the engine behind [GitHub Pages][GitHub Pages-url], which you can use to host sites right from your GitHub repositories.

[GitHub Pages-url]:https://pages.github.com

	Jekyll is the engine behind [GitHub Pages][GitHub Pages-url], which you can use to host sites right from your GitHub repositories.

	[GitHub Pages-url]:https://pages.github.com

### 标签（图片赋予超链接）

标签图片引用网址[shields.io](https://shields.io/#/)

* 形式一

[![Gem Version](https://img.shields.io/gem/v/jekyll.svg)](https://rubygems.org/gems/jekyll)

	[![Gem Version](https://img.shields.io/gem/v/jekyll.svg)](https://rubygems.org/gems/jekyll)

* 形式二

[![Gem Version](https://img.shields.io/gem/v/jekyll.svg)][ruby-gems]
[![Linux Build Status](https://img.shields.io/travis/jekyll/jekyll/master.svg?label=Linux%20build)][travis]

[ruby-gems]: https://rubygems.org/gems/jekyll
[travis]: https://travis-ci.org/jekyll/jekyll

	[![Gem Version](https://img.shields.io/gem/v/jekyll.svg)][ruby-gems]
	[![Linux Build Status](https://img.shields.io/travis/jekyll/jekyll/master.svg?label=Linux%20build)][travis]

	[ruby-gems]: https://rubygems.org/gems/jekyll
	[travis]: https://travis-ci.org/jekyll/jekyll

### License

See the [LICENSE](https://github.com/jekyll/jekyll/blob/master/LICENSE) file.

## 五、HTML语法使用

`markdown遇到HTML标签将不适用markdown语法`

[Chris.com][chris-ascii-art] collects a lot of ASCII pics, such like the world map：
{% highlight v %}
-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----
           . _..::__:  ,-"-"._        |7       ,     _,.__
   _.___ _ _<_>`!(._`.`-.    /         _._     `_ ,_/  '  '-._.---.-.__
>.{     " " `-==,',._\{  \  / {)      / _ ">_,-' `                mt-2_
  \_.:--.       `._ )`^-. "'       , [_/(                       __,/-'
 '"'     \         "    _L        oD_,--'                )     /. (|
          |           ,'          _)_.\\._<> 6              _,' /  '
          `.         /           [_/_'` `"(                <'}  )
           \\    .-. )           /   `-'"..' `:.#          _)  '
    `        \  (  `(           /         `:\  > \  ,-^.  /' '
              `._,   ""         |           \`'   \|   ?_)  {\
                 `=.---.        `._._       ,'     "`  |' ,- '.
                   |    `-._         |     /          `:`<_|h--._
                   (        >        .     | ,          `=.__.`-'\
                    `.     /         |     |{|              ,-.,\     .
                     |   ,'           \   / `'            ,"     \
                     |  /              |_'                |  __  /
                     | |                                  '-'  `-'   \.
                     |/                                         "    /
                     \.                                             '

                      ,/            ______._.--._ _..---.---------._
     ,-----"-..?----_/ )      __,-'"             "                  (
-.._(                  `-----'                                       `-
-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----
Map (C) 1998 Matthew Thomas. Freely usable if this line is included. <-
{% endhighlight %}

<br/>
``
参考链接
[Markdown 11种基本语法](https://www.cnblogs.com/hnrainll/p/3514637.html)
