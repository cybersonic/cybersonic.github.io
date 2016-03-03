---
layout: post
title:  "Why CFC insight is difficult"
uid:	"8A9B1DF2-0E53-8E0C-96B07E7E0214A8B2"
date:   2008-02-20 11:08 AM +0000
categories: coldfusion
---
One of the most requested features in CFEclipse is to have insight into CFC's to have method completion. I thought I would detail some of the problems that are involved in this task from an editor. I am putting this together so that when people ask me why not, I can point them to this, and of course, if they come up with some good answers, they can post them here!

1) What CFC are we calling?

The simplest way to call a CFC is to do the following:
<code>
<cfinvoke component="uk.co.markdrew.MyCompnent" returnvariable="myComp">
</code>

Now, at runtime, ColdFusion would figure out where "uk.co.markdrew.MyComponent" is located, this could be either by doing mappings in ColdFusion or in fact, by VirtualDirectories in Apache/IIS. This is pretty hard in CFEclipse unless we add a "uk/co/markdrew/MyCompnent.cfc in your project. If you had a separate directory, lets say you keep your components in /Project/components/uk/co/markdrew/MyComponent.cfc", it would be hard. 

Not impossible, since we can add linked folders and a feature I have been working on is to be able to mark a folder as a mapping, but pretty hard for all the different cases and layouts that people will have

2) A CFC location from a variable

Since you can pass variables to tags, you could pass the CFC as a variable, for example:

<code>
<cfinvoke component="#APPLICATION.MyComponent#" returnvariable="myComp">
</code>

In this case, and similar cases, it would be VERY hard to find out what myComp actually is! If the "APPLICATION.MyComponent" is set in Application.cfc for example or anywhere else (in the many different ways of setting an application variable, that I am not even going to go into here!) it would be impossible to find out what myComp is.

3) What is the returned object?
The above code is probably something you wont do a lot, but how about something like:
<code>
<cfinvoke component="uk.co.markdrew.MyCompnent" method="getObject" returnvariable="myComp">
</code>

And the function is defined as:

<code>
<cffunction name="getObject" returntype="Any">
	<!--- Losts of complicated ways of getting an object, like looking it up in a database --->
	<cfreturn someObject>
</cffunction>
</code>

How would the editor know what the object, and thus what funtions it had, is? This is very much like what happens in ColdSpring so unless we write CFEclipse so it actually does everything a CF server does (and even then, that is dangerous at runtime!) it wont be able to know what is happening!

So, how would you get round these problems? (put aside that its in Eclipse, try writing a parser in CF that just reads text files and let me know how you get on!)