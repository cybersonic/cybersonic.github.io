---
layout: post
title:  "CFEclipse's SnipEx server components released"
uid:	"8A9AAAF7-972B-019F-454ED143EE0B6E6B"
date:   2007-07-11 11:08 AM +0000
categories: snipex
---
After a busy few months in conferences I can finally get back to tidying stuff off my desk. So to start the ball rolling, I have released to <a href="http://snipex.riaforge.org/" title="SnipEx">RiaForge</a> the server components for the SnipEx functionality in CFEclipse.

Its a pretty simple setup, 2 tables and 2 CFC's that make up the whole application. Once you have created the tables, just create a new entry in the lib table that defines your server, and then add any libraries you want to add (they are children of the root and you can make tree sets like this) and then start adding your snippets.

It should be pretty well documented as a server. To attach your server in CFEclipse, open the Snippets View, then click on the down arrow at the top of the view and click "Edit SnipEx Servers" and enter the URL to the SnipEx.cfc 

I have also checked in the code into <a href="http://svn.riaforge.org/snipex/snipex/trunk/" title="Revision 4: /snipex/trunk">RiaForge</a> so if you need to send me any patches just check out the code into CFEclipse from SVN.

Oh, and this is my little pressie to you all on my birthday!