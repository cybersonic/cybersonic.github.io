---
layout: post
title:  "CFEclipse: enhancements Part 3"
uid:	"8A98DFC5-ED75-8B5F-3062F78C6B9CDF77"
date:   2006-08-07 11:06 AM +0000
categories: cfeclipse,coldfusion
permalink: cfeclipse-enhancements-part-3
---
In the <a href="/blog/index.cfm/2006/8/3/CFEclipse-enhancements-Part-2">continuing list of features</a> that people want for CFEclipse, I tackle the rest of the list (so far!) and see if people comment on the <a href="/blog/index.cfm/2006/8/3/CFEclipse-enhancements-Part-2">last</a> couple of <a href="/blog/index.cfm/2006/8/2/CFEclipse-enhancements">posts</a>

<p><strong>sFTP support <br />
</strong>I mentioned this in a previous post, but yes, there will be a plugin that supports multiple file systems. So far I have pencilled in RDS, FTP and sFTP. This is a part of a bigger project of being able to both synch and do get and put operations to a remote server. I am checking out the <a href="http://jakarta.apache.org/commons/vfs/">Apache Commons VFS</a> project for this and doing some tests on how to add another file system (RDS) to the mix </p>
<p><strong>Code Formatting<br />
</strong>A good idea and this will come as part of the &quot;Generators&quot; miniproject/plugin that I am thinking of doing that groups a lot of code re-formatting and generation of &quot;stuff&quot; (e.g. Test Cases, Documentation, Getters and Setters etc). The configuration of this will be something that I really need to get my head round, and use a lot (I dont personally use automated code formatting, I am just THAT neat ;)) </p>
<p><strong>Alternate File System support<br />
</strong>Nathan Strutz mentioned he wanted Alternate FileSystem support, I am not sure what he means precicely but I think if this doesnt come under the &quot;Connector&quot; project/plugin then this would need to go to the Eclipse project itself. </p>
<p><strong>Fix Drag &amp; Drop text</strong><br />
It is true, there are a few idiosynchronies about Drag and Drop in Eclipse (mainly, its never supported and we added our own version!) but apart from dragging text around an editor, we have added the ability to drag a file onto the editor and it will create a link depending on the file extension. So that is good right? </p>
<p><strong>Fix need to infrequently re-open the file<br />
</strong>This is a strange bug that I am aware of and I need to get fixed. Basically the problem arises when you add a snippet near the end of the file and somehow the tags get replicated, but only in the way they are displayed, not in the actual content. I am looking into this. </p>
<p><strong>Framework functions (create event etc)<br />
</strong>I am planning a series of plugins to help with different frameworks. I already worked on one for Fusebox a while back but I have stopped its development really due to the fact that I dont use fusebox anymore! After CFUnited and some good chats with Joe Rinehart I think we can do some awesome plugins for Model-Glue and if we are clever enough, we can make it a &quot;generic&quot; framework plugin that as long as its an XML based framework we can add some more rules. Watch this space.</p>
<p><strong>Unit Testing</strong><br />
I did mention that this is coming as part of the &quot;Generators&quot; plugin, so yes, this is coming and it might all be built in for you to run your tests etc. There are some dependencies here but I am going to try and get it all working at some point. </p>
<p><strong>&quot;CFEclipse to be like HomeSite+ without the bugs&quot;<br />
</strong>So you want lest bugs huh? Well, that is a great way to contribute to the project, find a bug that bugs you and try and fix it! If you dont know how to get started, you can always hit me up and I can point you in the right direction. That is the beauty of a Open Source Project, you CAN contribute and make a difference! <strong><br />
</strong></p>