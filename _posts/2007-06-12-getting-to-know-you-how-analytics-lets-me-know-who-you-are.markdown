---
layout: post
title:  "Getting to know you! How analytics lets me know who you are."
date:   2007-06-12 11:08 AM +0000
categories: blogging
---
I am sure lots of people use google analytics on their site to track usage. Its very good for conversion funnels and what have you but it doesn't really have the immediate effect of reporting that I like for blog posts. 

I have to admit, I am a nosey bugger. I want to know when people are coming to my blog and what they are looking at. I want to know WHO is on my site, I know you dont mind, of course, its only me knowing this stuff right.... right?

So, I have been using a service called <a href="http://report.reinvigorate.net/">reInvorate </a> for a long while. It was beta, closed down, become beta again. It has a great feature of showing you who is on your site at the present moment, which is fine if you like knowing that everyone is called "X88893-333-5555"... but if you are using Ray "The Jedi" Camden's BlogCFC, people can ask for the website to remember their details.  

Now on a tangent, ReInvigorate have released a little tool for Windows and Mac called <a href="http://report.reinvigorate.net/snoop">Snoop</a> which simply displays people coming onto your site. 

The problem is that they are still pretty anonymous, but I checked something out over at the ReInvigorate site about adding <a href="http://report.reinvigorate.net/name_tags">names to these sessions </a>

And it turns out that its pretty easy to do it in BlogCFC, you just have to add the following code before the call to ReInvigorate:

<code>
<cfif isDefined("cookie.blog_name")>
var re_name_tag = "#blog_name#";
</cfif>
<cfif isDefined("cookie.blog_email")>
var re_context_tag="mailto:#cookie.blog_email#";
</cfif>
re_("your_reInvigorate_id");
</code>

And then you can finally see who is coming to your site.

Nice to see you again too! :)