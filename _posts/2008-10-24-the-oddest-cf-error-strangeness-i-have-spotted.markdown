---
layout: post
title:  "The oddest CF error/strangeness I have spotted"
uid:	"2DB03852-DC71-9A91-B079CE0DEDF9A6A1"
date:   2008-10-24 03:12 AM +0000
categories: coldfusion
permalink: the-oddest-cf-error-strangeness-i-have-spotted
---
<p>I recently have been working on adding a <a title="Stake Five   ::  Memory-sensitive Caching for CF" href="http://blogs.sanmathi.org/ashwin/2006/07/01/memory-sensitive-caching-for-cf/">couple</a> of <a title="Exception" href="http://www.infoaccelerator.net/index.cfm?event=showEntry&amp;entryId=5F0448E1-FF30-C9A3-AD26173857DBC0E1">different</a> cache providers for <a title="The Model-Glue Framework" href="http://www.model-glue.com/coldfusion.cfm">Model-Glue 3
</a>.</p>
<p>
So I was getting my head round <a title="Exception" href="http://www.infoaccelerator.net/index.cfm?event=showEntry&amp;entryId=5F0448E1-FF30-C9A3-AD26173857DBC0E1">Andrew Powell's CF_EHCache</a> so that I can write an interface for it that Model-Glue can use, which should be simple enough since it already uses a SimpleTimedCache, when I come across a very odd thing, with the code out of the box I got the following error:
</p>
<p>
<code>
	The system has attempted to use an undefined value, which usually indicates a programming error, either in your code or some system code.
	Null Pointers are another name for undefined values.
</code></p>
<p><code></code>
So I started dumping my way through it, so to speak, but it would work...
eh?!</p>
<pre><span style="color: #555555; font-family: -webkit-monospace; font-size: 9px; white-space: normal;"><span style="white-space: pre;">	</span><span style="color: #000000; font-family: Verdana; font-size: 10px; white-space: pre;">&lt;cfscript&gt;</span></span><br /></pre>
<pre><span style="white-space: pre;">		</span>var mBeanServer     = createObject('java','java.lang.management.ManagementFactory').getPlatformMBeanServer();<br /></pre>
<p><span style="font-family: -webkit-monospace; font-size: 9px;">
</span></p>
<pre><span style="color: #555555; font-family: verdana; font-size: 11px; white-space: normal;"><span style="white-space: pre;">	</span><span style="white-space: pre;"><span style="color: #000000; font-size: 10px; white-space: pre;">		</span></span><span style="color: #000000; font-size: 10px; white-space: pre;">variables.manager</span><span style="white-space: pre;"><span style="color: #000000; font-size: 10px; white-space: pre;">	</span></span><span style="color: #000000; font-size: 10px; white-space: pre;">= createObject('java','net.sf.ehcache.CacheManager');</span></span><br /></pre>
<pre><span style="white-space: pre;">			</span>variables.manager.create(javacast("string",expandPath('#arguments.scope#.xml')));<br /></pre>
<pre><span style="white-space: pre;">			</span>variables.cacheName = arguments.cacheName;<br /></pre>
<pre><span style="white-space: pre;">	</span>&lt;/cfscript&gt;<br /></pre>
<pre><span style="white-space: pre;">	</span>&lt;cfdump var="#variables.manager#"&gt;<br /></pre>
<pre>	&lt;cfset createObject('java','net.sf.ehcache.management.ManagementService').registerMBeans(variables.manager,mBeanServer,<br /></pre>
<pre><span style="white-space: pre;">		</span>javacast("boolean",false),<br /></pre>
<pre><span style="white-space: pre;">		</span>javacast("boolean",false),<br /></pre>
<pre><span style="white-space: pre;">		</span>javacast("boolean",false),<br /></pre>
<pre><span style="white-space: pre;">		</span>javacast("boolean",true))&gt;<br /></pre>
<pre>&lt;cfset variables.manager.addCache(javacast("string",arguments.cacheName))&gt;<br /></pre>
<p> </p>
<p><code>	
	
	
	
	
</code>
The above is the constructor code, I have split it out a bit so that you can see what is happening, but if call the above code without the cfdump, I get an error, but if remove it, it crashes. 
I have never seen something like this before.</p>
<p>
UPDATE!</p>
<p>This morning, writing this post, I realised that in the third line I had forgotten to add the .init() to the CacheManager. Go figure! Seems that cfdump does the init for you eh?</p>