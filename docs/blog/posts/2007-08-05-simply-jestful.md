---
author: Mike Bailey
comments: true
date: 2007-08-05 07:29:22+00:00

slug: simply-jestful
title: Simply Jestful
wordpress_id: 15
categories:
- javascript
- ruby on rails
---

**Update**: I'm using [jester.js version 1.3](http://giantrobots.thoughtbot.com/assets/2007/6/8/jester-1.3_1.zip).

Jester is basically
[ActiveResource](http://ryandaigle.com/articles/2007/3/14/rest-activeresource)
for javascript. It's amazing. I love it! With *almost* no changes to my
scaffold_resource generated controllers I was able to work on my models via
javascript in my web browser.

All I had to do was download the javascript and put it in public/javascripts/

I put this in my layout: <%= javascript_include_tag 'jester.js' %>

Then I was able to do this in [Firebug](http://www.getfirebug.com/):

```irb
>>> Base.model('User')
>>> Base.model('Comment')
>>> c = Comment.create({comment: 'i love jester'})
POST http://localhost:3000/comments.xml (381ms)prototype.js (line 866)
Object _name=Comment _format=xml _singular=comment
>>> c.id
12
>>> c.user
Object _name=User _format=xml _singular=user _plural=users
>>> c.user.display_name
"Mike"
```

Use XML, not JSON. The Rails implementation of .to_json() is not as fully featured as .to_xml().

This [patch](http://dev.rubyonrails.org/changeset/7156) was accepted into core in June. I used it to patch my rails-1.2.3 installation. It stops the following from failing:

```ruby
format.xml  { render :xml => @post.to_xml(:include => :comments, :methods => [:obfuscated_email]) }
```

Jester is documented in a series of [release](http://giantrobots.thoughtbot.com/2007/4/2/jester-javascriptian-rest) [announcement](http://giantrobots.thoughtbot.com/2007/4/16/jester-1-1-asynchronous-and-more) [blog](http://giantrobots.thoughtbot.com/2007/4/30/jester-1-2-flexible-rest) [posts](http://giantrobots.thoughtbot.com/2007/6/11/jester-1-3-jsonic-rest). I recommend reading them in order.
