---
layout: post
title:  "CFEclipse and Generic Framework support"
uid:	"8A98E236-C898-6048-4CFEE4BEE152A2D2"
date:   2006-08-10 11:06 AM +0000
categories: fusebox
permalink: cfeclipse-and-generic-framework-support
---
I have been thinking on how to implement "generic" framework support in CFEclipse. I apologise if this post seems a bit rambling but its to get some opinions from people out there and to formalise my thinking a little before I go off and develop something.

So, What do I mean by generic framework support? Well, making plugins for each framework is kind of hard. Yes, they all have their own way of doing things but way back when I was doing the Fusebox Plugin, I realised the problems, and also saw how much overlap of code there is. To overcome making plugins for each framework, I am thinking that we need to abstract a little what each framework does (with relation to coding and implementing it), the actions and the UI that each would need. Since each of the frameworks is likely to change in time, and maybe new ones come up, we need a way in CFEclipse to be able to modify (like the dictionary files)  and add new framework definitions.

I am breaking down the issues for implementing framework support and hopefully shake out a way of developing it as follows:


<b>Configuration</b>

Most frameworks (I am looking at Model-Glue, Fusebox and Mach II) are configured using an XML file, which has a number of nodes that say the flow of actions in your application, the files to include and the settings of your application. Fusebox also has a number of iterators and logic nodes in the XML.  I know there are other frameworks out there, which are configured differently, but these are the main ones I am looking at the moment since I have some knowledge of them and they can be generalised. (I should also include Reactor and Coldspring in this)

We need a way to say that, for example, "ModelGlue.xml" is a config file and we should open it and treat it differently or that Fusebox.cfm is also a framework file that we want to edit differently.

When I was implementing the Fusebox plugin, I run into the problem that I had to create an object (a class) for each node type, now this isnt a problem if the lexicon of a framework is small, but for Fusebox the lexicon is rather large and in fact (correct me if I am wrong) I think you can add your own nodes. This would make it a nightmare of classes that are specific to a framework. Ok, so lets create a generic node that can have a name, a parent and a number of children. Then we name that node, and assign an image to it. 

Another part of a framework seems to be the base files required when you are creating an application. These files need to be dropped into your application, such as config files, index.cfm etc. I am not talking about the Core Framework Files that you would create a ColdFusion Mapping to, but the ones you will be working, such as the sample application templates for each framework. 

To address this and also kill another bird with the same sharpened stone, I have an idea of extending the "New File From Template" to creating a "New Project From Template" which would you, as a user would set up by setting a project that you keep all your project templates in and in each folder you can put a set of files that make up a baseline application,e,g a folder called "Normal CF Project" with Application.cfm and index.cfm or a folder called "CFC Project" with Application.cfc and index.cfm  or a folder with the Model Glue application template.  This would mean that when you are creating a project you can select from which of these folders you would copy the files into your new project. 
This is fine so far but lacks another part, all the replacements you have to do (for example the name of the application). I though this might be solved by using the snippet syntax in those files e.g 
<code>
	<cfapplication name="$\{\{applicationname}}">
</code>

So a brute force attack would be to parse ALL of the files under that folder looking for snippet texts. Mike Nimer actually suggested something, which would be to copy the files using ANT. This is a very intelligent choice as I can use a generic ANT build file (I am talking in the background, Eclipse running it as part of its project creation script) that I can pass a list of replacements. At the root of each project we would have a xml file that CFEclipse can read, for you to put all the values to replace, then in each of the files you would have variables that are replaced.  


<b>Views (or UI)</b>

What views would you need for your framework?

I am thinking currently that we only need two views, one being the Framework File Editor, basically an XML editor that (in the background) knows what DTD to use for that particular framework file and what insight to provide, and a outline view of all the nodes in that file.

 Well, XML buddy already has a outline view of your xml. If we are re-creating an XML editor for the config files and we have  outline view, maybe we could configure it to be filtered (show events for MG, fuse-actions for Fusebox etc) by a particular node. Each node type would then need to have its own action (when you double click etc) and ways to add new nodes (where applicable). 


<b>Actions</b>

Now we can edit our framework files, we need to add actions, I would say that to start out with we have some simple "open" actions assigned to some nodes, so some  examples:
* For ModelGlue.xml - On node "include", use template, to open file by path
* For ModelGlue.xml - On node "include", use template, to open file by path, using "ColdSpring/beans/bean:id=modelGlueConfiguration/property:name=viewMappings" value as the root
*For ModelGlue.xml - On node "modelglue/controllers/controller:type" open file by package
*For ModelGlue.xml - On node "modelglue/event-handlers/event-handler/broadcast/message:name" open file referenced in "modelglue/controllers/controller/message-listener".parent.type where message:name = message-listener:message

These are just examples to get my head round how the actions would need to be worked out. But basically the actions here are open by path or open by package. 

Other actions would run in the background and they are custom validation, not just XML validation but for example
* validate that all "modelglue/event-handlers/event-handler/broadcast/message:name" have a corresponding "modelglue/controllers/controller/message-listener:message"
* validate that for "modelglue/controllers/controller/message-listener:function" there is a corresponding cffunction in the "open file by package" for "modelglue/controllers/controller/message-listener"_parent.type

As you can see we are starting to get a syntax here of the type of language that we need to define for each framework.

So to add framework support this would be done by creating a file for each framework file that we shall handle, it would define where to look for a DTD, define actions per named node, define validations and define nodes that will be displayed in the outline

 I don't have much experience in this area so I appreciate  any comments on my logic so far.