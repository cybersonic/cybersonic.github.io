---
layout: post
title:  "CFEclipse: Getting the code via CVS"
uid:	"8A98ACDF-A6C9-9BEE-F312028FE5D37F34"
date:   2006-06-06 11:06 AM +0000
categories: cfeclipse
permalink: cfeclipse-getting-the-code-via-cvs
---
Some people have mentioned that they want to know how to get their hands on the code of <a href="http://www.cfeclipse.org">CFEclipse</a>. You can find a nice guide on how to do it over <a href="http://cfeclipse.org/go/documentation/developer-docs/checking-out">here</a>

One thing to note is that the anonymous username is "guest" and the password is "" (yeah, blank) but what you should do is tick the "save password" tickbox (its unticked by default) otherwise it will annoy you muchly (it looks like you have put the wrong password but basically its asking for your password for each file)

Once you have downloaded it into Eclipse, you can then open up the plugin.xml and click "Debug Eclipse application" and it will open up a version of eclipse for you running the code version of CFEclipse.

When you do edits and you are happy with your code you can right click at the root of your project, click Team -> Create Patch, this will create a text file that you can email over to me (with maybe some description of your changes and how it should work) and I can check it works and then checkin the code on your behalf.