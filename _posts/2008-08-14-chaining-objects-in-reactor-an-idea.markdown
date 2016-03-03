---
layout: post
title:  "Chaining objects in Reactor, an idea"
date:   2008-08-14 11:10 AM +0000
categories: reactor
---
I have been doing a fair amount of work recently with Reactor, and not so related to reactor, I have also been using JQuery.

This has led me to a little thought experiment I was going to propose to Doug Hughes for the project, which is the idea of chaining. This is something that JQuery does fairly well and Reactor does to some level. 

The idea is this, that in any object that has setters, or functions that return "void", they should actually return the newly modified object itself ( the "this" scope).

"Why?" you might ask, well, here are a couple of examples from my code:

<code>
	<cfscript>
		orm = getModelGlue().getOrmService();
		myObj = orm.createRecord("Element");
		myObj.setId("124");
		myObj.load();
		
		//do stuff with the object now
	
	</cfscript>
</code>

Well, that is ok, but I would prefer to do the creating the object and loading it in one line:

<code>
	<cfscript>
		orm = getModelGlue().getOrmService();
		myObj = orm.createRecord("Element").setId("124").load();
		//do stuff with the object now
	
	</cfscript>
</code>


There we go, in one line. This could also go for doing all the setting of the other properties:
<code>
	<cfscript>
		orm = getModelGlue().getOrmService();
		myObj = orm.createRecord("Element")
					.setId("124")
					.load()
					.setName("Elvis")
					.setAge("34")
					.save();
	</cfscript>
</code>

What do people think of this idea? It is fairly easily implemented, doesn't break any existing code and would remove a lot of &lt;cfset&gt;'s and if nicely formatted, make just as much sense.

EDIT: As an aside, Doug let me know (and I should have known really but its nice to learn a new thing every day) that you can shorten the loading even further:

<code>
	<cfscript>
		orm = getModelGlue().getOrmService();
		myObj = orm.createRecord("Element").load(id="124");
	</cfscript>
</code>