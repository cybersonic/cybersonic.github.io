---
layout: post
title:  "Blogging from TextMate to BlogCFC"
date:   2006-10-31 11:06 AM +0000
categories: blogging
---
Blogging is great, but the problem as many people that travel with laptops know is that you tend to write your blog post in a text document, save it to your desktop (or wherever) and then when you are online you can then open it, copy and paste it, paste the title etc etc into your own blog.

You can do that or use one of the many applications that are just for blogging. I am kind of old school, I like tools that can do more than one job (e.g. <a href="http://www.eclipse.org">Eclipse</a> being a great example). My current text editor of choice is <a href="http://macromates.com/">TextMate</a>, not free but its very handy and you can open things straight from the command line, open whole directories (like a project) and as <a href="http://www.forta.com/blog/index.cfm/2006/10/22/cftextmate">Ben Forta mentioned</a> recently there is even a bundle (the way you add extensions) for ColdFusion. 

What has this got to do with blogging then? Well, I discovered today that I can post any text to different blogs, go and get an item, edit it and post it back. This is really handy since I nearly always have it open. 

To set it up check under the Bundles-> Blogging -> Setup Blogs and you can put the name and address of your BlogCFC instance with your username at the front, and the directory of the xmlrpc.cfm file (I am using BlogCFC version 5.5.002 ) as follows:

<code>
MyBLOGCFC		http://yourUsername@www.myblog.com/xmlrpc/xmlrpc.cfm
</code>

Once you have done that, you need to create a new file from template -> Blogging -> Blog Post (HTML) and it will give you a template with "Title:" already entered, you can then type "blog" and press Tab and it will give you either the default blog you have put in there or a list of them (I have a couple, dev and live so it gives me a choice of two). you can then type "cat" and tab and it will also give you a list of all the categories in your blog, select one and you are away.

At the moment there seem to be a few bugs with working with BlogCFC though, that I shall experiment to see if I can find a fix, one of them is that when I post it, it doesn't actually make the blog post live (without re-initing your app) and also the Category doesn't seem to go through and you have to re-enter it in the BlogCFC admin.

I have also noticed a number of errors being reported from  BlogCFC (unrelated to posting with TextMate) to do with categories which I should look into.

Just another great thing you can do with TextMate, apart from coding <a href="http://www.rubyonrails.org/screencasts">Ruby on Rails</a> of course.

UPDATE: I just checked and there is a screencast on how to do this over at the TextMate site, you can check it out here: <a href="http://macromates.com/screencast/blogging_take_two.mov">http://macromates.com/screencast/blogging_take_two.mov</a>