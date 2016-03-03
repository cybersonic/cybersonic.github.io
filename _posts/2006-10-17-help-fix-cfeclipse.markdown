---
layout: post
title:  "Help Fix CFEclipse"
date:   2006-10-17 11:06 AM +0000
categories: cfeclipse
---
Yep, I have been asked many times how people that dont have any Java experience can help with the development of CFEclipse.

Well, here is a quick one for you, only knowledge of RegEx (which I have none) is required.

There is a <a href="http://trac.cfeclipse.org/cfeclipse/ticket/15">bug in trac.cfeclipse.org</a> at the moment which is very annoying, if you have a statement like:

<code>
<cfif ListGetAt(i,1,"=") neq "errorType">

</cfif>
</code>

CFEclipse reports an error that an attribute is not there. This is because the RegEx to find attributes in a tag is not working correctly, so if you can find a solution to this bug, you will be helping heaps!

The RegEx should be able to cope with attributes though:
<code>
<cfparam name="url.item" default="thingy" />
</code>

Just so you know, the actual reg ex is:
<code>
\s*(\w*)\s*=\s*('[^']*'|"[^"]*")
</code>