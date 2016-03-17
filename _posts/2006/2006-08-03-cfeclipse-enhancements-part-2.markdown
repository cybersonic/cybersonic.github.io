---
layout: post
title:  "CFEclipse: enhancements Part 2"
uid:	"8A98DC0C-DC5A-C357-5C12BD96F9F33377"
date:   2006-08-03 11:06 AM +0000
categories: model-glue,cfeclipse,coldfusion
permalink: cfeclipse-enhancements-part-2
---
Continuing from yesterday's post, here are some of my comments with regards to some of the features that have been requested if a magic wand could be waved and all your feaures be implement.

So moving right ahead....

<p><strong>Fixes to colour highlighting (especially on dark backgrounds)</strong><br />
  Refactoring Support<br />
  Hyperlinking to CFC's and CFC functions<br />
This is the &quot;Golden Grail&quot; isnt it? Being able to know what type of object you are writing even before CF itself knows it (since its not a strongly typed language) </p>
<p><strong>Awareness of external CFC's (without definition in code)</strong><br />
This is a tough one. CFEclipse would have to have access to the code. We don't parse CFML to that level, there are ways round it and if people post the code that they are trying to figure out there ARE ways that we can handle this (like creating a linked directory to the external CFC's)</p>
<p><strong>Double click selects a whole tag</strong><br />
  I presume this is a bug, its a user's preference and something they are used to. I know there is code there that was written to select *something* so its a matter of changing this behavior if people are interested (on the whole not the individual)</p>
<p><strong>Expression Builder</strong><br />
  Even for the 6 years or so that I was doing ColdFusion in CFStudio I never figured this thing out as useful. I personally still don't. Good syntax highlighting and awareness of how functions and CFC's work get round this. There will be improvements to the dictionary view and some new views to help you with functions and tags. Someone show me how my life is better with some sort of Expression Builder and I might think about it. Again, I am not porting CFStudio/HomeSite. I wont.</p>
<p><strong>Customisable toolbars</strong><br />
I have added HomeSite-like toolbars, and after talking to Dean Harmon over at CFunited these might change and become a view on themselves. Eventually I am going to make it easier for you to add your own toolbars, without having to edit the toolbar.xml directly. This is a feature I kind of like and it will be more integrated into snippets as they are a very powerful feature.</p>
<p><strong>Comparison of remote files</strong><br />
Yep. This is going to happen, I mentioned I need to integrate FTP/sFTP/RDS into what is called a Team based plugin, so that you can do compare/replate synchronise etc. There is a lot to work out as I mentioned but I think, now with Eclipse 3.2, it will be coming. When? That depends on prioritisation of features.</p>
<p><strong>&quot;How to move to CFEclipse from HomeSite video&quot;</strong><br />
  OK, sure. Anyone switched over recently? Robert Blackburn has been writing a series of articles on CFEclipse over at Fusion Authority and I have been doing a number of presentations on this. Rob Rohan did a number of videos before, and now I have a copy of contribute to play with. I promise I shall do some videos but its just finding the time. If anyone asks how they can contribute, this would be a good way! There will be a new CFEclipse.org site coming soon and it will have all these resources in a central location. Time, as you all know, is all I need.<br />
</p>
<p><strong>Customisable hotkeys for snippets</strong><br />
NO. Hmm, thats a bit harsh, but let me put it another way... no. Eclipse has a different way of doing keyboard shortcuts and I have a &quot;cunning plan thats more cunning than a fox with a degree in Cunning from Cunning-ham University&quot;. This will be that you will hit the snippet hotkey (Ctrl/Apple + J) and you will see all the snippets you have assigned trigger text... you can then type it and press return... I think this will be more expandable than the way CFStudio/HomeSite does it.</p>
<p><strong>Integrated Help</strong><br />
Which help? Coldfusion 5/6/7 or 8, Blue Dragon 6/7? Railo? I understand you and I want help, but this clashes a bit with a very useful feature of being able to have multiple dictionaries. Also Help is very &quot;heavy&quot; i.e. it takes up a lot of space. So, I would ask the providers of the various CFML runtimes to provide help plugins, discuss with me and we shall find a way of calling the right help for your version of ColdFusion you have defined for your project. Deal?</p>
<p><strong>Split Screen</strong><br />
  You can do this, you create a new editor (right click on the editor's tab and move it where you want it. It would be a new version of the editor that will ask you to update when you save, but it does the trick. This is an &quot;edge&quot; case in my opinion (hey... I can have one you know?) and you wont need it all the time.<br />
</p>
<p><strong>Customisable Code Colouring</strong><br />
  You can customise this, go to Window-Preferences-CFEclipse and check out the sub tabs, there is code colouring for CF, HTML and SQL tags (this is from memory so just go and check it out)</p>
<p><strong>Stability improvements</strong><br />
Any bugs, please put them on the bug tracker over at http://cfeclipse.tigris.org, just register and add a bug. I will get round to it and if you think you can help make it more stable, please, just hit me up, I can show you where the code is and the way to work it out.</p>
<p><strong>Frameworks Intelligence</strong><br />
  I already wrote a plugin for Fusebox a while back, I am not using Fusebox anymore so I don't have a pressing need nor ideas on how it could help me doing it. I am definitely going to be working on a ModelGlue one and have some great ideas for it, once I get a way of implementing them (hint: Round Trip modeling anyone?).<br />
</p>
<p><strong>Better file explorer (by name, by date, by type)</strong><br />
Yep, good idea. I don't use this view much apart from using it to edit something remotely. But I can definitely see what people mean. Another feature to implement.</p>

I shall be working through the next items tomorrow, I got the initial list of requirements from Damon Cooper's blog when there were about 60 commnents, there must be about 100 or so now, so I shall have to have another read!