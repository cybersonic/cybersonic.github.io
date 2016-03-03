---
layout: post
title:  "Coldfusion handling Java  null's"
uid:	"8A98CFF7-FA3E-ECBD-2AE5F349812FEEFC"
date:   2006-07-12 11:06 AM +0000
categories: reference
---
I have been reading a number of posts how to handle nulls in Coldfusion. Coldfusion doesnt naturally handle a "null" object returned from Java (as far as I can see, I have read a few posts and still no definate answer, so here goes for a couple of tips, just to keep myself sane and to remind myself.

There are two ways that you can handle a null and it depends what the returned object is, firstly lets handle nulls where the returned object might be something simple like a number or a string, the easiest method would be to simplify the variable, so you can trim the result, if it is null, you will get an empty string:

<code>
<cfset myString = CreateObject("java", "com.some.Class").init().getName()>

<cfif Len(myString)>
#myString#
</cfif>
</code>

The second method is used if you  return complex data, such as an Array, Structure or Java Objects themselves:

<code>
<cfset UsersArray = CreateObject("java", "com.some.Class").init().getUsers()>

<cfif isDefined("UsersArray")>
<cfdump var="#UsersArray#">
</cfif>
</code>


If someone has a better method of managing returned nulls from Java, please let me know and I can update this post.