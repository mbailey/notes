---
author: mbailey
comments: true
date: 2008-08-29 06:23:27+00:00

slug: growing-your-xen-guest-disks-with-xen-resize-guest
title: Growing your Xen guest disks with xen-resize-guest
wordpress_id: 28
---

This morning I woke to a notification from [nagios](http://www.nagios.org/)
telling me the disk was full on one of the slices I manage for a client. I knew
what I had to do. As we run [Xen](http://www.xen.org/) virtual servers on
dedicated hardware I could shut down the slice, increase the lvm size, grow the
filesystem and then fire up the slice again. What I didn't look forward to was
reading man pages and  googling to find out exactly how to do that.

I was glad to discover that [Steve Kemp](http://www.steve.org.uk/)'s
[xen-tools-3.9](http://www.xen-tools.org/software/xen-tools/releases.html) (a
collection of scripts for creating and managing xen virtual machines) contains
a command that does just what I needed. This script is not included in Ubuntu
7.10's package (xen-tools-3.5) so I just copied the script from the source
distribution.

Xen-tools is well thought out, simple to use and easy to extend. I've been
using it since I started using Xen and highly recommend it.

xen-tools-resize allowed me to grow the main disk for my gateway slices from
2GB to 10GB in about a minute with just one command. That left me with time to 
tell you about Steve's awesome  toolkit! Steve's also got some great sysadmin
tips at [http://www.debian-administration.org/](http://www.debian-administration.org/)

```bash
    root@sm01:~# xen-resize-guest --hostname=gw1 --add=8Gb
    Preparing to resize image: /dev/vm_local/gw1-disk
    Sleeping for 9 seconds to allow cancel
    Sleeping for 8 seconds to allow cancel
    Sleeping for 7 seconds to allow cancel
    Sleeping for 6 seconds to allow cancel
    Sleeping for 5 seconds to allow cancel
    Sleeping for 4 seconds to allow cancel
    Sleeping for 3 seconds to allow cancel
    Sleeping for 2 seconds to allow cancel
    Sleeping for 1 seconds to allow cancel
    Sleeping for 0 seconds to allow cancel
    DO NOT INTERRUPT
      Extending logical volume gw1-disk to 10.00 GB
      Logical volume gw1-disk successfully resized
    Checking filesystem
    e2fsck 1.40.2 (12-Jul-2007)
    Pass 1: Checking inodes, blocks, and sizes
    Pass 2: Checking directory structure
    Pass 3: Checking directory connectivity
    Pass 4: Checking reference counts
    Pass 5: Checking group summary information
    /dev/vm_local/gw1-disk: 22115/262144 files (1.7% non-contiguous), 264768/524288 blocks
    Resizing in place
    resize2fs 1.40.2 (12-Jul-2007)
    Resizing the filesystem on /dev/vm_local/gw1-disk to 2621440 (4k) blocks.
    The filesystem on /dev/vm_local/gw1-disk is now 2621440 blocks long.

    All done
```
