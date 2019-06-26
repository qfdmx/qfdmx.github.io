---
layout: post
title:  "markdown jekyll 书写速查"
date:   2018-06-27 09:01:51 +0800
categories: blog
tags: jekyll markdown
description: 之前一版的格式推荐很凌乱，重置一版用于推荐书写格式，发现了不进行统一格式.博客浏览起来和凌乱。一年又一年的github博客修炼又开始了。（2019-06-23更新）
---

###### 本文是jekyll的Markdown语法快速查询使用，具体请查书写参照

	使用"###### "小字体作为注释
	>添加注释并

### post标签

	---
	layout: post
	title:  "markdown jekyll 书写推荐"
	date:   2018-06-27 09:01:51 +0800
	categories: gitHub
	tags: Jekyll markdown
	description: "这个是推荐语"
	---

&nbsp;&nbsp;

### 标题

	建议少使用中文序号
	标题使用
	### 标题
	#### 二级标题
	* 使用无序列表

&nbsp;

### 正文

#### 空格空行与首行缩进

	空格：
	&emsp;
	空行：
	&nbsp;
	段落分隔线
	-------------
	两个空格表示首行缩进
	&emsp;&emsp;

#### 字体标记

* `高亮显色`

		`高亮显色`

* **粗体**

		**粗体**

* *斜体*

		*斜体*

* ~~删除线~~

		~~删除线~~

#### 插入链接

	插入链接
	[GitHub Pages](https://pages.github.com)
	颜色显示
	[GitHub Pages]()

#### 插入图片

* 不带链接的图片插入

![2018-06-27-jekyll-1.png]({{ site.baseurl }}\assets\post_image\2018\2018-06-27-jekyll-1.png)

	![图片名称任意]({{ site.baseurl }}\assets\post_image\2018\2018-06-27-jekyll-1.png)

* 带链接的图片插入

[![fgo奶光]({{ site.baseurl }}\assets\post_image\2018\2018-06-27-jekyll-2.png)](https://qfdmx.github.io/assets/post_image/2018/2018-06-27-jekyll-2.png)

	[![fgo奶光]({{ site.baseurl }}\assets\post_image\2018\2018-06-27-jekyll-2.png)](https://qfdmx.github.io/assets/post_image/2018/2018-06-27-jekyll-2.png)

#### 插入列表

		有序使用如下
		1. 有序列表1
			* 有序
		2. 有序列表2
		3. 有序列表3

		无序列表使用如下
		* 无序列表1
			* 无序2级
		* 无序列表2
		* 无序列表3


#### 注释显示

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

### 代码

* 简易代码行

	使用tab进行分割

* jekyll-ruby格式（markdown不支持）

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

	\{\% highlight ruby \%\}
	\{\% endhighlight \%\}

&nbsp;

### 表格

	日期|周一|周二
	:-:|:-:|:-:		#居中
	上午|数学|语文
	上午|数学|语文
