---
layout: post
title:  "Experiments with CFEclipse, DLTK and Aptana"
date:   2008-04-17 11:09 AM +0000
categories: coldfusion
---
I have been having a bit of a play with <a href="http://www.eclipse.org/dltk/" title="Dynamic Languages Toolkit">Eclipse's DLTK</a> and <a href="http://www.aptana.com/" title="Aptana">Aptana</a> to build two versions of CFEclipse, or rather a CFML editor. They are not complete yet (in fact, the editor doesn't work yet in either). And I thought I would put them up for people to see what I have done, contribute, play etc.

No, there will be no downloads as yet, its just source, so you have to build and debug it yourself, besides, apart from being plugins there isnt really a workable editor there yet. The part that is really missing from both is me hooking up the CFML parser.

The SVN locations are:
Aptana based CFML Editor: http://svn.cfeclipse.org/experimental/com.aptana.ide.editor.cfml/
DLTK based CFML Editor: http://svn.cfeclipse.org/experimental/org.cfeclipse.dltk.cfml/

They both have readme.txt files that say which tutorial I have followed, but as I said, I havent finished them


After some investigation, I have also found that both the Aptana and DLTK can both use <a href="http://www.antlr.org/" title="ANTLR Parser Generator">ANTLR</a> based parsers, which I presume will be for most editors.

<a href="http://www.compoundtheory.com/" title="Compound Theory">Mark Mandel</a> did a lot of work on using Antlr to create a language parser and tokenizer which I havent had a good proper play with as yet. But it has been checked in and people can have a play. There is no documentation as yet, but will work on some of that at a later stage.

http://svn.cfeclipse.org/org.cfeclipse.cfml.core/trunk/

I havent integrated it yet into either of the projects as yet, but that will my next step.