---
layout: post
title:  "Model Glue Tips Part 2: Use Naming conventions for your Event Handlers."
date:   2007-08-11 11:08 AM +0000
categories: model-glue
---
Continuing from the <a href="http://www.markdrew.co.uk/blog/index.cfm/2007/8/10/Model-Glue-Tips-Part-1-Separate-out-your-ModelGlue-file" title="Mark Drew (Redux)- cf_etc...: Model Glue Tips Part 1: Separate out your Model-Glue file">previous post</a>, I wanted to talk about naming conventions, I am sure everyone has a way of doing this and  will argue (a bit like IDE or OS wars) till they are blue in the face. This is the way I try and do it, maybe because I started out using fusebox, but it makes sense to me.

If you have split out your Model Glue file as mentioned in my previous post, you will already have event-handlers that deal with different areas of your application, why not do the same with the event handlers, then you can see exactly what you are dealing with.

For example, if we are doing Security related functions (in my ModelGlue_Security.xml file) it makes sense to name the event-handlers something like "security.dologin" or "security.dologout" then you will be able to see exactly what part of the application you are dealing with.

I hope this makes sense and is useful!