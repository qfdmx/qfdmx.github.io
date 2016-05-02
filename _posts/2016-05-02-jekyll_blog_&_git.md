---
layout: post
title: jekyll+git搭建一个简易博客
---

概要介绍：
  首先注册一个git账号了解简单的git操作，然后在[Github Pages](https://pages.github.com/)进行简单的网页创建\(hello word\)。再使用jekyll进行博客的的规划，熟悉html知识进行简易的blog的搭建，提交代码进行，日后再进行博客的模板优化。

1. 创建一个使用你的用户名(以qfdmx为例)的仓库。
2. 克隆到本地。
<div class="code">git clone https://github.com/qfdmx/qfdmx.github.io</div>
3. 创建第一个网页。
<div class="code">
	cd qfdmx.github.io
	echo "hello world" > index.html
</div>
4. push it
	git add --all
	git commit -m "hello"
	git push -u origin master
5. 登陆你的博客[http://qfdmx.github.io](http://qfdmx.github.io/)

