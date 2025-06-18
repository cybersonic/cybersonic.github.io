---
layout: post
title:  "CFML Mythbusters competition: Choosing the winners"
uid:	"B5399A2B-D0A4-4D38-8FFC34B5A23B46A8"

categories: book,railo
permalink: cfml-mythbusters-competition-choosing-the-winners
---
<p>A couple of weeks ago, I posted about running a competition to be in my <a href="http://www.markdrew.co.uk/blog/post.cfm/competition-cfml-mythbusters-win-my-book" title="Competition: CFML Mythbusters! Win my book! &#8212; Mark Drew (Redux)- cf_etc...">CFML Mythbusters competition</a>, well the competition is now over and it's time to choose the winners</p>

<p>Before choosing them, I thought I would post the code I am using to choose them and the process, so to be nice and transparent.</p>

<p>First off, everyone could post multiple times and this went into a Google Docs spreadsheet, so they could have multiple entries. Since I could see how many entries there were, for example 1-20, this is easy.</p>

<p>I decided to create an array (because they are much sexier than lists), each position with the number of the entry. Then randomise those positions and then simply choose positions 1,2,3 and 4 from their positions in their array</p>

<p>So here is the code (not including the form, since I am pretty sure you know how to make a form.):</p>

<code>
		<cfscript>
			aEntries = [];
			loop from="#FORM.from#" to="#FORM.to#" index="e"\{
				ArrayAppend(aEntries,e);
			}
				
			collection = CreateObject("java", "java.util.Collections");
			collection.shuffle(aEntries);
		</cfscript>
		<cfoutput>
		<ol>
			<li>First Place: #aEntries[1]#</li>
			<li>Second Places: #aEntries[2]# and #aEntries[3]#</li>
			<li>Third Place: #aEntries[4]#</li>
		</ol>
		</cfoutput>
</code>
<p>Did you spot the Java class? Yep! The java.util.Collections class is really handy for manipulating Arrays in different ways, and of course, since (in Railo at least) an Array can be used by the Collections it is perfect. </p>

<p>So what do you think? Is this a fair way to select some random people?</p>