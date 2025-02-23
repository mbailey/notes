---
author: mbailey
comments: true
date: 2011-05-26 14:47:36+00:00

slug: blinksale-how-to-say-goodbye
title: BlinkSale - How To Say Goodbye
wordpress_id: 252
categories:
- commandline
- ruby
---

What do you do when you want to stop using a service but it's going to be a lot
of effort to extract your data? Write a script to do it of course!

I've been using [BlinkSale](http://blinksale.com/) for my invoices since 2007
and it's served my needs well. Since being bought, BlinkSale has increased
their monthly costs. In order to stop using them I needed to download 90
invoices as PDF's. The following script automated the process for me.

If you have Ruby and the mechanize rubygem you can download and run it with:

```sh
$ curl -L http://bit.ly/mkQqan -o blinksave && ruby blinksave
```

Because it asks for your BlinkSale password you really should read through the
code to make sure this is not a phishing trip! Look how easy Mechanize makes
this kind of task.
