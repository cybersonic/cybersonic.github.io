---
layout: post
title:  "Testing sent emails during development"
uid:	"B7FA4ECB-F659-4493-ABE6922AA76A82C9"

categories: 
permalink: testing-sent-emails-during-development
---
<p>There are many times when I get to the part of developing on my local machine that I want a smtp server to use. I have tried postfix and some other unix type applications on OS X for this but none of them were quite what I wanted, since I want to also integrate tests with it. <br /><br />And to be honest, it took me too much time (that I don't have as you have noticed by the lack of blog posts) to figure out all the settings to do this. <br /><br />Until I found <a href="http://sourceforge.net/projects/fakemail/">fakemail</a> (<a href="http://sourceforge.net/projects/fakemail/">http://sourceforge.net/projects/fakemail/</a>).<br /><br />Fakemail is a python (or perl) script that you can run to simulate an SMTP server, but more importantly you can define where the emails that are sent out go.</p>
<p>It is very easy to install (check out this page: <a href="http://www.lastcraft.com/fakemail.php">http://www.lastcraft.com/fakemail.php</a>) and run, and does the trick splendidly.</p>