---
layout: post
title:  "Model Glue Tips Part 5: Maximize your re-usability with message arguments"
uid:	"8A9AD002-9E59-BE72-79FB22AAC925842E"
date:   2007-08-13 04:01 AM +0000
categories: model-glue
---
As shown in the previous post, there is the ability to pass messages back to a message-listener with added information in the form of arguments. This can come in quite handy and allows you to make your controllers a bit more dynamic and re-usable so that they are useful under different situations.

I shall give an example, which you should have spotted if you read the GenericList documentation, but I shall go into more depth here.Lets say we have a simple query in our service, that gets users, but you can also pass in a name filter, and an order by column. To call this method in the service, you could:

a) Create multiple message-listeners in your controller
or
b) Create a single clever message-listener that expects different arguments

Solution b sounds a little bit smarter doesn't it?

So,  lets prototype this, here is our service function definition, you can imagine that there is some nifty SQL or whatever in there:
<code>
	<cffunction name = "getPeople" returnType = "query" access = "public">
		<cfargument name="filterby" type="string" required="false" default="">
		<cfargument name="filterstring" type="string" required="false" default="">
		<cfargument name="orderby" type="string" required="false" default="">	
			
			... some sql to do get the People ....
			
	</cffunction>
	
</code>
	
Initially you would call it as follows:

ModelGlue.xml:
<code>
	<message name="getPeople"></message>
</code>
This would simply get the people, and the controller would return it in the qPeople value (see the code below) in the Viewstate.

Controler Code:
<code>
	
	<cfinvoke component="#variables.PeopleService#" method="getPeople" returnVariable="r_qPeople">	
	</cfinvoke>
	<cfset event.setValue("qPeople", r_qPeople)>
</code>


Ok, that is pretty basic, but lets say I don't like it being in the qPeople variable, I can change the behavior by adding a little bit of code in the controller, so if you now pass an argument to the message-listener like this:
ModelGlue.xml:
<code>
	<message name="getPeople">
		<argument name="retVariable" value="qMyPeople"/>
	</message>
</code>
And in the controller code, we remove the hard coded "qPeople" and put in the value of the argument we passed in (with a default of course, don't want our old code to break!) by putting <em>event.getArgument("retVariable", "qPeople")</em> :
<code>
	<cfinvoke component="#variables.PeopleService#" method="getPeople" returnVariable="r_qPeople">	
	</cfinvoke>
	<cfset event.setValue(event.getArgument("retVariable", "qPeople"), r_qPeople)>
</code>
Mow the results would be returned into the qMyPeople variable in the View State.

We can get even cleverer, we could add a filter to our ModelGlue.xml:

<code>
	<message name="getPeople">
		<argument name="retVariable" value="qMyPeople"/>
		<argument name="filterby" value="name" />
		<argument name="filterstring" value="Mark Drew"/>
	</message>
</code>

Controller Code:

<code>
	<cfinvoke component="#variables.PeopleService#" method="getPeople" returnVariable="r_qPeople">
		<cfif event.argumentExists("filterby") AND  event.argumentExists("filterstring")>
			<cfinvokeargument name="filterby" value="#event.getArgument("filterby")#">
			<cfinvokeargument name="filterstring" value="#event.getArgument("filterstring")#">
		</cfif>
			
	</cfinvoke>
	<cfset event.setValue(event.getArgument("retVariable", "qPeople"), r_qPeople)>
</code>

Now we are filtering by the string "Mark Drew"! 

This is useful only if you want to hard code "Mark Drew" in your ModelGlue.xml file, but you will probably want to pass in a variable through a form or url, so we could change the controller code to say something like:

<code>
	<cfinvoke component="#variables.PeopleService#" method="getPeople" returnVariable="r_qPeople">
		<cfif event.argumentExists("filterby")
				AND  event.argumentExists("filterstring") 
				AND event.valueexists(event.getArgument("filterstring"))>
			<cfinvokeargument name="filterby" value="#event.getArgument("filterby")#">
			<cfinvokeargument name="filterstring" value="#event.getValue(event.getArgument("filterstring"))#">
		</cfif>
			
	</cfinvoke>
	<cfset event.setValue(event.getArgument("retVariable", "qPeople"), r_qPeople)>
	
</code>

And our Model Glue to:
<code>
	<message name="getPeople">
		<argument name="retVariable" value="qMyPeople"/>
		<argument name="filterby" value="name" />
		<argument name="filterstring" value="searchfield"/>
	</message>
</code>

 What is going on here? lots of event-ing! , we have changed the cfif statement to include the line <em>event.valueExists(event.getArgument("filterstring"))</em>, which gets the the string "searchfield" from our arguments, and then checks to see if we have a form or url variable named "searchfield". If there is one, in the cfinvokeargument, we then go and get that variable and pass it to the function.

Now you are cooking with gas!