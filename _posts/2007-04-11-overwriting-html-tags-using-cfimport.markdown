---
layout: post
title:  "Overwriting HTML tags using cfimport"
uid:	"8A9A73EA-F99A-BF2F-60A92B68F484E0BB"
date:   2007-04-11 11:08 AM +0000
categories: webdev
---
Here is a quick, ColdFusion tip about using cfimport that I learned many years ago in some ColdFusion training I did for CFMX 6, but I guess its still relevant.

You can re-implement any HTML tag using a custom tag by using cfimport. To do this you have to firstly create a directory where you are going to store your custom tags, so lets say /htmltags under your webroot. Then at the top of the page that you are going to be doing the replacement in put the following:

<code>
<cfimport prefix="" taglib="/htmltags">

<a href="somelink">I dont like how Links are done</a>

</code>

Now in your /htmltags add a file called a.cfm with the following content:

<code>
<cfparam name="attributes.href" default="">
<cfif ThisTag.executionmode IS "start">
<a href="<cfoutput>#attributes.href#</cfoutput>" style="overWrittenStyle">
</cfif>
<cfif ThisTag.executionmode IS "end">
</a>
</cfif>
</code>

And you will get the style attribute added. This is just an example, you could loop through all the attributes and output them in the tag, and do whatever you like of course.

(now back to document writing... fun fun fun)