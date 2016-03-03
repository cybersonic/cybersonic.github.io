---
layout: post
title:  "ColdFusion Webservice gotcha on OS X"
date:   2008-09-25 11:49 AM +0000
categories: coldspring
---
<p>As I was getting my presentation on ColdSpring ready for A Wee Dram of Scotch, I come across the following problem, that none of my webservices would work! 
I started getting the following  error:</p>
<p>
<code class="border">
	coldfusion.jsp.JavaCompiler$UnknownCompiler: Unable to run the internal Java compiler: java.lang.NoClassDefFoundError: javax/tools/StandardJavaFileManager.
	
</code></p>
<p><code></code>
Following a bunch of blogs and thanks to Peter Freitag, the answer was simple, move the tools.jar from your &lt;ColdFusion Install&gt;/lib (or &lt;JRUN Install&gt;servers/cfusion/cfusion-ear/cfusion-war/WEB-INF/cfusion/lib ) and restart the server. Bam... back to webservices working fine again. 
I am just putting this either to help other people, or to help me next time I forget about this</p>