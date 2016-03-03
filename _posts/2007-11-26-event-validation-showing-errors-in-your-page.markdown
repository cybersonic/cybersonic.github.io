---
layout: post
title:  "Event Validation: Showing errors in your page"
date:   2007-11-26 11:08 AM +0000
categories: eventvalidation
---
In the <a href="http://www.markdrew.co.uk/blog/index.cfm/2007/11/25/Introducing-EventValidation-Form-and-Event-Validation" title="Mark Drew (Redux)- cf_etc...: Introducing EventValidation: Form and Event Validation">previous post</a> I introduced <a href="http://eventvalidation.riaforge.org/" title="EventValidation">Event Validation</a>, which on a simple level validates the input from forms in a Model-Glue request against a set of rules that you define in a ColdSpring tag.

Simple so far?

Well, its all very well getting a resultant ErrorCollection back from the server, but you will still need to display the errors, which is another load of work that the Event Validation plugin can help you with. To enable this you simply need to add two things to your view template, another cfimport (apart from the main mv one) and another attribute to your mv:setup tag:Lets import the form tag library :
<code>
	<cfimport prefix="" taglib="/EventValidation/taglib/form">
</code>

This tag, with the help of using a blank prefix, means you can replace html tags with custom tags, so your "input", "select" and "textarea" tags are no longer simple html tags, they are now super charged custom tags, that allow the EV framework to change the style and add error divs when required. 

To make anything appear though, we need to change our mv:setup tag:

<code>
	<ev:setup id="simpleValidation" showerror="true">	
</code>

That wasn't so hard was it? Now, when the form is submitted, div's will appear below each form item that has an error, and will have some nice error descriptions.


By default the input items will have the CSS class "error" added to them, of course, you might want to set your own style classes, this is just a part of the setup:

<code>
	<ev:setup id="simpleValidation" showerror="true" errorClass="myspecial_error">	
</code>
And that is it to show the errors!

<a href="http://www.markdrew.co.uk/EVDemo/index.cfm?go=autoerror" title="EventValidation Examples">View Demo</a>