---
layout: post
title:  "Fun with mappings and resources: Part 1 ZIP and FTP"
uid:	"948F3BAA-5F67-4925-A4CC9B0A10D022B0"

categories: railo
permalink: fun-with-mappings-and-resources-part-1-zip-and-ftp
---
<p>One of the many features that I find fantastic in Railo, and has been the topic of many a "after-work-down-the-pub" conversations, has been that of mappings.<br /><br />How I have normally used mappings in the past has just been been to be able to access frameworks such as ModelGlue, Reactor and ColdSpring without having to put them in the webroot.<br /><br />You can still do this with Railo of course, and even set that resource as trusted, but what I wanted to show was some of the really neat features of other types of mappings. <br /><br />Railo supports the ability to create a mapping to other types of resources, such as FTP, HTTP, SFTP, Amazon's S3, ram and ZIP (and TAR and TGZ) filesystems.<br /><br />A quick example of where this might be used is to move old logfiles to a zip file. this happens to everyone's server once in a while, you have a bunch of log files that need moving to zip, all you have to do is create a mapping to the zip file: <br />Virtual: /archive <br />Resource: zip:///Users/markdrew/wwwroot/mapping_examples/archive.zip<br /><br />And then you have one line of code to move that log file to the archive:</p>
<p>    &lt;cffile action="move" source="biglog.log" destination="/archive/biglog.log"&gt;</p>
<p>If you need to read it from the archive it is just as easy:</p>
<p>    &lt;cffile action="read" file="/archive/biglog.log" variable="content"&gt;<br />    &lt;cfdump eval=content&gt;<br /><br />There you go, same line without having to do cfzip or anything like that. Just move the item to that resource.<br /><br />But wait! Lets say I want to move the logs off the server, and put them onto an FTP site. What do we do then? Well, we could change our code to use cfftp, or just change the mapping:<br /><br />Virual: /archive<br />Resource: ftp://username:password@ftpsite.com/uploads/<br /><br />Save it, the code does the same and voila, we are now saving it to an FTP site!  Nice!</p>