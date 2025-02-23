---
author: mbailey
comments: true
date: 2011-02-20 02:31:43+00:00

slug: json-with-ruby-and-rails
title: JSON with Ruby and Rails
wordpress_id: 129
categories:
- json
- ruby on rails
---

JSON is a beautiful format for storing objects as human readable text. It’s
succeeded where XML has failed. Not only is it not shit, it’s actually quite
good! But don’t just take my word for it, have a look at some of the “cool”
ways you can generate and consume JSON.


### Ruby support for JSON

Ruby's JSON library makes parsing and generating JSON simple.

**Converting between hash and json in Ruby**
```irb
$ irb
>> require 'json'
=> true
>> json_text = { :name => 'Mike', :age => 70 }.to_json
=> "{\"name\":\"Mike\",\"age\":70}"
>> JSON.parse(json_text)
=> {"name"=>"Mike", "age"=>70}
```


### HTTParty helps with communicating with RESTful services

Here we grab a record from Facebook.

**Retrieve a JSON Resource**
```irb
$ irb
>> require 'awesome_print'
=> true
>> require 'json'
=> true
>> require 'httparty'
=> true
>> ap JSON.parse HTTParty.get('https://graph.facebook.com/Stoptheclock').response.body
{
                  "about" => "Abolish the 28 Day Rule for Victorian Shelters\n\nhttp://stoptheclock.com.au\n\ninfo@stoptheclock.com.au",
               "category" => "Community",
                "founded" => "2010",
           "is_published" => true,
                "mission" => "To bring an end to the law requiring Victorian shelters to kill healthy adoptable cats and dogs after four weeks.",
    "talking_about_count" => 3,
               "username" => "Stoptheclock",
                "website" => "http://stoptheclock.com.au",
        "were_here_count" => 0,
                     "id" => "167163086642552",
                   "name" => "Stop The Clock",
                   "link" => "http://www.facebook.com/Stoptheclock",
                  "likes" => 5517
}
=> nil
```


### HTTParty gets Classy

**Creating a simple class allows you to DRY things up a bit**
```irb
$ irb
>> require 'httparty'
=> true
>> class Facebook
>>   include HTTParty
>>   base_uri 'https://graph.facebook.com/'
>>   # default_params :output => 'json'
?>   format :json
>>
?>   def self.object(id)
>>     get "/#{id}"
>>   end
>> end
=> nil
>>
>> require 'awesome_print'
>> ap Facebook.object('Stoptheclock').parsed_response
{
                  "about" => "Abolish the 28 Day Rule for Victorian Shelters\n\nhttp://stoptheclock.com.au\n\ninfo@stoptheclock.com.au",
               "category" => "Community",
                "founded" => "2010",
           "is_published" => true,
                "mission" => "To bring an end to the law requiring Victorian shelters to kill healthy adoptable cats and dogs after four weeks.",
    "talking_about_count" => 3,
               "username" => "Stoptheclock",
                "website" => "http://stoptheclock.com.au",
        "were_here_count" => 0,
                     "id" => "167163086642552",
                   "name" => "Stop The Clock",
                   "link" => "http://www.facebook.com/Stoptheclock",
                  "likes" => 5517
}
=> nil
```


### Rails support for JSON


ActiveSupport::JSON knows how to convert ActiveRecord objects (and more) to
JSON. Simone Carletti explains [how this
differs](http://www.simonecarletti.com/blog/2010/04/inside-ruby-on-rails-serializing-ruby-objects-with-json/)
from the standard lib.

```ruby
## Encode
json = ActiveSupport::JSON.encode(object) # extra methods like :include
json = Offering.first.to_json(:include => :outlet, :methods => [:days_waiting])

## Decode
ActiveSupport::JSON.decode(json)
```


### Rails3 niceness

Adding JSON to your Rails3 app doesn't require a lot of extra code. You can
specify method calls and associated objects to include as well as restrict the
attributes returned. Simple eh?

```ruby
class PostController < ApplicationController
  respond_to :json, :html, :jpg, :xml

  def index
    respond_with(@posts = Post.all),
                   :methods => [:average_rating],
                   :include => :comments
  end

  def show
    respond_with(@post = Post.find(params[:id])), :only => [:name, :body]
  end

end
```


### Posts in this series

* [JSON from the Command Line](2011-02-19-json-from-the-command-line.md)
* [JSON from Javascript](2011-02-19-json-from-javascript.md)
* [JSON with Ruby and Rails](2011-02-20-json-with-ruby-and-rails.md)
* [JSON in your Web Browser](2011-02-20-json-in-your-web-browser.md)
