---
layout: post
title:  "Frameworks and the GenericBean"
uid:	"8A98FFDF-D86A-2915-B69533C3A5B71444"
date:   2006-11-21 11:06 AM +0000
categories: coldfusion
---
As I am working on the application framework that I <a href="http://www.markdrew.co.uk/blog/index.cfm/2006/11/20/Creating-your-own-framework-and-why-you-should-do-it">mentioned before</a>, I noticed that I started repeating myself. Looking into other frameworks like Model-Glue you notice that there is a generic way of getting information out of an object (like the Event Object) so, for the configuration I created a GenericBean. This Generic bean can be initialised with a structure of key/value pairs, you can get a value, if the key doesn't exist, it returns a empty string.

Bearing that in mind, I had other objects I started creating (lets call them Transfer Objects, they just carry some data from one place to another) and I realised that even though I started doing things like:

<code>
	<cfcomponent name="Bob">
		<cfproperty name="name" default="">
		<cfproperty name="age" default="">
	
		<!--- insert gettters and setters here --->
	
	</cfcomponent>
</code>
(the code above is just to give you an idea)
Now, this was a bit annoying, I mean, it is just another transfer object, so out of coding lazyness I used a my GenericBean, I mean which code is "better"?

<code>
	<cfset Age = Bob.getAge()>
		or
	<cfset Age = Bob.getValue('age', 0)>
	
</code>

I find the second more dynamic, it also allows me to set a default and this is coming in very handy.

I know it then stops you doing things like type checking, but then again, I could add a method (which I shall do later today) such as bob.isValid(stValidations) where stValidations is a structure with the keys/valuetypes that it should hold.

<code>
	<cfset stValidations = StructNew()>
	<cfset stValidations.name = "string">
	<cfset stValiudations.age = "numeric">
		
	<cfset bValid = bob.isValid(stValidations)>
</code>


What do people thing of this approach to coding? Should I make Bob and object? Or does a generic bean work for you?

(I should say that as an afterthought, I could store the validations in the BOB object so that later on I can validate it)