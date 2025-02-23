---
author: mbailey
comments: true
date: 2011-03-15 06:45:16+00:00

slug: ssh-compression-can-slow-you-down
title: SSH compression can slow you down
wordpress_id: 196
categories:
- commandline
---

*Repost from [my old blog](http://codemode.blogspot.com/2006/12/ssh-default-compression-can-slow-you.html)*

When copying some large files between hosts at our rack I noticed some pretty
poor transfer speeds. Having recently forked out $70 for a rackmount gigabit
switch I wondered what was slowing things.

It seems ssh was trying to help out by compressing everything however
compressing the data took more than twice as long as transferring the
uncompressed data. I proved this by disabling compression at the commandline
and seeing the transfer speed more than triple.

```shell
mbailey@modu1:~/vm$ scp -r r03 modu4:vm/
Ubuntu 64-bit-f001.vmdk          7%  147MB   8.1MB/s   03:54 ETA

mbailey@modu1:~/vm$ scp -r -o 'Compression no'  r03 modu4:vm/
Ubuntu 64-bit-f001.vmdk        100% 2048MB  28.1MB/s   01:13 ETA
```

So how can we put this into practice everywhere?

Setting `'Compression no'` in `/etc/ssh/ssh_config` will do the trick for me.
There's no need for my vmware hosts to be compressing files I copy between
them. I do want compression when copying files over shared/slower links but I
can achieve that by initiating connections that benefit from compression on
boxes that are configured to use it.

If I want to enable compression I can always use the '-C' switch to enable
compression.
