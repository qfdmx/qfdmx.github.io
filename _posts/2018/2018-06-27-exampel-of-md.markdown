---
layout: post
title:  "markdown 书写格式参照"
date:   2018-06-27 06:01:51 +0800
categories: format
tags: Jekyll markdown
description: markdown格式书写参照.
---
## 标题展示

#Jekyll

# Jekyll

## Jekyll

### Jekyll

#### Jekyll

#### Jekyll

# [Jekyll](https://jekyllrb.com/)

# [Jekyll]()

# `jekyll`

Jekyll
======

## 标题下面的链接标签书写

[![Gem Version](https://img.shields.io/gem/v/jekyll.svg)][ruby-gems]
[![Linux Build Status](https://img.shields.io/travis/jekyll/jekyll/master.svg?label=Linux%20build)][travis]
[![Windows Build status](https://img.shields.io/appveyor/ci/jekyll/jekyll/master.svg?label=Windows%20build)][appveyor]
[![Test Coverage](https://img.shields.io/codeclimate/coverage/github/jekyll/jekyll.svg)][coverage]
[![Code Climate](https://img.shields.io/codeclimate/github/jekyll/jekyll.svg)][codeclimate]
[![Dependency Status](https://img.shields.io/gemnasium/jekyll/jekyll.svg)][gemnasium]
[![Security](https://hakiri.io/github/jekyll/jekyll/master.svg)][hakiri]

[ruby-gems]: https://rubygems.org/gems/jekyll
[gemnasium]: https://gemnasium.com/jekyll/jekyll
[codeclimate]: https://codeclimate.com/github/jekyll/jekyll
[coverage]: https://codeclimate.com/github/jekyll/jekyll/coverage
[hakiri]: https://hakiri.io/github/jekyll/jekyll/master
[travis]: https://travis-ci.org/jekyll/jekyll
[appveyor]: https://ci.appveyor.com/project/jekyll/jekyll/branch/master

## 文本换行

原句:

Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.

1,起始使用Tab

	Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.

2,两行书写不空行或者空多行，不空行显示为一行，空一行或者多行显示为两个段落

Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.
Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.




Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.

3,使用\(\`\`\)提示性字体

`Jekyll is a simple, blog-aware, static site generator perfect for personal, project, or organization sites.`

## 正文文本书写

插入一个网址链接

Jekyll is the engine behind [GitHub Pages], which you can use to host sites right from your GitHub repositories.

Jekyll is the engine behind [GitHub Pages](https://pages.github.com), which you can use to host sites right from your GitHub repositories.

Jekyll is the engine behind [GitHub Pages][GitHub Pages-url], which you can use to host sites right from your GitHub repositories.

[GitHub Pages-url]:https://pages.github.com

插入一个本地图片链接

The content of this theme is distributed and licensed under a![License Badge]({{ site.baseurl }}/assets/images/cc_by_88x31.png)

## 代码书写格式

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

## 分标题使用

###  1，ASCII Generator

###  2，Chris.com

1,ASCII Generator

2,Chris.com

* ASCII Generator

* Chris.com

## example

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


安装使用教程书写建议

## Getting Started

* [Install](https://jekyllrb.com/docs/installation/) the gem
* Read up about its [Usage](https://jekyllrb.com/docs/usage/) and [Configuration](https://jekyllrb.com/docs/configuration/)
* Take a gander at some existing [Sites](https://wiki.github.com/jekyll/jekyll/sites)
* [Fork](https://github.com/jekyll/jekyll/fork) and [Contribute](https://jekyllrb.com/docs/contributing/) your own modifications

标题、链接、颜色提示混用

* Have questions? Check out our official forum community [Jekyll Talk](https://talk.jekyllrb.com/) or [`#jekyll` on irc.freenode.net](https://botbot.me/freenode/jekyll/)

链接与链接404

[welcome-to-jekyll.markdown](http://qfdmx.github.io/jekyll/update/2016/05/01/welcome-to-jekyll.html)

[welcome-to-jekyll.markdown](2016-05-01-welcome-to-jekyll.markdown)

## Diving In

* [Migrate](http://import.jekyllrb.com/docs/home/) from your previous system
* Learn how the [YAML Front Matter](https://jekyllrb.com/docs/frontmatter/) works
* Put information on your site with [Variables](https://jekyllrb.com/docs/variables/)
* Customize the [Permalinks](https://jekyllrb.com/docs/permalinks/) your posts are generated with
* Use the built-in [Liquid Extensions](https://jekyllrb.com/docs/templates/) to make your life easier
* Use custom [Plugins](https://jekyllrb.com/docs/plugins/) to generate content specific to your site

## License

See the [LICENSE](https://github.com/jekyll/jekyll/blob/master/LICENSE) file.

HTML语法使用

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

