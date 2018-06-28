#!/bin/env sh
#author

ddate=`date +%Y-%m-%d`
ddate2=`date "+%Y-%m-%d %H:%M:%S"`

mkdir "`date +%Y`" 2> /dev/null
echo "---
layout: post
title:  \"\"
date:   $ddate2  +0800
categories: 
tags: 
description: 
---
# 标题
{% highlight ruby %}
{% endhighlight %}
" > "`date +%Y`"/"$ddate-$1".markdown

