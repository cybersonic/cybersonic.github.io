---
layout: post
title:  "Interesting features of Eclipse 3.3"
uid:	"8A9A68FD-C428-0455-B75245081D239372"

categories: cfeclipse,coldfusion,flex,eclipse
permalink: interesting-features-of-eclipse-3-3
---
I know Eclipse 3.3 hasn't been released, yet, but I was looking at the <a href="http://download.eclipse.org/eclipse/downloads/drops/S-3.3M5eh-200702220951/index.php">latest stream build's</a> notes on what is <a href="http://download.eclipse.org/eclipse/downloads/drops/S-3.3M5-200702091006/eclipse-news-M5.html">new and noteworthy</a> and I found a few things that might be of interest to people that use CFEclipse and have had some bugs or issues with it.

<strong>Mozilla everywhere</strong>

<em>Mozilla can now be used as the underlying browser control on Windows and OS X, providing that you have XULRunner installed and registered. To use this just create your Browser with the SWT.MOZILLA style.</em>

This means we can set the default internal browser to use Mozilla, which means (if I am reading it correctly) we could include <a href="http://www.getfirebug.com/">Firebug</a> and Ray's <a href="http://coldfire.riaforge.org">ColdFire</a>. 

<strong>Open files with other editors</strong>

<em>You can now open files with editors that are not registered for the specific file extension. Right-click on your file and select Open with > Other. You will be presented with a list of editors to choose from.</em>

As it says, you can now choose what to edit those .tpl files (if you have made up a template extension) and quickly edit it in CFEclipse

<strong>Text drag and drop in text editors</strong>

<em>It is now possible to drag and drop text to and from text editors</em>

This has been a long time coming. Spike implemented the drag and drop stuff in CFEclipse which has caused some problems with some users, and its a pain to have to implement something that should be part of the framework! Finally!!! (I breathe a sigh of relief)

<strong>Configurable and extendable hyperlink detection</strong>

<em>Clients can use the org.eclipse.ui.workbench.texteditor.hyperlinkDetectors extension point to add their own detectors and can enable their viewers using the corresponding methods in the source viewer configuration along with the org.eclipse.ui.workbench.texteditor.hyperlinkDetectorTargets extension point</em>

One of the nightmares of adding CFC introspection and linking is simply adding the (simple) hyperlink for the objects and telling it what to do.  All the solutions I have been looking at so far look like hacks, so this is a much neater way of doing it! Great stuff!


Reading more into past <a href="http://download.eclipse.org/eclipse/downloads/drops/S-3.3M4-200612141445/eclipse-news-M4.html">Eclipse 3.3 (M4) releases</a>, there are other things that will make some issues disappear from my little list too.

<strong>Show invisible whitespace characters</strong>

<em>It is now possible to see the invisible whitespace characters in textual editors:</em>
Such as space, tab etc. I remember there was a bit of a conversation about this in the cfeclipse user list (did I mention it moved to google groups by the way?)

<strong>Spell checking in text editor</strong>

<em>Spell checking is now also available in the text editor</em>
As it says on the tin! 


There are many other improvements, some of which affect more plug-in and Java developers than the CF Community and that will definitely make my life easier! I just love it when a product starts getting better and better!

I am also thinking of dropping support for Eclipse 3.1 (as if I did a lot of support for it! I know, I know!) as soon as Eclipse 3.3 is released (which I think will be this summer). I know this will affect people using FlexBuilder standalone, but the easy work-around is to re-install it as a plug-in onto 3.2 so I hope it wont cause major issues.