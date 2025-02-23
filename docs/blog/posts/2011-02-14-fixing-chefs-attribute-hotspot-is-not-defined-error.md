---
author: Mike Bailey
comments: true
date: 2011-02-14 13:26:04+00:00

slug: fixing-chefs-attribute-hotspot-is-not-defined-error
title: Fixing Chef’s “Attribute hotspot is not defined” error
wordpress_id: 84
categories:
- chef
- deployment
---

I was trying to install Opscode's Chef using the "[Bootstrap Chef Rubygems Installation](http://wiki.opscode.com/display/chef/Bootstrap+Chef+RubyGems+Installation)" method. It was failing hard with something about a 'hotspot'.

```bash
[mbailey@island chef]$ sudo chef-solo -c /etc/chef/solo.rb -j ~/chef.json -r http://s3.amazonaws.com/chef-solo/bootstrap-latest.tar.gz
[sudo] password for mbailey:
[Mon, 14 Feb 2011 15:20:34 +1100] INFO: Setting the run_list to ["recipe[chef::bootstrap_server]"] from JSON
[Mon, 14 Feb 2011 15:20:34 +1100] INFO: Starting Chef Run (Version 0.9.12.1)
[Mon, 14 Feb 2011 15:20:34 +1100] ERROR: Running exception handlers
[Mon, 14 Feb 2011 15:20:34 +1100] ERROR: Exception handlers complete
/usr/local/lib/ruby/gems/1.9.1/gems/mbailey-chef-0.9.12.1/lib/chef/node/attribute.rb:428:in `method_missing': Attribute hotspot is not defined! (ArgumentError)
```

There's a bug in [ohai-0.5.8 ](https://rubygems.org/gems/ohai)(19 Oct 2010) that is fixed in HEAD. The simple steps fixed my problem and allowed me to install Chef.

```bash
$ git clone git://github.com/opscode/ohai.git
$ cd ohai
$ sudo rake install
gem install pkg/ohai-0.5.8 # but I wanted sudo gem install
Successfully installed ohai-0.5.8
1 gem installed
$ sudo gem install pkg/ohai-0.5.8.gem
Successfully installed ohai-0.5.8
1 gem installed
```

I hope this saves you some time and frustration.
