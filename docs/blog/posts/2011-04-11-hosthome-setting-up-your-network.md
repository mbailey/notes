---
author: mbailey
comments: true
date: 2011-04-11 16:01:56+00:00

slug: hosthome-setting-up-your-network
title: 'host@home: Setting Up Your Network'
wordpress_id: 207
categories:
- deployment
- host@home
- virtualization
---

*[2013-12-19 I'm not currently hosting @ home but Snowden leaks have made me rethink]*

![My Billion 7300 modem/router does a simple task well](../../../assets/billion_bpac_7300.jpg)
*My Billion 7300 modem/router does a simple task well*

My first step on the path to hosting @ home was to get a good Net connection. I
selected a Naked ADSL plan from Australian provider
[Internode](http://internode.on.net). Australians pay crazy high prices for
Internet but $60 a month for 150GB (combined download/upload) doesn't seem too
steep. In order to host @ home I needed to disable the [Internode network
firewall](https://secure.internode.on.net/myinternode/sys2/aclchange) to enable
incoming traffic.

Internode gives me a dynamic IP (which I actually prefer). Most DSL routers
come with support for dynamic DNS built in and mine does a great job of
updating my DNS entry within seconds of my IP changing. All other domains
hosted here will have CNAMEs pointing this host only a single hostname needs to
be updated when my IP changes.

When my modem light glowed steady on Friday I knew I could get started
configuring the router. I'm fond of Billion modem/routers which [sell for
around
$60](https://www.warcom.com.au/shop/flypage/adsl-modem-router/Billion/1465).


## Configuring the router

ADSL Routers tend to be pretty easy to configure via their web interface
providing you remember the admin password or have something to poke in the hole
to reset it to factory defaults. The other thing you have to work out is the IP
address the modem is  running on. For some reason 192.168.0.1 is not the
universal standard - my modem was on 192.168.1.254.  Go figure. Here's what I
do when setting up a new host@home network.

  * Change root password from the factory default
  * Configure DHCP to handout my ISP's nameservers and my own domain
  * Configure DHCP to IPs from 100 - 200 (I reserve others for manual addressing)
  * Forward incoming connections to a gateway IP (which forwards traffic using [HAProxy](http://haproxy.1wt.eu/))
  * Configure dynamic dns

![ADSL router updates dynamic dns entry when IP changes](../../../assets/router_dyndns.jpeg)
*ADSL router updates dynamic dns entry when IP changes*

I installed apache2 on my gateway host to test external access. You should be
able to access it here: [home.failmode.com](http://home.failmode.com/)


## In the next installment...

The next post will cover setting up HAProxy on the gateway host to so that
incoming requests can be routed to the correct internal servers.
