---
layout: post
title:  "python积累"
date:   2019-05-05 00:00:01 +0800
categories: python
tags: python time
description: python技巧积累
---
## 时间戳打印
参考：https://www.v2ex.com/t/450061

  import time

  #currenttime=time.localtime() #变量只能赋值一次，函数调用会更新时间戳
  currenttime=lambda:time.strftime("%Y%m%d-%H:%M:%S",time.localtime())

  timer=5

  while 1:
	   print(currenttime())
     time.sleep(timer)
