---
layout: post
title:  "Coming Soon: Getting CFEclipse to do Component Insight"
date:   2006-05-07 11:06 AM +0000
categories: cfeclipse
---
I thought I would post something here, just to remind myself of some things, about adding functions to CFEclipse and to update whoever is interested on progress.

I have been working on the CFMLComponentAssistant. What is that you may ask? Well, we have various "assistants" they basically return CompletionProposals, a proposal is saying that when you hit a certain key or type a certain word, you get a drop down of proposed completions to your code, basically what you would call auto-completion or tag insight.

 The one I am working on, the ComponentAssistant, is triggered when you put a ".". It then looks at what you typed before, so if you have a statement like:

<div class="code">&lt;cfset myitem="application.CMSManager.</div>

It goes and looks for a cfc named CMSManager and returns a list of functions that are available to you.
It is a short step towards some CFC insight. of course, then myitem would be of some CFC type, and this is a problem because lets say:

<div class="code">&lt;cfset mySite = application.CMSManager.getSite().</div>
The variable mySite is now actually of type Site but CFEclipse doesn't know this, it will be looking for a file called mySite.cfc

So I am thinking of ways to get round this. Maybe a sort of cache that gets built (in XML or whatever) that has something like:
<div class="code">/project/folder/page/variablename = /project/path/to/component/Component.cfc</div>
If this type of approach works, this could be extended to other Assitants, for example something that would deal with cfquery, and when you add a cfquery tag (this might be the partitioner code thought) it would then look for the name="qGetPeople" and add another entry into the cache along the lines of:
<div class="code">/prokect/folder/page/qGetPeople = CFMLQUERY</div>
so if you typed:

<div class="code">#qGetPeople.</div>

you would get proposals for a query object. 

You get the idea. 

Early days yet, but its all fun!

(doesn't help that Eclipse is being weird tonight)