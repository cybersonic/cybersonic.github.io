---
layout: post
title:  "Re-Visiting the Parser in CFEclipse"
uid:	"8A9C251C-0B4A-3480-4E4FA34AA09B982A"
date:   2008-07-21 11:10 AM +0000
categories: cfeclipse
---
As some people that have been using CFEclipse for a while might have realised, there is a parser that figures out the content in a CFML file.

So far, this parser has been embedded with Eclipse specific code, so I have started re-factoring this into its own project so we can test various files and use it as a project by itself.

The idea is that I can scan whole folders for files and parse them and keep track of the errors and things that we would expect to find. Also, this re-factoring means that other developers and help me figure out speed improvements and bug fixes without getting caught up in Eclipse code.

I haven't finished porting it (but its nearly there) and you can check out the code from: <a href="http://svn.cfeclipse.org/org.cfeclipse.cfml.parser/" title="Revision 667: /org.cfeclipse.cfml.parser">http://svn.cfeclipse.org/org.cfeclipse.cfml.parser/</a>.

You should be able  to check it out into Eclipse and run the org.cfeclipse.cfml.parser.tests.ParserTest.java class passing in an argument for the location of the files you want to parse.

There are still compilation errors with it, so if you want to have a go, you can get the code and get fiddling.

One thing to note, is that you need to use your <a href="http://trac.cfeclipse.org" title="CFEclipse Plugin – Trac">http://trac.cfeclipse.org</a> username and password to get the code.