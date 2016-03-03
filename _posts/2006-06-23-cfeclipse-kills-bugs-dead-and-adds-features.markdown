---
layout: post
title:  "CFEclipse: Kills Bugs Dead and adds Features."
uid:	"8A98B432-A326-AEC3-3BDF7610578F2401"
date:   2006-06-23 11:06 AM +0000
categories: cfeclipse
---
I have been looking through some of the code of CFEclipse and I managed to kill a bug or two that were really annoying me  (and others I guess)

<ol>

<li> Error showing when opening a file from the file explorer: This has been a bug since I moved up to 3.2 and it was really annoying me. I finally managed to figure out how to open an external file with 3.2 and it all should be working
<li> Error with snippets: the snippet trigger text file (keyCombos.properties) was being saved into the root directory instead of into the root of the snippet directory (so it could find the snippets) This means you can now trigger snippets again!
<li> FTP ReadOnly error: When you open a file that doesnt have group write permissions, CFEclipse would say that it was read only and treat it as a read only file. This has been fixed.
<li> Actual location of a file: When you open a CF document you will now see on the status bar the actual location of that file on your system, not just the project relative location of the file.
<li> Removed dependency for Java 1.5 (will come back later but for the moment it was more of a PITA than was worth it.
</ol>

Apart from those bugs I also cleared about 15 bugs from the tigris issue tracker and have been looking at some new features that will be implemented at a later stage, why a later stage you ask? Well, I am getting ready for  CFEclipse 1.3 to hit Beta, but more on this later. Just thought I would whet your appetites ;)