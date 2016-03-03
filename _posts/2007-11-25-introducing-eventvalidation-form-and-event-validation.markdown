---
layout: post
title:  "Introducing EventValidation: Form and Event Validation"
date:   2007-11-25 11:08 AM +0000
categories: eventvalidation
---
<a href="http://eventvalidation.riaforge.org/">EventValidation</a> is another Action Pack for <a href="http://www.model-glue.com/" title="The Model-Glue Framework">Model-Glue</a> designed towards the validation of forms, but can be used to validate any value within a Model-Glue event.

It provides a way to tag up your form and for it to be validated, both client side and server side, which is something that I find very neat, since I hate repeating CF code in the backend with JavaScript code in the front end.

Let me walk you through a simple installation and setup of EventValidation. 

INSTALLATION

Simply extract the EventValidation Action Pack to a secure part of your webserver and create a ColdFusion mapping to "/EventValidation". Then in your model glue file add the following at the top before any other controllers etc:
<code>
< include template="/EventValidation/config/EventValidation.xml"/>		
</code>

You will be defining the rules to validate an event against in EventValidation/config/ColdSpring.xml, so import it into your application's ColdSpring.xml, using a relative path to the resource (I think there is a bug here with ColdSpring but I need to clarify this with <a href="http://cdscott.blogspot.com/" title="Truths and Lies">Chris Scott</a>) :

<code>
	<import resource="../../EventValidation/config/ColdSpring.xml" />
</code>

The next thing to do, is in the form that you want to validate, is to add an cfimport declaration at the top:
<code>
<cfimport prefix="ev" taglib="/EventValidation/taglib">
</code>

This will allow you to setup your form with a custom tag as follows:

<code>
	
	<h1>Register</h1>
	<cfimport prefix="ev" taglib="/EventValidation/taglib">
	<cfoutput>	
	<form action="#ViewState.getValue("myself")#register.action" method="post" >
		<ev:setup id="ev_Register" successEvent="register.action">
		<div>
	    	<label for="email">email:</label>
			<input type="text" name="email" id="email" value="#ViewState.getValue("email")#">
		
	    	<label for="password">password:</label>
			<input type="password" name="password" id="password" value="#ViewState.getValue("password")#">
		</div>
		<div>
			<input type="submit">
		</div>
	</form>
</code>

What is happening here? well, using ev:setup we have said that the id if the bean that will do our validation is called ev_Register, and that the success event will be register.action, this form is a normal form, with only the <ev:setup> added.

Now, lets define what we need in this form to be validated, in the EventValidation/config/ColdSpring.xml I have the following bean:
<code>
	<bean id="ev_Register" class="EventValidation.model.EventValidator">
	 	<constructor-arg name="rules">
	 		<list>
	 			<map>
	 				<entry key="field"><value>email</value></entry>
	 				<entry key="rule"><value>required</value></entry>
	 			</map>
	 			<map>
	 				<entry key="field"><value>email</value></entry>
	 				<entry key="rule"><value>email</value></entry>
	 			</map>
	 			
	 			<map>
	 				<entry key="field"><value>password</value></entry>
	 				<entry key="rule"><value>required</value></entry>
	 			</map>
	 		</list>
	 	</constructor-arg>
	 </bean>
</code>
The id matches the id in our ev:setup tag, and then we have a list of maps, or in CF it would be an array of structs, so the first entry says, that the field email is required, then we say that email should match the "email" rule, which is using ColdFusion's internal isValid() list of attributes. Then we do the same thing for the password.


What will happen now when you submit your form, is that an ErrorCollection object will be added to the Event. If there are any errors in the collection, it will return to the event that the form is in and you then do ViewState.getValue("errorCollection").getErrorCollection() to get an array of errors.


So that is a simple way to get started with validation, but this is not the end of what EventValidator can do for you, in the next post I shall examine how to add different styles to the error fields and how to add error descriptions to each element (it does it automagically!)

UPDATE: you can see a <a href="http://www.markdrew.co.uk/EVDemo/">simple demo here</a>