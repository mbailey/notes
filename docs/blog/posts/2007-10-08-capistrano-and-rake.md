---
author: Mike Bailey
comments: true
date: 2007-10-08 03:30:11+00:00

slug: capistrano-and-rake
title: Capistrano and Rake
wordpress_id: 20
categories:
- capistrano
- deprec
- ruby on rails
---

Last night I read the chapter on automation in Tom Limoncelli's book, [Time
Management for System Administrators][TMFSA]. He spent a lot of time extolling
the virtues of [Make][make] and how useful it can be in automating sysadmin
tasks. Rails makes [good use of Rake][good-use-of-rake] (think 'ruby-make') to
specify administrative tasks. Make/Rake let you specify dependencies in your
tasks and by checking file timestamps you can avoid running tasks
unnecessarily. This has given me an idea for a change to the way deprec works.

[TMFSA]: http://www.amazon.com/Management-System-Administrators-Thomas-Limoncelli/dp/0596007833/ref=pd_bbs_sr_1/104-0447090-6403929?ie=UTF8&s=books&qid=1191812320&sr=8-1
[make]: http://www.mtsu.edu/~csdept/FacilitiesAndResources/make.htm
[good-use-of-rake]: http://www.railsenvy.com/2007/6/11/ruby-on-rails-rake-tutorial

It would be nice if I could restart mongrel on the server using the same
command as I use in Capistrano. I'm not suggesting using Rake from my
workstation but rather to have many of deprecs cap tasks call a Rake task on
the server. So 'cap deprec:mongrel:restart' would call 'rake
deprec:mongrel:restart' on the server(s).

There would be two main benefits to this.

Firstly, all deprec tasks would be available from the command line on the
target host (obviously some bootstrapping would be required to install Rake,
Ruby, etc initially). While I prefer not to have to log in manually to each of
the servers in a cluster, there are times when I'm logged in and would like to
be able to run tasks locally.

A second benefit is that we could take advantage of dependencies. Compiling
PHP, after Apache has already been installed, will no longer cause Apache to be
recompiled. Installing Subversion, when Apache has not already been installed,
will cause it to be installed. This will reduce the amount of time tasks take
to run (which is non-trivial when it involves compiling the likes of openssl!)

Back in May 2007, Bradley Taylor of [Railsmachine](http://railsmachine.com/)
released a nice gem called [Machinify][machinify]. It's a set of Rake tasks
that will install a Rails stack on Ubuntu. It's very nicely written and quite
readable. I considered whether I should make deprec dependent on Machinify but
as it lacks some of the tasks I want (install, nginx, postgres, etc) I think it
would be better for deprec come with its own Rake tasks.

[machinify]: http://blog.railsmachine.com/2007/5/25/ann-machinify-stack-toolkit

So, it's very tempting to re-architect deprec2 but another thing to consider is
this: would we be better off with a working deprec2 next week or a re-designed
deprec2 at some later point? I think working code is a better result than ideas
that won't get implemented in the available timeframe.

One issue with calling remote rake tasks via Cap is dealing with interactive
dialogs. deprec currently deals with this by listening for certain output from
the remote call. I can't see why deprec couldn't simply call the remote rake
task and listen for the same output. This would allow deprec tasks to be
extracted into rake tasks.

So my current thinking is to press on with deprec2 development and then extract
the tasks into Rake tasks at some future point.
