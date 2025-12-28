---
layout: post
title:  "Strange expandPath bug in ColdFusion 8"
uid:	"04821AFF-C797-ED0B-62543B59B2AD74EE"

categories: coldfusion
permalink: strange-expandpath-bug-in-coldfusion-8
---
<p>
I found something that I am not sure if it is a bug or a "feature" whilst developing some functionality in our CMS.

Essentially imagine you have the following directory layout:
</p>
<ul>
	<li>index.cfm</li>
	<li>level1/
		<ul>
			<li>level2/
				<ul>
					<li>index.cfm</li>
				</ul>
			</li>	
		</ul>
	</li>
</ul>

In the root index.cfm I want to expand the path to level2, that is, get the full folder path of "path2", you would do something like:
<br>
<code>
	<cfset mypath1 = "/level1/level2">
	<cfdump var="#expandPath(mypath1)#">
</code>
<p>
Which (in my case) returns: <em>/Library/WebServer/Documents/scratch/level1/level2 </em>
</p>
<p>
<strong>BUT</strong> if you add the forward slash to the path:
<br>
<code>
	<cfset mypath2 = "/level1/level2/">
	<cfdump var="#expandPath(mypath2)#">
</code>
<br>
You get: <em>/Library/WebServer/Documents/scratch/level1/level2/index.cfm/ </em> ?!
<br>
Where did <em>"index.cfm/"</em> come from? I can understand how that might be useful in 0.1% of cases but not when you are simply trying to find the path to the folder. If you remove the index.cfm from the folder it all works fine. 

</p>

<p>
	<a href="http://en.wikipedia.org/wiki/List_of_recurring_in-jokes_in_Private_Eye" title="Recurring in-jokes in Private Eye - Wikipedia, the free encyclopedia">Shome mishtake, shurely? </a>
</p>