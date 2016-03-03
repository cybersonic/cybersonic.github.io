---
layout: post
title:  "Model Glue Tips Part 1: Separate out your Model-Glue file"
uid:	"8A9ACC88-B9D5-8E9E-4B2155FD4B794A6B"
date:   2007-08-10 11:08 AM +0000
categories: model-glue
---
I have been developing a number of Model Glue applications over the last year and a half. Its a great framework and it has actually saved my neck on a project with incredible tight deadlines. I thought I would share some of the tips I have learned along the way by doing a series of posts with tips over the next couple of weeks.

In the first part of the series I shall be looking at:


		<strong>Separate out your Model-Glue file</strong><br>
		In any moderately sized project, you will start to gather a large number of controllers and event handlers, not to mention the messages you are passing back to the controllers. This will lead you to have a very large ModelGlue.xml file which becomes unwieldy and difficult to find things without the help of outline tools such as the CF Frameworks Explorer in Eclipse.
		
	For this reason, I like splitting my my ModelGlue.xml file out into a number of files, this can be done easily thanks to the top level <em>include</em> tag (which is a child of the modelglue tag).
	
	To use this, you simply have to create another ModelGlue file, and you simply point to it by doing the following:
	
	<code>
		<modelglue>
			
			< include template="config/ModelGlue_Pages.xml">
			< include template="config/ModelGlue_Security.xml">
			< include template="config/ModelGlue_Products.xml">
			<controllers>
				...
			</controllers>
			<event-handlers>
				...
			</event-handlers>
		</modelglue>
		
	</code>
	
	The included files are simply other ModelGlue.xml files, with their own controllers an event handlers dealing with that so you have split out your application into relevant files. This also means that different developers can work on different parts of the application, simply by removing the include in your own version.
	
By the way, you can do a very similar think with ColdSpring (but more on that later)