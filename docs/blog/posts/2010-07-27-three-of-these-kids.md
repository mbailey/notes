---
author: mbailey
comments: true
date: 2010-07-27 08:26:18+00:00

slug: three-of-these-kids
title: Strange HTTP Performance Variations Between OS’s
wordpress_id: 50
categories:
- latency
- velocityconf
- webperformance
---

*[2013-12-19 I let latentsee.com lapse but you can still install [latentsee](https://github.com/mbailey/latentsee) on your own webserver]*

In a [recent talk](/2010/07/tcp-and-the-lower-bound-of-web-performance/) at
VelocityConf, John Rauser explained the effect of TCP Slow Start and Congestion
Control on web performance.  He pointed out that RFC 1122 states:

> Recent work by Jacobson on Internet congestion and
> TCP retransmission stability has produced a transmission algorithm
> combining "slow start" with "congestion avoidance".  A TCP MUST implement this
> algorithm.

While examining the impact of these with my new HTTP performance testing tool
([LatentSee](http://slicehost.latentsee.com/)) I noticed that the charts
generated on my Mac & Windows machines didn't seem to match the theory. Usually
we would expect to receive 3 packets (< 4500 bytes) in the first segment.
Instead I am seeing up to 67KB on the Mac and around 35KB on Windows 7.

**Effect of file size on retrieval time from [slicehost.latentsee.com](http://slicehost.latentsee.com/)**

![](../../../assets/slicehostlatenseecom-100x1kb1.png)


Original images: | [Theory](/images/2010-07-27-three-of-these-kids/john_rauser-round-trips1.png) | [Ubuntu](/images/2010-07-27-three-of-these-kids/mel_ubuntu_firefox-slicehostlatentseecom-100x1kb1.png) | [Windows 7](/images/2010-07-27-three-of-these-kids/mel_windows7_firefox-slicehostlatentseecom-100x1kb3.png) | [Mac OS X](/images/2010-07-27-three-of-these-kids/mel_osx_firefox-slicehostlatentseecom-100x1kb1.png)

When I ran the same tests against a different hosting provider (Brightbox), Windows and Mac OSX behaved more like my Ubuntu box.

**Effect of file size on retrieval time from [brightbox.latentsee.com](http://brightbox.latentsee.com/)**
![](../../../assets/brightboxlatentseecom-100x1kb1.png)


Original images | [Theory](/images/2010-07-27-three-of-these-kids/john_rauser-round-trips1.png) | [Ubuntu](/images/2010-07-27-three-of-these-kids/mel_ubuntu_firefox-brightboxlatentseecom-100x1kb1.png) | [Windows 7](/images/2010-07-27-three-of-these-kids/mel_windows7_firefox-brightboxlatentseecom-100x1kb1.png) | [Mac OS X](/images/2010-07-27-three-of-these-kids/mel_osx_firefox-brightboxlatentseecom-100x1kb1.png)


I'm very curious about these differences. It takes the same time for my Mac to retrieve any file up to 67KB in size from Slicehost. Have they tuned their TCP stack differently? Why then does Ubuntu behave similarly against both Slicehost and Brightbox? Is everyone conforming to the RFCs?

I'd love to hear if people can reproduce these results.

**You can experiment with LatentSee using your web browser.**
- [USA: slicehost.latentsee.com](http://slicehost.latentsee.com/)
- [UK: brightbox.latentsee.com](http://brightbox.latentsee.com/)
- [AUS: ultraserve.latentsee.com](http://ultraserve.latentsee.com/)

You can also put [latentsee.php](http://github.com/mbailey/latentsee) on your Apache webserver to test your own servers (be sure to disable compression on the vhost).
