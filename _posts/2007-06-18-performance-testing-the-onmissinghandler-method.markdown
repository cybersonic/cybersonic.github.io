---
layout: post
title:  "Performance testing the onMissingHandler method"
date:   2007-06-18 11:08 AM +0000
categories: webdev
---
I was having a conversation with another developer at work about using the new CF8 onMissingHandler method for components. The issue we were debating was that in Java, using the try/catch or basically error trapping should be slighly more expensive than without it and if in-fact the onMissingMethod was trapping missing method errors, then there should be a big overhead, so it would mean that depending on it would't be a good thing.

From what I understand, when ColdFusion compiles CFML code down to Java, each of the functions doesn't get rendered to a java method, but rather to an inner class, so the onMissingMethod is actually another inner class so there should be no overhead.

I did a bunch of tests (<a href="/blog/enclosures/MissingHandlerTest.zip">Here is the code on the measurement and reporting</a>) and it looks like that onMissingMethod is totally safe to use (performance wise)!

Another great reason to use CF8!

<img src="http://www.markdrew.co.uk/blog/images//MissingHandler.png">