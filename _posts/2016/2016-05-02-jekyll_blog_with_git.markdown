---
layout: post
title:  "github+jekyll搭建一个免费的简易博客"
date:   2016-05-02 10:15:42 +0800
categories:  blog
tags: jekyll github
description: The read me page of Jekyll.
---
`概要介绍`：
  首先注册一个git账号了解简单的git操作，然后在[Github Pages](https://pages.github.com/)进行简单的网页创建\(hello word\)。再使用jekyll进行博客的的规划，熟悉html知识进行简易的blog的搭建，提交代码进行，日后再进行博客的模板优化。

一创建git账户，创建hello wold博客

1.创建一个使用你的用户名(以qfdmx为例)的仓库。

2.克隆到本地。

git clone https://github.com/qfdmx/qfdmx.github.io

3.创建第一个网页。

cd qfdmx.github.io

echo "hello world" > index.html

4.push it

{% highlight ruby %}
git add --all
git commit -m "hello"
git push -u origin master (强制提交git push origin master --force)
{% endhighlight %}

5.登陆你的博客[http://qfdmx.github.io](http://qfdmx.github.io/)

二使用jekyll写博客

1.安装ruby,更换源，安装jekyll
{% highlight ruby %}
#安装ruby
pacman -S ruby
#查看ruby源
gem sources
#删除原有源
gem sources -r https://rubygems.org/
#添加一个源
#常用的淘宝源已经被墙，下面的源为山东理工大学的gem源
gem sources -a http://ruby.sdutlinux.org/
#更新RubyGems
gem update
#安装jekyll
gem install jekyll
{% endhighlight %}

2.配置jekyll环境变量，当jekyll报错命令找不到，先找到安装路径，然后添加到环境变量中。

{% highlight ruby %}
#需要注意安装的用户，可能安装位置为用户目录或者/usr下
find ~ -name jekyll*
#vi /etc/profile
#echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/bin:/home/qfdmx/.gem/ruby/2.3.0/gems/jekyll-2.5.3/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/qfdmx/.gem/ruby/2.3.0/gems/jekyll-2.5.3/bin/
#执行jekyll
jekyll new myblog
#或者已经存在一个目录
jekyll new .
{% endhighlight %}

3.git提交博客并访问

{% highlight ruby %}
#可以克隆一个基础博客作为jekyll文本基础作为参考
#https://github.com/danielmcgraw/Jekyll-Base.git
vi _posts/1985-10-26-Test-Post.md
#提交代码
git add --all
git commit -m "new blog"
git push origin master
#git push origin master --force
#登录http://username.github.io访问博客，可能需要缓冲
{% endhighlight %}
