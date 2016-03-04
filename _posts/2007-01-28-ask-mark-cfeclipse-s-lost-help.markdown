---
layout: post
title:  "Ask Mark: CFEclipse's lost help..."
uid:	"8A99A9E7-FF7A-22DE-2777D6372028E3C8"
date:   2007-01-28 11:07 AM +0000
categories: ask-md
permalink: ask-mark-cfeclipse-s-lost-help
---
A reader asks:

<blockquote>
I've installed it (using Software Updates) but can't seem to get the context sensitive help to work. Each time I click F1 it redirects the browser pane to http://www.cfeclipse.org/cfdocs/?query=cfif (for example) which is an invalid page. Is there a way to have local help on the language?
</blockquote>

This is a mistake, I was a bit over enthusiastic with my archiving procedure on friday, and lost our cfquickdocs redirection.

This is a new feature, in CFEclipse 1.2.1 (previous version) the help would point to www.cfdocs.org but that site has died, now we do two things:

<ol>
<li>If you dont have the Coldfusion Extensions from Adobe it will point to <a href="http://cfquickdocs.com">http://cfquickdocs.com</a> and get you the relevant help in your internal browser
<li>If you have the flex builder plugin or the Coldfusion Extensions (I think its the extensions, I cant remember off the top of my head) it will do a search in the local docs.
</ol>
Why is this you might ask? Well, the CFEclipse team dont re-distribute the help, Adobe does, so we try and make it a bit easier by giving you the choice.


Another thing is built in CFEclipse help. 

If you go to Help -> Help Contents  and expand the CFEclipse node, you might find its a little bare. 

I have to admit, I am terrible at writing this documentation, so if anybody wants to help, they could write on various topics about CFEclipse and I shall update the help, I would be most greatful!