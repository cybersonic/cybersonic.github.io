---
layout: post
title:  "CFEclipse new feature under development part 2"
uid:	"8A9885D0-D7FD-CC2E-BD96A21D3E238478"

categories: cfeclipse
permalink: cfeclipse-new-feature-under-development-part-2
---
I have just checked in some new functionality to CFEclipse, again this is not complete, but it works for some things. I mentioned I had added Component insight <a href="http://www.markdrew.co.uk/blog/index.cfm/2006/5/7/Coming-Soon-Getting-CFEclipse-to-do-Component-Insight">previously</a>, well, that has been removed now, but just for the moment since I am adding generic variable insight.<br /><br />The variable insight is a way of parsing variables that you set in your document and giving you completion for those variables. It is a work in progress and so far I have added&nbsp; completion for:<br /><br />
<ul>
    <li>CFQUERY (name and result): including showing column names if they are in a SELECT statement</li>
    <li>CFDIRECTORY</li>
    <li>CFFTP (name and result)</li>
    <li>CFSEARCH</li>
    <li>CFCOLLECTION</li>
</ul>
I have also added completion for CFPARAM so if you do something like:<br />
<div class="code"><font color="MAROON">&lt;cfparam default=<font color="BLUE">&quot;&quot;</font> name=<font color="BLUE">&quot;FORM.this&quot;</font> /&gt;</font><br /><font color="MAROON">&lt;cfparam default=<font color="BLUE">&quot;&quot;</font> name=<font color="BLUE">&quot;FORM.that&quot;</font> /&gt;</font>&nbsp;<font color="MAROON"></font></div>
<br />then you will get content assist when you type &quot;FORM.&quot; and the same for any variable scope.<br /><br />This works by having a VariableParser run that makes a list of variables in your document when you hit the &quot;.&quot;. I need to extend this parser to handle the contents of &lt;cfset&gt;&nbsp; and &lt;cfscript&gt;, once that is done, I shall be looking for components so that you can get insight into those too.  <br /><br />UPDATE:<br />Here are some screenshots of it in action: <br /> 1) CFQuery &quot;name&quot; completion:<br />&nbsp;<a href="/UserFiles/Image/CFEassist/Picture 1.png" target="_blank"><img border="0" alt="" src="/UserFiles/Image/CFEassist/Picture 1_thmb.png" /></a><br /> 2) CFQuery &quot;result&quot; completion:<br />&nbsp;<a href="/UserFiles/Image/CFEassist/Picture 2.png" target="_blank"><img border="0" alt="" src="/UserFiles/Image/CFEassist/Picture 2_thmb.png" /></a> <br />3) FORM variables:<br />&nbsp;<a href="/UserFiles/Image/CFEassist/Picture 3.png" target="_blank"><img border="0" alt="" src="/UserFiles/Image/CFEassist/Picture 3_thmb.png" /></a> <br />4) SESSION variables:<br />&nbsp;<a href="/UserFiles/Image/CFEassist/Picture 4.png" target="_blank"><img border="0" alt="" src="/UserFiles/Image/CFEassist/Picture 4_thmb.png" /></a> <br />5)I also added a way to view&nbsp; ALL variables if you type a space and ctrl + &lt;space&gt;:<br />&nbsp;<a href="/UserFiles/Image/CFEassist/Picture 5.png" target="_blank"><img border="0" alt="" src="/UserFiles/Image/CFEassist/Picture 5_thmb.png" /></a>