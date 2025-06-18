---
layout: post
title:  "Reminder: Always scope your local variables in functions!"
uid:	"8A9B198D-945D-2438-44140FA032D1213D"

categories: coldfusion
permalink: reminder-always-scope-your-local-variables-in-functions
---
I have just spent a bewildering hour going through a system checking everything only to finally find that I missed scoping a variable with "var" within a function. Now this is something that I tell other people to do, but I think its VERY important that you do this when you are coding Services/Singletons (or rather, objects of which there is only one, and its cached somewhere).


The issue is that it seems that if you are caching a CFC (such as a service) and you have a variable in a function that returns something, then the next time you call it, it fails to re-set that variable, the CFC will keep the previous copy, rather than a new one being created when the function is called, giving you odd results sometimes.

I know there will be loads of people saying "Yeah, I knew that", but I wanted to say that I DO know this, and still I fell for it. So keep 'em peeled!