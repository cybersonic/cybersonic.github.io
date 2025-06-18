---
layout: post
title:  "Ternary Operations and CFML"
uid:	"53D9FC97-4540-42A2-9A01446166958F46"

categories: railo,coldfusion,cfml
permalink: ternary-operations-and-cfml
---
<p>
I have been doing a lot of JavaScript development recently and finally got my head round Ternary operations. Something that Railo Server has had for a while and I think was introduced to Adobe <del>CF8</del> CF9 a while ago too. I just never got round to making it part of my standard coding practices, so I thought I would share. 
</p>
<p>
If you have been doing this for a while, no need to point and laugh at me, but if you haven't, let me explain. 
</p>

<p>
In your code you get to points where you have some code that looks like this:
<br>
<code>
<cfif MyVar EQ "something">
	<cfset myResult = 1>
<cfelse>
	<cfset myResult = 0>
</cfif>
</code>
</p>

<p>
When I see that, I tend to think, what is the fastest way to do this? What makes more sense? In the code above, in *theory* the variable myResult will always be created, but since it is always created, why have the cfelse statement?
</p>
	
<p>
I started coding in this manner subsequently:
<br>
<code>
	<cfset myResult = 0>

	<cfif MyVar EQ "something">
		<cfset myResult = 1>
	</cfif>	
</code>
</p>
<p>
This way the myResult variable is always set to a "default" and only modified if the <cfif> statement becomes true. For some reason this makes me feel happier and that the code is more robust (and of course, there is less of it).
</p>	

<p>

With a ternary operation, you can even reduce ALL that code (omg! 4 lines of code!) into a single line:
<br>
<code>
	<cfset myResult = MyVar EQ "something" ? 1 : 0>	
</code>
</p>	

<p>
The code above now is all in one line. The whole logic relating to the myResult variable is neatly encompassed in one line. Suddenly I feel so much happier.
</p>