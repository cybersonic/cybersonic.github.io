---
layout: post
title:  "EventValidation: What are we validating against anyway? And how can we add our own validations?"
uid:	"8A9AE87C-B571-BBAC-E4818FC864A6E382"
date:   2007-11-26 11:08 AM +0000
categories: eventvalidation
---
One thing that I think I forgot to mention is WHAT you can validate against with the EventValidation Action Pack. I thought I would write up a little guide about what you can validate against and even better, how you can extend the validation object to validate against something that is custom.

The current event data check rules that you can apply are as follows:

Specific EventValidator rules:
<ul>
	<li>required: That the field must be in the event and that it must have some length</li>
	<li>equals: This is a handy function, you can check whether one field equals another, or that a field equals a value, for example to check that the password field matches the password_confirm field we would add this entry in the validation bean:
	<code>
		<map>
			<entry name="field"><value>password</value></entry>
			<entry name="field2"><value>password_confirm</value></entry>
			<entry name="rule"><value>equals</value></entry>
		</map>
	</code>
	
	If of course we wanted to make sure the password was something like "watangy", we could change the field2 to a value, as follows:
	<code>
		<map>
			<entry name="field"><value>password</value></entry>
			<entry name="value"><value>watangy</value></entry>
			<entry name="rule"><value>equals</value></entry>
		</map>
	</code>
		Of course, this is not the best thing to do since the error would display:
		<blockquote>
		"The field #rule.getField()# must equal #rule.getValue()#."
		</blockquote>
		So, we can override the default error message as follows:
		<code>
			<map>
				<entry name="field"><value>password</value></entry>
				<entry name="value"><value>watangy</value></entry>
				<entry name="rule"><value>equals</value></entry>
				<entry name="errortext"><value>The password is incorrect</value></entry>
			</map>
		</code>
	</li>
	<li>lessthan/morethan: That the field value is less/more than the value set (such as "you must be over 18 and under 400 to enter this site")</li>
	<li>maxlength/minlength: The length of the field value is more/less than the value set (such as "your password must be between 40 and 60 characters long")</li>
</ul>

ColdFusion supplied validation rules:
EventValidator uses the isValid function and a lot of the in-built ColdFusion validations, these are (I wont list documentation individually, <a href="http://www.cfquickdocs.com/cf8/?getDoc=IsValid#IsValid" title="CFQuickDocs">check the Livedocs</a> for details): boolean,creditcard,date,time,email,eurodate,float,numeric,guid,integer,ssn,social_security_number,string,telephone,url,uuid,usdate,xml,zipcode


<strong>Creating your own validations</strong>

But what about a validation that needs to contact a database or do some other kind of processing that is specific for your system? Well, these are easy to implement. Lets take an example where a user cannot register with a username that has already been taken, which means that I shall need to go into the database to check this. 

First step is to create my own validation component, that extends "EventValidation.model.EventValidator" and overriding the "validateEvent" method, then add a loop through the validation rules and creating my own type of validation, here is a quick example:

<code>
	<cfcomponent extends="EventValidation.model.EventValidator" output="false">

	<cffunction name="validateEvent" returntype="void" access="public" output="false">
			<cfargument name="event" type="any" required="true">
			<cfargument name="context" type="string" required="true">

			<!--- Call the normal validations --->
			<cfset super(arguments.event, arguments.context)>

			<!--- Loop through the validations --->
			<cfloop from="1" to="#ArrayLen(variables.ValidationMap)#" index="r">
					<!--- Setup defaults for each validation --->
					<cfset rule = CreateObject("component", "Rule").init(variables.ValidationMapr])>
				

				<cfswitch expression="#UCase(rule.getRule())#">
					<!--- our own validation --->
					<cfcase value="usernotexists">

							<!---
								Go get the user from the db 
								Of course, this might be a service or interacting with your own ORM
							--->
							<cfquery name="getUser">
								SELECT userid FROM Users WHERE username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(event.getValue(rule.getField()))#">

							</cfquery>

						<cfif getUser.recordcount>
							<cfset event.getValue("ErrorCollection").addError(rule, "The Username #event.valueExists(rule.getField())# has already been taken")>
						</cfif>
					</cfcase>
				</cfswitch>


			</cfloop>
	</cffunction>
	</cfcomponent>
	
	
</code>

Hopefully the comments in the code above explain what is going on, but essentially you are calling super() to let all the previous validations work, and then we loop through the validationMap which contains our entries and create a rule object for each entry, we then use a switch (you dont have to, but I might be extending this to have a whole bunch of user based validations) with an entry for "usernotexists", my new validation rule. I then do a query and check it against the username and if it is found, I add an error to the ErrorCollection.

The next step is to setup my bean, as you would do normally but instead of using "EventValidation.model.EventValidator" I use my extended class:

<code>
	<bean id="userValidation" class="myProject.model.UserValidator">
		 	<constructor-arg name="rules">
		 		<list>
		 			<map>
		 				<entry key="field"><value>username</value></entry>
		 				<entry key="rule"><value>usernotexists</value></entry>
		 			</map>
				</list>
			</constructor-arg>
	</bean>
</code>

And there you have it, you have now checked your username against your specific database. Now you can add all sorts of validations that are specific to your own systems!