---
layout: post
title:  "Running ColdFusion 8 on Leopard"
uid:	"8A9AE02F-9A35-9301-0CC2E3638F12C060"

categories: apple,coldfusion
permalink: running-coldfusion-8-on-leopard
---
I have had a few people ping me on IM telling me that they had some problems running ColdFusion 8 on Leopard. Well, I havent had any problems but then again, I might have a slightly different setup than most (or maybe not!) 

How I installed it was as follows:
<ol><li>Run the installer, and select Multiserver 
</li><li>Do all the settings as you want, I installed it into Applications/JRun4
</li><li>Once it has installed, it wont be able to go the web based configuration tool as it seems the server hasnt actually started, so, open up Terminal (Utilities/Terminal)</li><li>Type sudo <span style="font-family: Courier;">/Applications/JRun4/bin/jrun -start cfusion</span></li><li>Coldfusion should start, but it isnt properly configured so go to: http://localhost/cfide/administrator/index.cfm (note the index.cfm, apache isnt configured to serve index.cfm as a default file yet)</li><li>Once you have gone through the process, open up /etc/apache2/httpd.config and look for the line :
&nbsp;<span style="font-family: Courier;">DirectoryIndex index.html<span style="font-family: Arial;"> and change it to&nbsp; </span>DirectoryIndex index.cfm index.html</span></li><li style="font-family: Arial;">Restart apache by opening another Terminal window and type:
<span style="font-family: Courier;">sudo apachectl restart</span></li></ol>That should be it. That is how I configured it (I then split it out into a couple of virtual hosts with different versions of CF running, but that is another story)

I hope this helps!


EDIT: I have tried this with a fresh download and it all seemed to go well, apart from the final screen where it tells me that the webserver couldn't be restarted, but that is what happened before.


Apache Config info:

<a href="http://www.markdrew.co.uk/blog/images//Picture 2.png">
<img border="0" src="http://www.markdrew.co.uk/blog/images//config_thumb.png">
</a>

Error about restarting:

<a href="http://www.markdrew.co.uk/blog/images//Picture 3.png">
<img border="0" src="http://www.markdrew.co.uk/blog/images//apache_not_start.png"></a>


My start page:

<a href="http://www.markdrew.co.uk/blog/images//Picture 4.png">
<img border="0" src="http://www.markdrew.co.uk/blog/images//myconfig.png"></a>