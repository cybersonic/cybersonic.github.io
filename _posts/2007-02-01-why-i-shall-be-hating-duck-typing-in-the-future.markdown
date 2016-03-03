---
layout: post
title:  "Why I shall be hating Duck Typing in the future"
date:   2007-02-01 11:07 AM +0000
categories: coldfusion
---
At <a href="http://www.cfunited.com/">CFUnited 2006</a> there was a lot of talk of DuckTyping* and when I finally <a href="http://blog.cutterscrossing.com/index.cfm/2006/6/30/Day-3">got it</a>, I  adopted it somewhat (only to a level) for some simplicity's sake when writing my own code.

I was just reading a blog post by <a href="http://www.blogoffusion.com/index.cfm/2007/1/31/What-I-did-to-Mach-II">Michael Dinowitz</a> and its got me thinking that this type of coding is going to REALLY annoy me when I implement CFC introspection in CFEclipse.

Lets look at some code and I can explain better, here is a simple basic component:

<code>
	<cfcomponent output="false">
		
	<cffunction name="init" returntype="any">
		<cfreturn this/>
	</cffunction>

	<cffunction name="getSomething" returntype="any">
		<cfargument name="var1" required="false">


		<cfreturn/>
	</cffunction>

	</cfcomponent>
	
</code>

In CFEclipse, when we call this we can do it like so:
<code>
	<cfset myObj = CreateObject("component", "SimpleComponent")>
</code>

We now have <em>myObj</em> set to be a SimpleComponent, great, we can look that up, but what happens if we have two components called SimpleComponent in our project? ColdFusion can deal with this (as it would expect the SimpleComponent to be in the "/" mapping setup in the administrator, the web root, or in the same folder as the calling code.) but CFEclipse can only do two of those, as it wouldn't know about the ColdFusion mapping.

So, lets add another attribute to the component tag (ColdFusion wont mind, I promise!):
<code>
	<cfcomponent output="false" alias="com.coldfusing.cfc.SimpleComponent">
</code>
And now we call our CFC as follows:

<code>
	<cfset myObj = CreateObject("component", "com.coldusing.cfc.SimpleComponent")>
</code>

Great! Now CFEclipse can do a quick scan through all the components looking for the alias! We have set the <em>myObj</em> variable to map to the SimpleComponent.cfc file. Introspection can happen now! We can list the functions in that component. But what happens (like in a lot of components) if we were to call the constructor?
<code>
	<cfset myObj = CreateObject("component", "com.coldusing.cfc.SimpleComponent").init()>
</code>

Now CFEclipse is lost. This is a runtime call, and now, as far as CFEclipse is concerned, <em>myObj</em> is of type "any" so it doesn't know what Component it is... no more introspection for you.

There are a couple of ways I am thinking that we could get over this problem, and Michael mentioned one way: to add information to the <em>hint</em> attribute:
<code>
		<cffunction name="init" returntype="any" hint="type:com.coldfusing.cfc.SimpleComponent">
</code>

This would mean that if there is no <em>returntype</em>, or  <em>returntype</em> is "any", we have a look in the <em>hint</em> attribute and use that. The downside is that a lot of people have already written things in their <em>hint</em> attribute, such as documentation and what not. Let's come up with something else.

The other way we could do this is to add another attribute, <em>_returntype</em>, ColdFusion would ignore it, but it would be visible to CFEclipse:
<code>
	<cffunction name="init" returntype="any" _returntype="com.coldfusing.cfc.SimpleComponent">
</code>

Now, that sounds like something we could do, and even configure CFEclipse for (such as a setting which says, look for returntype in <em>returntype</em>, <em>hint</em> then <em>_returntype</em>)

You can imagine the same thing happening for arguments, so that when you type:
<code>
	<cfset myObject.getSomething(...)>
</code>

at the point when your cursor is in the "..." it would show you the variables and types (something like <em>var1:String</em>). (I can do another blog post about this if people like, but its the same idea)

What does the community think about this? On one hand its a bit against the ethos of CFEclipse, since it will be adding to your code, but on the other, you gotta give me a hand here! There must be a nice way of doing this! (for your info, I prefer the additional attributes since its kinda part of the language)


* <a href="http://en.wikipedia.org/wiki/Duck_typing">DuckTyping</a> in essence is setting the <em>returntype</em> to "any" or "void" in CFC cffunctions and the <em>type</em> to "any" in cfarguments to speed up the code as there is no need for validation of the object types that are being passed into and out of a function. It also means that the returned objects can be treated the same way even if they are not the same type of object.