---
layout: post
title:  "shell中ip与数字循环"
date:   2019-11-21 12:00:01 +0800
categories: system
tags: shell
description: 将一段内容中的ip也包括数字进行循环输出
---

{% highlight shell %}
#!/bin/bash
#num为ip数量,end为周期最大数(255广播地址，建议到254)
num=1000
end=254
count=1

#trun计算循环轮数，trun2循环数加一，residue余数，余数暂不使用
turn=$(( $num/$end ))
turn2=$(( $turn+1 ))
#residue=$(( $num%$end ))

#循环内容的函数
content()
{

#$1,$2为两个ip的段数字，$3为数字1，$4为0001这种计数字符串，

#循环替换脚本
#	sed 's/20.20.0.103/'50.50.$1.$2'/g' pf_station

#循环输出ip
#	echo "50.50.$1.$2"

#循环输出段内容
#	echo "198.31.$1.$2	72d1b404-$4-48d7-874a-208e1c75d451"

#循环输出所有参数
	echo $1 $2 $3 $4
}


#循环
for ((i=1;i<=$turn2;i++))
do
	for ((j=1;j<=$end;j++))

	do
		#将1转换为0001
		strnum=$((1000000+$count))		
		str=${strnum:3}

		#将内容输出到指定文件
		content $i $j $count $str #> etxt/$str.efile

		#到达指定数字进行退出
		if [ $count -eq $num ];then
			exit 0
		fi

		count=$((1+$count))
	done
done
{% endhighlight %}
