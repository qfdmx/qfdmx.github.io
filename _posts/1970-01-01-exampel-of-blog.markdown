---
layout: post
title:  "blog"
date:   2018-06-27 06:01:51 +0800
categories: example
tags:
description:
---

# 一、标题（支持六级）

# Jekyll

## Jekyll

### Jekyll

#### Jekyll

# [Jekyll](https://jekyllrb.com/)

## [Jekyll]()

# `jekyll`

### 无序列表

在文字开头添加(*, +, and -)实现无序列表。但是要注意在(*, +, and -)和文字之间需要添加空格。（建议：一个文档中只是用一种无序列表的表示方式）

* 无序列表1
* 无序列表1

### 有序列表

使用数字后面跟上句号。（还要有空格）(数字即使错误也会自动更正)

1. 有序列表
1. 有序列表
1. 有序列表

## 首行缩进与空格

	&ensp;或&#8194;//半角
	&emsp;或&#8195;//全角
	&nbsp;或&#160;//空白格

## 三、特殊标记

### 1.斜体

将需要设置为斜体的文字两端使用1个"\*"或者"\_"夹起来

### 2.粗体

将需要设置为斜体的文字两端使用2个"\*"或者"\_"夹起来

### 3.删除线

要加删除线的文字左右分别用两个~~号包起来

### 4.使用\`\`提示性字体

# 四、插入

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

* 大片文字需要实现代码框。使用Tab或四个空格,建议空两行



	def print_hi(name)
	  puts "Hi, #{name}"
	end
	print_hi('Tom')
	#=> prints 'Hi, Tom' to STDOUT.
	


### 图片

* 本地引用（仅适用于jekyll blog）

The content of this theme is distributed and licensed under a![License Badge]({{ site.baseurl }}/assets/images/cc_by_88x31.png)

* 网络引用

![Gem Version](https://img.shields.io/gem/v/jekyll.svg)

### 超链接

* \[文字\]\(URL\)形式

[GitHub Pages](https://pages.github.com)

* \[文字\]\[注释\]配合文章底部加注释链接形式\[注释\]:URL

Jekyll is the engine behind [GitHub Pages][GitHub Pages-url], which you can use to host sites right from your GitHub repositories.

[GitHub Pages-url]:https://pages.github.com

### 标签（图片赋予超链接）

标签图片引用网址[shields.io](https://shields.io/#/)

* 形式一

[![Gem Version](https://img.shields.io/gem/v/jekyll.svg)](https://rubygems.org/gems/jekyll)

* 形式二

[![Gem Version](https://img.shields.io/gem/v/jekyll.svg)][ruby-gems]
[![Linux Build Status](https://img.shields.io/travis/jekyll/jekyll/master.svg?label=Linux%20build)][travis]

[ruby-gems]: https://rubygems.org/gems/jekyll
[travis]: https://travis-ci.org/jekyll/jekyll

## License

See the [LICENSE](https://github.com/jekyll/jekyll/blob/master/LICENSE) file.
