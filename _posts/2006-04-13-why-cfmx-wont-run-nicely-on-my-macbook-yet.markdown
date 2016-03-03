---
layout: post
title:  "Why CFMX wont run nicely on my MacBook ... yet"
date:   2006-04-13 11:06 AM +0000
categories: adobe
---
Ok, so its a bit of an alarmist headline, but I went through a whole procedure of installing CFMX to run on JRun and THAT runs (see my <a href="http://www.markdrew.co.uk/blog/index.cfm/2006/4/12/Installing-Coldfusion-and-JRun-on-a-MacBook-Pro">previous post</a>) which is fair enough, but I dont like the following:<br />
<ul>
    <li>putting all my sites in /Applications/JRun4/servers/default/cfusion, where I cant run PHP and other websites (I feel its untidy but that is just me)</li>
    <li>having the context as /cfusion and the url on a port like: http://localhost:8100/cfusion/</li>
    <li>having to start JRun manually.</li>
</ul>
Ok, so lets go through these and fix each one, and this is why the title of the post, to kill the first two I thought that I could manually deploy the wsconfig, since I was getting errors and the gui version didnt see my apache webserver:
<div class="code"> markdrew:/Applications/JRun4/lib mark$ java -jar wsconfig.jar <br />2006-04-13 11:56:57.992 java[487] CFLog (<font color="BLUE">0</font>): CFMessagePort: bootstrap_register(): failed 1103 (<font color="BLUE">0</font>x44f), port = 0xf803, name = 'java.ServiceProvider'<br />See /usr/include/servers/bootstrap_defs.h for the error codes.<br />2006-04-13 11:56:57.995 java[487] CFLog (<font color="BLUE">99</font>): CFMessagePortCreateLocal(): failed to name Mach port (java.ServiceProvider)<font color="NAVY">&lt;br /&gt;</font></div>
Then I tried the console version of wsconfig <br />
<div class="code">markdrew:/Applications/JRun4/lib mark$ java -jar wsconfig.jar -ws Apache<br />Apache web server is not supported on Mac OS X</div>
Ok, so if it is just getting errors, lets do it manually as defined by <a href="http://www.macromedia.com/cfusion/knowledgebase/index.cfm?id=tn_18724">this document over at macromedia</a><br /><br />I wont detail how I did this as the document describes how to manually do all of this, and then I come to the last part, which is where you get the mod_jrun.so from the expanded wsconfig.jar, the options didnt have what I was looking for:<br /><br /><img width="420" height="464" alt="" src="/UserFiles/Image/jrun/Picture_4.png" /><br /><br />So, being the person I am, I tried them all and got the following error each time:<br />
<div class="code">markdrew:/Applications/JRun4/lib mark$ apachectl restart  <br />/usr/sbin/apachectl restart: httpd not running, trying to start<br />Processing config directory: /private/etc/httpd/users/*.conf<br />Processing config file: /private/etc/httpd/users/mark.conf<br />Syntax error on line 1112 of /etc/httpd/httpd.conf:<br />Cannot load /Applications/JRun4/lib/wsconfig/1/mod_jrun.so into server: (reason unknown)<br />/usr/sbin/apachectl restart: httpd could not be started</div>
<br /> So that is where I am at. If I could get the source to mod_jrun.so and recompile it under my MacBook Pro it might work. I tried the intel, but that didnt work, I tried the linux and the mac versions still with no use.  If anybody has any ideas, let me know!<br /><br />EDIT: Simeon Bateman pointed me to <a href="http://www.macromedia.com/cfusion/knowledgebase/index.cfm?id=tn_18748">this article</a> on rebuilding the mod_jrun.so! so I shall be giving this a go tonight to see if I can get it all working smoothly!<br />