---
author: mbailey
comments: true
date: 2011-06-14 04:42:02+00:00

slug: rails-web-api-versioning
title: Rails Web API Versioning
wordpress_id: 284
categories:
- dev
- ruby on rails
- web services
---

*[2013-12-18 Why was so I attracted to the idea of versioning web APIs? I've never needed this.]*

One way to make different versions of a web service available from the same webserver is to allow clients to prepend a version identifier to the URI path. There's some [discussion about the best way to use](http://stackoverflow.com/questions/389169/best-practices-for-api-versioning) this but I like to default to no version identifier in URIs.

[Passenger](http://www.modrails.com/documentation/Users%20guide%20Apache.html#deploying_rack_to_sub_uri) makes it easy to run different versions of your Rails web api alongside each other.

* http://brandish.local/customers.json
* http://brandish.local/v1/customers.json
* http://brandish.local/v2/customers.json


### Update Your Webserver Config

[Passenger](http://www.modrails.com/documentation/Users%20guide%20Apache.html#deploying_rack_to_sub_uri) allows you to direct traffic to different instances of your app. Here I'm serving brandish_v2 if no version identified is included in the URI.

>     <code># /etc/apache2/sites-available/brandish
>     <VirtualHost *:80>
>       ServerName brandish.local
>       CustomLog /var/log/apache2/brandish_access_log combined
>       RackEnv development
>
>       DocumentRoot /srv/brandish_v2/public
>       RackBaseURI /v1
>       RackBaseURI /v2
>       <Directory /srv/brandish_v2/public/v1>   
>         Options -MultiViews  
>       </Directory>
>       <Directory /srv/brandish_v2/public/v2>   
>         Options -MultiViews  
>       </Directory>
>     </VirtualHost>
>     </code>


### Symlink public/ into your DocumentRoot

This is the only tricky bit. Passenger expects the RackBaseURI's you used in
the web config to point at symlinks to the public/ directories of the different
versions of your apps.

>     <code>ln -s /srv/brandish_v1/public -> /srv/brandish_v2/public/v1
>     ln -s /srv/brandish_v2/public -> /srv/brandish_v2/public/v2
>     </code>


**Note** Passenger was failing for me because it expected application.rb to be in controllers directory. I fixed it by creating a symlink from application_controller.rb to application.rb. I'm a bit confused as I thought that had been [fixed in recent versions of Passenger](http://geminstallthat.wordpress.com/2009/03/01/passenger-with-rails-23-application-missingsourcefile/). Maybe the RailsBaseURI code is not up to date.
