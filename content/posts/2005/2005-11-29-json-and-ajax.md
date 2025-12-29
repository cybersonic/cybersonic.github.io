---
layout: post
title:  "JSON and Ajax"
uid:	"8A97A325-C265-26E9-2BDC00C028925B8F"

categories: coldfusion,webdev,ajax
permalink: json-and-ajax
---
When you are doing AJAX applications, you pass data back to the calling page, some of the examples I have seen are in XML and you then do some parsing of that XML in JavaScript.

I found the <a href="http://www.crockford.com/JSON/index.html">JSON</a> (JavaScript Object Notation) library a while ago, but finally managed to use it. Basically it gives you a way to pass complex objects in JavaScript back so you dont need to parse them as such.

There are is also <a href="http://jehiah.com/projects/cfjson/">UDF's</a> for coldfusion that can convert CF objects to JavaScript objects. Something like WDDX  (which I am also going to give a little whirl in my testing of ajax libraries and methods)