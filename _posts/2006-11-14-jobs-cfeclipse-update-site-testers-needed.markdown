---
layout: post
title:  "Jobs @ CFEclipse: Update site testers needed!"
uid:	"8A98FB7A-C1AF-47A7-E36DB04A18353054"
date:   2006-11-14 11:06 AM +0000
categories: cfeclipse
---
Well, as the title said, I have managed to get the update site working and I need some testers to check the new versions of CFEclipse 1.2 and CFEclipse 1.3 Beta RC1.

What we need people to do is add a new update site (Help -> Software Updates -> Find and Install -> Search for new features to install -> New Remote Site -> Name: CFEclipse Beta Site, URL: http://www.cfeclipse.org/betaupdate) and check that each version of CFEclipse works. I would prefer for people that can to be able to check with Eclipse 3.1 and Eclipse 3.2 (so that is four installs)

A couple of things to note:
<ul>
	<li>If you have CFEclipse 1.2 installed, you need to uninstall it*</li>
	<li>Once you install the Stable CFEclipse you can uninstall it to try the Beta CFEclipse install**</li>

</ul>
  

Let me know if it all works ok!

* To uninstall CFEclipse 1.2 you need to delete the com.rohanclan.cfml.XXX folder from your plugins directory

** To uninstall the features installed through the update site you can do it via Help -> Software Updates -> Manage Configuration, expand Eclipse SDK, select the CFEclipse XXX item and right click on it to delete it