---
layout: post
title:  "Creating your own framework (and why you should do it)"
uid:	"8A98FF62-0E6D-B3F0-88276D919DEE8A89"
date:   2006-11-20 11:06 AM +0000
categories: coldfusion
---
I just spotted a couple of posts that are going along with my own work, Peter Bell has released <a href="http://www.pbell.com/index.cfm/2006/11/19/LightWire-Version-001-released">LightWire Version 0.01 </a>and another post over at WebApper by Steve Nelson with regards to running<a href="http://www.webapper.net/index.cfm/2006/11/17/CFCOnly-Version-of-Fusebox"> Fusebox using CFC's</a> (rather than the massive XML file).

I am a known fan of Model-Glue, Reactor and ColdSpring, but for my latest project (for work, not released) I am creating a framework that is similar to MG but since it has one purpose there is less (sorry about this Joe) 'bloat'. Not that MG is bloated, but for our framework we have some specific goals and not others (such as scaffolding).

Its a specific framework that needs to be built for speed and deployment ease. It means that there should very few application files (the front end of the application) and its based on Application.cfc doing a lot of the calling. Index.cfm being a rather lonely file doing not much at all (maybe up to 5 lines of code or something).

 So far I have CFC's as listeners and controllers, a generic Value Bean (like the Event object in model glue, but its re-usable for other parts of the application), <a href="http://blogs.sanmathi.org/ashwin/2006/07/01/memory-sensitive-caching-for-cf/">SoftCache</a> to keep the right things in memory and a optional cache level (its for a CMS so you can get stuff from cache, from live and from edit modes ). I need to add some forwarding functions (to the core) and more data access in controllers (but that wont be core of the framework really)

Sometimes you need to write your own frameworks, but when you do you will come across the same problems that are resolved by other frameworks. To that end, you should DEFINITELY read <a href="http://www.pbell.com/">Peter Bell's Application Generation</a> and look into how the other frameworks deal with those issues.