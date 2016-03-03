---
layout: post
title:  "Model Glue Tips Part 4: Use Generic Database Messages to speed up your development"
date:   2007-08-13 11:08 AM +0000
categories: model-glue
---
A lot of the time that you are developing an application, depending on how you have set up your database etc, you will want to do a "<em>select * from sometable</em>", for example to get the types of pages you have, or a full list of user roles or simply to get the current user. This is all fine if you are sticking to the semi rigid pattern of having services for your whole architecture, but in the heat of battle, you might be tempted to do a <em>cfquery</em> in your view. DONT!

Model-Glue gives you a built-in way of doing Generic Database actions (or messages as they are called in the documentation)

The messages that you can call from the broadcast section of your event handler are:
<ul>
	<li>modelglue.GenericList: Which does a select * from [table]</li>
	<li>modelglue.GenericRead: Which does a select * from [table] where [id] = xyz</li>
	<li>modelglue.GenericCommit: Which will save the record (or update it depending if it already exists with that ID)</li>
	<li>modelglue.GenericDelete: Which will delete the record with the ID that you have passed in</li>
</ul>

An example of using modelglue.GenericList would be to list the People in our fictional system.

In ModelGlue_people.xml I create an event-handler to display people:

<code>
	<event-handler name="people.list.users">
		<broadcasts>
			<message name="modelglue.GenericList">
				<argument name="object" value="People" />
				<argument name="queryName" value="qPeopleList" />
			</message>
		</broadcasts>
	
		<view>
	</event-handler>
</code>

Then in my display template I can get access to the query:

<code>
	<cfdump var="#viewstate.getValue("qPeopleList")#"/>
	
</code>

There is more functionality available such as filtering and sorting, you can check out the details in the <a href="http://docs.model-glue.com/How_To_s/How_To_Use_Generic_Database_Messages/Using_modelglue.GenericList.htm" title="Using modelglue.GenericList">Documentation for modelglue.GenericList</a>


Calling the other other Generic Database functions is as simple as that, have a look at the full documentation over at <a href="http://docs.model-glue.com/" title="Model-Glue">http://docs.model-glue.com/</a> under "How To's" / "How To Use Generic Database Messages"