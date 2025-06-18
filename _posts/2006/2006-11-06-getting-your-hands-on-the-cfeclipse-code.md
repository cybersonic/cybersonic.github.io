---
layout: post
title:  "Getting your hands on the CFEclipse code"
uid:	"8A98F36C-E5EA-DAD4-2E089737EB180E30"

categories: cfeclipse,reference
permalink: getting-your-hands-on-the-cfeclipse-code
---
I have just been looking at the documentation on the current <a href="http://www.cfeclipse.org">cfeclipse.org</a> site, and its very out of date, we have moved our code base from using CVS to using <a href="http://svn.cfeclipse.org">SVN</a> so we could host it ourselves and use <a href="http://trac.cfeclipse.org">Trac</a> rather than depending on Tigris.

Tracy Logan has kindly helped the CFEclipse project in two ways and he deserves much kudos, firstly by fixing the CFC Wizard and putting the right arguments in the tag when it is created, and secondly by writing some instructions on how you can check out the CFEclipse codebase into a project. You can read the article over at <a href="http://www.cfeclipse.org/go/documentation/developer-docs/checking-out">CFEclipse.org</a>

I shall try (I promise!) to make a few articles explaining some of the code behind CFEclipse, although having said that we are in the process (thanks to <a href="http://www.edomgroup.com/blog/index.cfm">Mike Kelp</a>) of breaking out some of the functionality into their own libraries. The first part will be the CFParser, which just checks if the code is correct and throws any errors and warnings. This will mean that we can perform unit tests that are not related to Eclipse itself, meaning in the future (sometime!) people could run their CF code through the parser as part of an online library of unit tests, and we can assign people to fix that.

Let me know your thoughts!

EDIT: if you want to see the latest code, check out the 1.3 dev branch... which is what the 1.3 BETA is based on.