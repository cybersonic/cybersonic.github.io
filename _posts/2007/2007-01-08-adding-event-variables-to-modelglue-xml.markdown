---
layout: post
title:  "Adding event variables to ModelGlue.xml"
uid:	"8A996639-EB54-DE0F-5E958A50CDFC59D7"
date:   2007-01-08 11:07 AM +0000
categories: model-glue,coldfusion
permalink: adding-event-variables-to-modelglue-xml
---
When using Joe Rinehart's Model-Glue framework, I noticed a few people that come from using fusebox based apps were a bit confused at how you would set either application wide variables, or fuse-action (i.e. event) specific variables (such as xfa's). In the definition of MG itself there isn't something blatantly obvious, so how would you set, for example, the section variable that each of the event-handlers belongs to (for the title for example)?

<more />

In the controller, I created a function called <em>setValue</em>, this function loops through any arguments you pass to them creating event values for them:

<code>
	<cffunction name="setValue" access="public" returnType="void" output="false">
		  <cfargument name="event" type="any">

		  <cfset stArguments = arguments.event.getAllArguments()>
		  <cfloop collection="#stArguments#" item="arg">
		  <cfset arguments.event.setValue(arg, stArguments[arg])>
		  </cfloop>

	 </cffunction>
</code>

I can then set an event constant in the event-handler, by broadcasting the following message:

<code>

	<broadcasts>
		<message name="setValue">
			<argument name="xfa.section" value="testimonials" />
		</message>
	</broadcasts>

</code>

This means that in my view code I can get the section variable as follows:

<code>
	<h1>#ViewState.getValue("xfa.section")#</h1>
</code>

In my next post, I shall set some application wide variables, and show you how to access them in a similar manner.


EDIT: <a href="http://www.andyjarrett.co.uk/andy/blog/index.cfm">Andy Jarett</a> has just pointed out something (which should have been as plain as the nose in my face) that instead of having to do the above, you can simply do the following for each include:


<code>
	<views>
		&lt;include name="body" template="dsp_body.cfm"&gt;
			<value name="xfa.section" value="testimonials" />
		</include>
	</views>
</code>

Which is obviously the easier way of doing it (if you bother to read the documentation, which I didn't).