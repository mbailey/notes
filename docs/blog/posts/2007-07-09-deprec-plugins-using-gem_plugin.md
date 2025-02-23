---
author: Mike Bailey
comments: true
date: 2007-07-09 01:03:27+00:00

slug: deprec-plugins-using-gem_plugin
title: Deprec Plugins using gem_plugin
wordpress_id: 11
categories:
- deprec
---

I just added automatic plugin loading to deprec2 using Zeds [gem_plugin][gem
plugin] gem. Now, a number of people have been asking if deprec will support
other linux distro's (and even other OS's!). While I'm not interested in
implementing them myself (until I get sick of Ubuntu) I love freedom so decided
to extract all Ubuntu specific functionality into a plugin and allow others to
write their own plugins.

You can now write a plugin that will be loaded automatically by deprec2 with no
manual intervention or configuration required by the user. Follow the tutorial
on the gem_plugin site but here's the core of it:

```ruby
  setup_gem(name, version) do |spec|
    spec.summary = "The deprec_ubuntu GemPlugin"
    spec.description = spec.summary
    spec.author="Mike Bailey"
    spec.add_dependency('gem_plugin', '>= 0.2.2')
    spec.add_dependency('deprec', '>= 2.0.0')
    spec.files += Dir.glob("resources/**/*")
  end
```

Make your gem dependent on gem_plugin and deprec. The way this works is clever.
When deprec starts, it requires gem_plugin which goes and looks through the
other locally installed gems. If it finds any gems that have gem_plugin and
deprec as dependencies, it loads their init.rb file.

So installed a third party plugin to support a new distro for deprec be as simple as:

```
sudo gem install deprec_beos
```

Note: I'm still hacking on deprec2 - hoping for a preview release this week!

[gem plugin]: http://mongrel.rubyforge.org/docs/gem_plugin.html
