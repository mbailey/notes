---
author: mbailey
comments: true
date: 2011-02-19 14:18:49+00:00

slug: json-from-javascript
title: JSON from Javascript
wordpress_id: 113
categories:
- javascript
- json
---

JSON is a beautiful format for storing objects as human readable text. It’s
succeeded where XML has failed. Not only is it not shit, it’s actually quite
good! But don’t just take my word for it, have a look at some of the “cool”
ways you can generate and consume JSON.

### JSON support added to Javascript

JSON is an acronym for Javascript Object Notation and while it's designed for
data interchange it's a string containing valid Javascript. While you could
instantiate the object using eval, executing data is like eating off food off
the ground - unhygienic and with unknown side effects. Fortunately support for
JSON was [added to ECMAscript 5](http://ejohn.org/blog/ecmascript-5-strict-mode-json-and-more/) so you can generate and parse JSON without fear.

[Someone on
StackOverflow](http://stackoverflow.com/questions/891299/browser-native-json-support-window-json)
reckons Internet Explorer 8, Firefox 3.5+, Safari 4+, Chrome, and Opera 10+
support native JSON parsing. [Douglas Crockford's
json2.js](https://github.com/douglascrockford/JSON-js) library adds the
standard JSON methods to browsers that lack them. [jQuery's JSON
parser](http://api.jquery.com/jQuery.parseJSON/) makes use of the browsers
native implementation where this is one.


### Enough yakking, time for a demo

This is using native Javascript to generate and consume JSON. You can run this
stuff in Firebug. Sorry, I don't have any CSS to make it look all "firebuggy".
Does anyone know of a Javascript interpreter I can run in a shell?

```javascript
// Basic Javascript
myJSONtext = '{"name":"mike","species":"human"}'

// Parse JSON
reviver = null;
myObject = JSON.parse(myJSONtext, reviver);
myObject.species // => 'human'

// Generate JSON
replacer = null
myNewJSONtext = JSON.stringify(myObject, replacer);
myJSONtext == myNewJSONtext // They should be the same
```


### jQuery support for JSON

Open Firefox to any webpage that loads jQuery (e.g. [jquery.com](http://jquery.com)) and paste this into your Firebug console.

```javascript
// JSONP gets around 'same origin policy'
// jQuery generates randomly named callback function
var returnVal = '';
var ajaxUrl = 'https://graph.facebook.com/goodfordogs?callback=?';
// var ajaxUrl = 'http://localhost:5984/facebook/goodfordogs?callback=?';
$.getJSON(ajaxUrl, null, function(data) {
  alert(data.likes + ' people like '+ data.name);
});

var returnVal = '';
var ajaxUrl = 'https://graph.facebook.com/goodfordogs?callback=?';
// var ajaxUrl = 'http://localhost:5984/facebook/goodfordogs?callback=?';
$.getJSON(ajaxUrl, null, function(data) {
  alert(data.likes + ' people like '+ data.name);
});
```

Web browsers prevent Javascript from sending requests to domains other than the
originating one. So you can't get your AJAX request to simply request a JSON
object from Facebook. A neat way around this is to write script tags to the
document that load a remote javascript file. JSONP lets us specify a callback
that will be called with the resultant JSON. It's easier to show you:

```bash
$ curl graph.facebook.com/goodfordogs?callback=blah
```

```javascript
blah({
   "id": "171644807551",
   "name": "GoodForDogs",
   "picture": "http://profile.ak.fbcdn.net/hprofile-ak-snc4/50503_171644807551_2269219_s.jpg",
   "link": "http://www.facebook.com/Goodfordogs",
   "category": "Local business",
   "website": "http://Goodfordogs.org",
   "username": "Goodfordogs",
   "likes": 902
});
```

jQuery picks a random name for the callback to make things easier for you. In
fact it does a pretty good job of hiding the inner workings of JSONP from you.


Posts in this series:

  * [JSON from the Command Line](../2011/02/json-from-the-command-line/)
  * [JSON from Javascript](../2011/02/json-from-javascript/)
  * [JSON with Ruby and Rails](../2011/02/json-with-ruby-and-rails/)
  * [JSON in your Web Browser](../2011/02/json-in-your-web-browser/)
