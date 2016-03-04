---
layout: post
title:  "Fusebox 3 and 4 plugin for CFEclipse"
uid:	"8A978E46-EF11-49F9-49472DB5737B3EEC"
date:   2005-01-15 11:05 AM +0000
categories: coldfusion
permalink: fusebox-3-and-4-plugin-for-cfeclipse
---
<a href="http://cfopen.org/projects/fusebox3cfe/"><img style="border: 1px solid rgb(0, 0, 0); margin: 2px;" src="http://photos1.blogger.com/img/21/1061/320/fuseboxLogoMine.jpg" align="left" border="0" /></a>
With the help of Simeon Bateman and Sean Corfield I have included support (maybe minor) to view fusebox 4 applications.

This was actually easier than expected, with the only real drag being the property page not behaving like it should.

So, instead of choosing what version you have of fusebox, the plugin now auto magically chooses for you based on whether you have a fbx_circuits.cfm file or a fusebox.xml.cfm file.

Clever people out there will probably ask "what happens if I have BOTH in the same directory??" Well, in short.. dont. I havent tested this but I suspect that the fusebox.xml.cfm file will win. (hey, he is the latest and greatest!)

I hope we get good feedback on this release. I know that it isnt FEATURE packed, but that is coming soon. Any suggestions for features etc are always welcome

Get the download at: <a href="http://cfopen.org/projects/fusebox3cfe/">http://cfopen.org/projects/fusebox3cfe/</a>