---
layout: post
title:  "Model Glue Tips Part 7: Set myself in your views"
uid:	"8A9AD0FC-989A-C6D0-DDE9D8C21D24E31A"

categories: model-glue
permalink: model-glue-tips-part-7-set-myself-in-your-views
---
This is a quick tip for today. In all views you will probably be linking to other events, now of course you could write something like:

<code>
	<a href="#CGI.SCRIPT_NAME#?event=my.event">My Event </a>
</code>

But what happens if you change the event key to something else (you can do that in the ModelGlue configuration section in the ColdSpring.xml file, see the property for "eventValue") such as "go" or "action"? You would have to change every view.

A simple way round this is to put at the top of each view the following:

<code>
	<cfset myself = ViewState.getValue('myself')>
</code>

And then change your links to:

<code>
	<a href="#myself#my.event">My Event </a>
</code>

What do you think?