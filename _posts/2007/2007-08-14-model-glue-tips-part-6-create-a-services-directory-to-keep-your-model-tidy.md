---
layout: post
title:  "Model Glue Tips Part 6: Create a services directory to keep your model tidy"
uid:	"8A9AD08F-A603-EFA6-81FB2D32ABF2A691"
date:   2007-08-14 11:08 AM +0000
categories: model-glue
permalink: model-glue-tips-part-6-create-a-services-directory-to-keep-your-model-tidy
---
By default, when you create a Model-Glue project you get the following directories in you root project:
<pre>
	/config
	/controller
	/css
	/images
	/model
	/views
</pre>


This fits (apart from the css and images folders) with the idea of an MVC model. The problem that I find is that Reactor (by default) creates objects in the model/data directory. Why is this a problem you might ask? Well, I find that it doesn't fit in with what I think of the model. I see the model as the business model, and I tend to add another directory; "services" which interact with the model.

The services are stored there and they glue the model together the model being stuff created by your ORM. I know people might disagree (no names) but I tend to add a services directory in which I have number of cfc's usually named %3CSomething%3EService.cfc . 

In my model folder I then have the objects and gateways. This means that the controller talks to the service and the service talks to the gateways and objects. This keeps it nice and tidy in my view.

Of course, it doesn't matter at the end of the day, since you can change where all the objects are stored and just change your ColdSpring.xml file (you ARE using your ColdSpring.xml file your services aren't you?!)