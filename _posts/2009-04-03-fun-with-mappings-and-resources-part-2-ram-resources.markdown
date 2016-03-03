---
layout: post
title:  "Fun with mappings and resources: Part 2 RAM Resources"
date:   2009-04-03 03:35 AM +0000
categories: coldfusion
---
<p>In my last post I wrote about using ZIP and FTP as resource locations.<br /><br />Today, I want to focus on why you might want to use RAM as a resource. Imagine the situation, for some crazy reason, you happen to have some code in your database, that you want to actually run. Its in fact just a text string, but you want to run this code. Let's say it is a code example in a blog post or something. How would you get this code to run? <br /><br />A good way to do this is to setup a ram resource, this is fairly easy, again in a mapping you can create:<br /><br />Virtual: ramdisk<br />Resource: ram:///<br /><br />Now all we have to do in our code is:</p>
<p><br />&lt;cffile action="write" file="/ramdisk/test.cfm" output="&lt;cfdump eval=server&gt;"&gt;<br />&lt;cfinclude template="/ramdisk/test.cfm"&gt;<br />        <br />And what you should see is that the string "&lt;cfdump eval=server&gt;" has been executed and rendered correctly! <br />    <br />Very useful if you want to cache and execute content, or just for temporary files!</p>