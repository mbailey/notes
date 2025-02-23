---
author: mbailey
comments: true
date: 2010-06-11 08:49:42+00:00

slug: asset-fingerprinting-with-paperclip
title: Asset Fingerprinting with Paperclip
wordpress_id: 36
categories:
- ruby on rails
- webperformance
---

Update: My Asset Fingerprinting patch was included in paperclip-2.3.4 in Oct 2010. Thanks jyurek!

One of the tricks to improving the performance of your website is to optimize
caching. By instructing browsers and proxies to cache assets that don't change
very often (css, images, javascript), we can reduce page load time as well as
bandwidth costs.

By instructing browsers and proxies to never check for updated versions of
cached assets we can further speed things up. [Google recommend the use of
fingerprinting][G1] to enable dynamic updating of cached content. This simply
means including a fingerprint of the resource in it's URL so the URL gets
updated when the resource changes.

[![paperclip](../images/2010-06-11-asset-fingerprinting-with-paperclip/paperclip1.png)][Paperclip]

[Paperclip][Paperclip] is a popular file attachment plugin for Ruby on Rails.
It was a perfect candidate for fingerprinting support as it generates resource
URLs from stored data.

Enabling it is as simple as:

1. Install paperclip-2.3.4
1. Add an :attachment_fingerprint column to your database
1. Include :fingerprint in the path for your attachment (see below)

```ruby
has_attached_file :avatar,
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :path => "users/:id/:attachment/:fingerprint-:style.:extension",
  :storage => :s3,
  :s3_headers => {'Expires' => 1.year.from_now.httpdate},
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :use_timestamp => false</code>
```

This enables us to set far future expire headers so that browsers don't need to
check for a newer version. If a change does occur, say because a user uploads a
new avatar, the new filename will be rendered in your html and the cached
version will be ignored.

The example above will set Expires headers in S3. If you're using local storage
you can configure your webserver to do something similar.

We disable the timestamped query string because some proxies refuse to cache
items with query strings.

Fingerprinting support was added to [paperclip-2.3.4][Paperclip] on 6 Oct 2010.

For more info on optimizing for caching:

[http://code.google.com/speed/page-speed/docs/caching.html](http://code.google.com/speed/page-speed/docs/caching.html)

[Paperclip]: http://github.com/thoughtbot/paperclip
[G1]: http://code.google.com/speed/page-speed/docs/caching.html#LeverageBrowserCaching
