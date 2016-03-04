---
layout: post
title:  "CFEclipse: enhancements Part 1"
uid:	"8A98DB41-ED45-9110-5EB02B808C13CEDC"
date:   2006-08-02 11:06 AM +0000
categories: cfeclipse
permalink: cfeclipse-enhancements-part-1
---
In response to the features that the community has been suggesting over at Damon Cooper's blog post on IDE's I thought I would comment on some of the features and the obstacles and issues surrounding them as well as the status of some of the features.

<p><strong>Debugging support</strong><br />
* There is a good plugin for Eclipse (and CFEclipse of course) that allows you to do this. It was shown at CFUnited by Michael Dinowitz and it allows you to put breakpoints in your code and step through, and into, your code.</p>
<p>Check it out at: <a href="http://www.fusion-reactor.com/fusiondebug/">http://www.fusion-reactor.com/fusiondebug/</a><br />
</p>
<p><strong>Defining a &quot;site&quot; with remote and local version</strong><br />
* The idea of sites is a very good metaphor, this is something that I am definitely going to add, its already there in some forms but I am going to tidy it up as well as defining the default external browser you want to use.</p>
<p>If you press F12 (when using Windows) you will be asked to to create a cfeclipse.properties file which defines the project path, the path on the server that maps to the project and the location of a browser you want to use. </p>
<p>The next step is to tidy all these settings up.<br />
</p>
<p><strong>EVERYTHING that is in HomeSite+</strong><br />
Right. Of course. Even the millions of toolbars? I think we have a chance to create something better, more intelligent. I dont think its fair to be held back by mimicking HomeSite+ to the hilt.</p>
<p><strong>BOM for Unicode pages</strong><br />
* File encoding is usually handled by Eclipse itself as part of the platform.</p>
<p>I believe it is not part of the requirement for UTF-8 but I dont know enough about this personally. There is a <a href="http://www.sustainablegis.com/blog/cfg11n/index.cfm?mode=entry&amp;entry=8B5D7DCB-20ED-7DEE-2AC2AD8DB7123EDE">post here</a> explainging more about this:</p>
<p>You can see the bugs related to this issue over at the eclipse <a href="https://bugs.eclipse.org/bugs/buglist.cgi?bug_status=UNCONFIRMED&amp;bug_status=NEW&amp;bug_status=ASSIGNED&amp;bug_status=REOPENED&amp;field0-0-0=product&amp;type0-0-0=substring&amp;value0-0-0=BOM&amp;field0-0-1=component&amp;type0-0-1=substring&amp;value0-0-1=BOM&amp;field0-0-2=short_desc&amp;type0-0-2=substring&amp;value0-0-2=BOM&amp;field0-0-3=status_whiteboard&amp;type0-0-3=substring&amp;value0-0-3=BOM">bugs site</a><br />
</p>
<p><strong>Variable insight within a CFC (and I presume CFM page) from Queries</strong><br />
  * This is already in the works, it already parses the contents of CFQUERY and will try and guess columns for you, without needing to do a round trip to the server. It needs more work to make it a little tighter and work how you think they should do. <br />
</p>
<p><strong>Right Click to deploy to multiple RDS/FTP servers</strong><br />
  * I shall be working on this soon, as part of defining your site, you will also be able to define a remote site (maybe a number of them). The problem (or obstacle more like it) is getting RDS and sFTP working fine. I have done some tests with using different sFTP libraries and have already worked on a Factory so that you can just plug different file systems (i.e. I can then plugin different connection methods)<br />
</p>
<p><strong>Create a file without actually creating a new file on the file system</strong><br />
* A tough one, but something we are kind of already doing for RDS and FTP to work, but this works by (internally) eclipse saving your file to a project that is hidden. We could follow this methodology and just say that if you click save, you need to save it in your project. The problem with this might come in later if you start writing a CFC and sorting out component paths and function insight.</p>

I shall be posting answers to the rest over the next few days