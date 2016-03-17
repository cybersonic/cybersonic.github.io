---
layout: post
title:  "Model Glue Tips Part 3: Keep your views tidy"
uid:	"8A9ACDFF-04B0-ACEF-2821FAB6FBB2712D"
date:   2007-08-12 11:08 AM +0000
categories: model-glue
permalink: model-glue-tips-part-3-keep-your-views-tidy
---
When you develop model-glue apps, you start adding your view files in the /views directory, this all fine as a demo or in a small application, but it can get very full of items. 

An easy way to sort out your views a bit, is to use the same naming convention we used for the event-handlers but to create directories to hold the views named after the controller they relate to, for example:

<pre>
	/views
		/pages
		/security
		/products
		/layouts
		/nav
	...
</pre>
	
I tend to keep views that are used in multiple places (lets say a top nav) in a <em>/nav </em>directory and the layouts in a <em>/layouts</em> directory.

Another way to distinguish your view files comes in the way with prefixes for what kind of file they are, so for example listing pages have dsp_, form pages have frm_, pages that output XMl start with  xml_ and navigation pages start with nav_.

Hopefully following these tips it will be a lot easier for you to find the right view quicker!