---
author: Mike Bailey
comments: true
date: 2007-10-03 14:42:18+00:00

slug: using-rails-123-with-rails-20-preview-release-installed
title: Using rails-1.2.3 with Rails 2.0 Preview release installed
wordpress_id: 19
categories:
- ruby on rails
---

Rails 2.0 Preview has been released, along with a great summary of
changes it includes:

[http://weblog.rubyonrails.org/2007/9/30/rails-2-0-0-preview-release](http://weblog.rubyonrails.org/2007/9/30/rails-2-0-0-preview-release)

While I was excited to install the gem (gem install rails --source
http://gems.rubyonrails.org) this caused problems went I got back to
developing an existing app even though I had rails-1.2.3 specified in
my environment.rb.

It turns out that the preview release is version 1.2.3.7707 and Rails
considers that to be the most appropriate version to use when I
specify 1.2.3. Not what I was expecting!

A quick fix so your existing apps will still use 1.2.3 is to change this line in their config/boot.rb.

```diff
-rails_gem = Gem.cache.search('rails', "~>#{version}.0").sort_by { |g| g.version.version }.last
+rails_gem = Gem.cache.search('rails', "#{version}.0").sort_by { |g| g.version.version }.last`
```

**Update 2007-10-05**
This morning the very entertaining new [Rails Envy
Podcast](http://www.railsenvy.com/podcast) informed me about
[r2check](http://pastie.caboo.se/private/krcevozww61drdeza13e3a), a script that
checks your existing Rails app and let's you know what you need to do to make
it Rails2.0 ready. It worked for me. Thanks to Mislav Marohnić for saving me
time. :-)
