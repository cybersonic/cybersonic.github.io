---
layout: post
title:  "Ask Mark: Why you can't edit files in CFEclipse straight from Windows Explorer"
uid:	"8A99A96A-F754-3262-E4A6FD44084B394A"
date:   2007-01-26 11:07 AM +0000
categories: ask-md
---
I just got a question sent to me and its something I would like to clear up (and show where the responsibilities lie really). The question is:

<blockquote>
I've recently moved to CFE from Dreamweaver.   I used to be able to double-click a .cfm/.cfc file and have Dreamweaver start up and be editing that file.  However, if I change the default app for these files to eclipse, when I double click a new instance of Eclipse starts up and I get an error about my workspace being locked if Eclipse is already open. Is there anything I can do to default opening new files with Eclipse to the current instance?	
</blockquote>

Basically Eclipse doesn't work in this way ("WHAT?!!" you might say). It has the idea of Projects which you map to a web folder, so you would (for example) create a CFML Project, give it a name (hmmm... mySite seems to do nicely) and then, instead of using the "Default Location", point it to your site. You can then edit stuff directly.

"Of course..." you might say, "...but what if I want to edit the custom tags under Coldfusion, they aren't in my web directory!", in this situation, I find that linked folders work a treat, and also means I don't have to alt+Tab back to Windows Explorer/OS X Finder.  If you want to see how to implement them, <a href="http://media.libsyn.com/media/markdrew/MappedFolders_copy_1.mov">watch this</a> little video I made a while back. (basically create a new folder in your project in eclipse, give it a name, click advanced, and select the folder it actually points to outside your project).

I find that it takes some getting used to, but after a while, I don't really run around using the Windows Explorer/OS X Finder anymore looking for things.

If you also go to Windows -> Preferences -> General -> Keys and find the cfscript keybinding (Ctrl + Shift + R) and remove it, you can now, from anywhere in the IDE hit those keys, enter the file name you get a dialog that you can enter a file name (and even use wildcards such as * and ?) and it will search through ALL your projects and find the file you are looking for.

Much easier that silly explorer eh?

I hope that helps, even though it doesn't directly answer your question.

On a related note, we have also provided the File Explorer view, (Window -> Show View -> Other... ->CFML -> File Explorer) which allows you to browse your filesystem like the "good" old days with Homesite. You can even add FTP servers!

Edit: Just so you know, this is an oft requested feature of Eclipse anyway check out this bug <a href="https://bugs.eclipse.org/bugs/show_bug.cgi?id=4922">https://bugs.eclipse.org/bugs/show_bug.cgi?id=4922</a>