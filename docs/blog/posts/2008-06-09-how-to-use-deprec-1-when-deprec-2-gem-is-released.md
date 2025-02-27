---
author: mbailey
comments: false
date: 2008-06-09 14:16:41+00:00

slug: how-to-use-deprec-1-when-deprec-2-gem-is-released
title: How to use deprec-1 when deprec-2 gem is released
wordpress_id: 23
categories:
- capistrano
- deprec
- ruby on rails
---

*[2013-12-19 I've not done any work on deprec in the past few years]*

deprec-2 preview has been available at [www.deprec.org](www.deprec.org) for a
while now and is quite stable. When I release it as a new version of the deprec
gem it's going to cause users of deprec-1 to see errors. I recommend using
deprec-2 for new installations but understand that some people will want to
continue using deprec-1 for legacy systems. In preparation for release of
deprec-2.0.0 I've some minor modifications so that deprec1 and deprec2 co-exist
on the same machine.

To continue using deprec-1.x, install deprec-1.9.3:

```bash
$ sudo gem install --version 1.9.3 deprec
```

Update your projects deploy.rb:
```ruby
require 'rubygems'
gem 'deprec', '< 1.99'
require 'deprec'
```

Adding the following to your .caprc will load the correct version of deprec
based on the version of Capistrano you're using:

```ruby
require 'rubygems'
gem 'deprec', '< 1.99' unless respond_to?(:namespace)
gem 'deprec', '>= 2.0.0' if respond_to?(:namespace)
require 'deprec'
```

You can call capistrano 1 with the command:

```sh
cap _1.4.2_ show_tasks
```

or create an alias by putting the following in your .profile:

```sh
alias cap1="`which cap` _1.4.2_"
```

This will allow you to use the following:

```sh
cap1 show_tasks
```

If everything's working you'll see the deprec tasks listed.
