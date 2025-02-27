---
author: Mike Bailey
comments: false
date: 2007-05-14 01:38:38+00:00

slug: enable-ssh-agent-forwarding-for-capistrano
title: Enable SSH agent forwarding for Capistrano
wordpress_id: 32
categories:
- capistrano
- ruby on rails
---

Having to repeatedly enter passwords is a drag. And enabling password based SSH
login to your SVN servers is a security risk. So I'm pretty excited that Chris
Andrews implemented SSH agent forwarding into
[net-ssh-1.1.0](http://weblog.jamisbuck.org/2007/5/1/net-ssh-1-1-0).

Update to the latest version of net-ssh with:

```
$ sudo gem update net-ssh
```

To enable it, put the following into your ~/.caprc:

```ruby
ssh_options[:forward_agent] = true
```

This stopped me getting prompted for a password by my subversion every time I ran 'cap deploy'.
