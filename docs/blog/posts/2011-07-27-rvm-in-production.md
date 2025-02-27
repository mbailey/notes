---
author: mbailey
comments: true
date: 2011-07-27 12:01:05+00:00

slug: rvm-in-production
title: RVM in Production
wordpress_id: 369
categories:
- systems
---

[update] Aussie Rubyists are [discussing this on rails-oceania@googlegroups.com](https://groups.google.com/group/rails-oceania/browse_frm/thread/3b4854b167617188?hl=en)

I'm a relative newcomer to [Ruby Version
Manager](https://rvm.beginrescueend.com/) (RVM) because I haven't needed it
till now.  Last week I started work on a project that uses
[JRuby](http://www.jruby.org/) and RVM is now a part of my tool chain.

> "RVM is a command line tool which allows us to easily install, manage and
> work with multiple ruby environments from interpreters to sets of gems."

[https://rvm.beginrescueend.com/](https://rvm.beginrescueend.com/)

I think it's a pretty amazing project and [Wayne E. Seguin](http://www.workingwithrails.com/person/7192-wayne-e-seguin) deserves respect for gifting us with such a great tool. I think it's great for dev but...

**I'm just not sure I want RVM in Production**

As I said, I'm new to RVM. I don't know it that well yet so I'm not qualified
to speak about it with any degree of authority. The idea of running rvm on
production servers seems wrong to me because it seems to dump a load of
non-standard complexity onto sysadmins while ignoring the unix idioms and
conventions they know.

**Do we really need to be so specific about versions?**

In an age of virtualisation and cloud computing, a production server probably
shouldn't need to have more than one version of Ruby installed. RVM makes it
easy for devs to specify that this web app uses ruby-1.9.2-p180 while that one
uses ruby-1.9.2-p290. I'm just not sure they should be expecting operations to
be providing them with such specificity.

**Don't sysadmins have enough to deal with already?**

Developers may spend months or years in the same cosy environment working on
software they know backwards. Sysadmins deal with chaos everyday. They put out
fires, multitask and deal with hundreds of different bits of software. What
makes this possible is conventions within the unix world. Logs go here, start
scripts there, this is the library load path, etc... System administration can
be like working in a busy kitchen. Special off menu orders make their work
harder and are not appreciated!

I just wonder whether developers demanding specific Ruby patch levels will come
across like the folks ordering coffee from LA Story?

[Update] I was running into a few difficulties using RVM so at least for now,
I've settled on a very simple use for RVM on my workstation. Bundler does a
great job managing my gems so I've set RVM to use system Ruby and I'll only use
a .rvmrc in projects that are not using my default of ruby-1.9.2.
