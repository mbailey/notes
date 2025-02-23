---
author: mbailey
comments: true
date: 2012-09-27 01:30:40+00:00

slug: first-impressions-of-macbook-air-with-preinstalled-mountain-lion
title: First Impressions of Macbook Air with preinstalled Mountain Lion
wordpress_id: 517
tags:
- apple
- stale
---

Last Friday night I picked up my new Macbook Pro and thought it might be worth
sharing my initial experiences. Coming from a late 2011 MacBook Pro with HDD
I'm loving the speed and lighter form factor.

## Mac OSX Mountain Lion demotes /usr/local/bin in path

Homebrew's 'brew doctor' command warned me about my PATH.

> Warning: /usr/bin occurs before /usr/local/bin
>
> This means that system-provided programs will be used instead of those
provided by Homebrew.

It turns out /etc/paths has listed last /usr/local/bin. Ever since reading Dan
Benjamin's post, [Using /usr/local](http://hivelogic.com/articles/using_usr_local/) I've
been...erm...using /usr/local. I'd be interested to know why Apple made this
change.


## MacGPG2 can mess with libiconv

While on the topic of PATHs, you don't want this in your PATH: /usr/local/MacGPG2/bin

For some reason this was the cause of me being unable to compile native
extensions in the tiny_tds rubygem. GCC appears to have been grabbing that item
and then finding /usr/local/MacGPG2/include/iconv.h which conflicted with the
OSX installed version. (Brew tells me the package is no longer provided as OSX
provides libiconv).
