---
layout: post
title:  "Model Glue Tips: Splitting out ColdSpring"
uid:	"8A9AE0CB-E25C-8C5B-9F5CF153DA830A70"
date:   2007-10-27 11:08 AM +0000
categories: coldspring
permalink: model-glue-tips-splitting-out-coldspring
---
A comment posted in my entry about  <a href="http://www.markdrew.co.uk/blog/index.cfm?mode=entry&amp;entry=51E0DBB6-C4CE-D185-3D7BF85674ADC07E">Model Glue Tips Part 1: Separate out your Model-Glue file</a>  reminded me that I should continue with some of those postings.

One of the things that happens when you start building larger applications is that you get a lot of objects that you are managing with ColdSpring. This means that the file can get rather large, and again that is a bad thing right (I keep going on about this to lots of people that write CF, the same goes for your XML files).

There are other reasons to split out the ColdSpring file, apart from a neatness. One of our applications actually creates other ModelGlue applications. And each one of these has separate configurations and in fact available objects (they are automatically written out) as well as maybe some custom configurations.

The problem would be that if you update the core code, that is, objects that are core to the system, you dont want to be messing about with merging these files together, so I tend to split things out something like:

<ul><li>ColdSpring.xml&nbsp;&nbsp; &lt;- Main (Core) ColdSpring File</li><li>ColdSpring_Config.xml&nbsp; &lt;- Automatically written file that has our DSN, reactor and other site specific settings</li><li>ColdSpring_Custom.xml &lt;- Custom settings and mappings for the application</li></ul>
All these files are complete ColdSpring files in themselves (that is, they start with &lt;beans&gt;) and are imported into the main ColdSpring file as imports:

<code>
	<beans>
	    <import requires="config/ColdSpring_Config.xml" />
	    <import requires="config/ColdSpring_Custom.xml" />

	    ....
	   <!-- The rest of the core files -->

	</beans>

</code>
Once you have done this, beans in the external files are loaded as normal. 

A quick note, and I haven't checked this properly, but this works in the bleeding edge version of ColdSpring which you can get through CVS following the instructions here: <a href="http://www.coldspringframework.org/index.cfm?objectid=2DD5F8AF-DD05-F8C8-7860429E21850D7E">http://www.coldspringframework.org/index.cfm?objectid=2DD5F8AF-DD05-F8C8-7860429E21850D7E</a>


   <!-- technorati tags begin --><p style="font-size:10px;text-align:right;">Tags: <a href="http://technorati.com/tag/ColdSpring" rel="tag">ColdSpring</a>, <a href="http://technorati.com/tag/ColdFusion" rel="tag">ColdFusion</a>, <a href="http://technorati.com/tag/%20ModelGlue" rel="tag"> ModelGlue</a></p><!-- technorati tags end -->