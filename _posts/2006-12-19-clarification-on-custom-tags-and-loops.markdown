---
layout: post
title:  "Clarification on Custom Tags and loops"
uid:	"8A995C94-EC98-5100-3AE68F672C862863"
date:   2006-12-19 11:06 AM +0000
categories: coldfusion
---
Yesterday I posted a question on how to loop through the results of a custom tag, maybe I should have been a bit more precice in the overall requirement, and in fact how I solved it (not nicely hence the post).

Lets say you are abstracting some functionality in your application, lets say a list of users, that you want your design department to be able to style and do what they will without directly using coldfusion.

Lets look at some code first:

<code>
	<cfimport taglib = "tags" prefix = "cms">
	<table>
	<cms:userlist>
		<tr>
			<td><cms:column name="username"/></td>
			<td><cms:column name="email"/></td>
		</tr>
	</cms:userlist>
	</table>
</code>

The first line imports the taglib that we are using, then you can see that I am wrapping a table row with the <strong>cms:userlist</strong> tag.

A designer would then decide which column they want to ouptut by adding these tags. Why would one one to do that you may ask? Why not just CF? What happens if they write the wrong column and you are in a live server? Also they (a designer, or html'er) would have to write the following (perhaps):

<code>
	<td><cfoutput>#username#</cfoutput></td>
</code>

Not as nice as above, especially lets say if you have a WYSIWYG editor in your CMS right?

The solution I come up with was basically, in the first template you have the import for the prefix <strong>cms</strong> and anything inside a loop has a different prefix, that on first pass CF would ignore:

<code>
	<cfimport taglib = "tags" prefix = "cms">
	<table>
	<cms:userlist>
		<tr>
			<td><loop:column name="username"/></td>
			<td><loop:column name="email"/></td>
		</tr>
	</cms:userlist>
	</table>
</code>

Now we have a fragment that on the <strong>ThisTag.ExecutionMode = "end"</strong> we can grab using the <strong>ThisTag.generatedContent</strong>, create a file out of, and then loop over the records and include it. The new file you create from the contents inside the loop you append the right taglib so the new file contains:

<code>
		<cfimport taglib = "tags" prefix = "loop">	
		<tr>
			<td><loop:column name="username"/></td>
			<td><loop:column name="email"/></td>
		</tr>
</code>

inside the <strong>userlist</strong> ThisTag.executionMode = "end" action you would now have:

<code>
	<cfset newFileContent = "<cfimport taglib = ""tags"" prefix = ""loop"">" & ThisTag.generatedContent>
	<cfset ThisTag.GeneratedContent = "">
	<cffile action = "write" file = "myLoopTag.cfm" output = "#newFileContent#">
	<cfsavecontent variable="genContent">
		<cfloop query="getUsers"> <!-- defined earlier in the tag -->
			<cfinclude template="myLoopTag.cfm">
		</cfloop>
	</cfsavecontent>
	<cfgset ThisTag.GeneratedContent = genContent>
</code> 

So the fragment you are calling is actually included, all the output from it is grabbed and then displayed. The column tag would then have some checks like:

<code>
	<cfif ListFindNoCase(getBaseTagList(),"cf_loop") NEQ 0>>
			<!-- some logic to get the content from the parent loop tag, using something like getBaseTagData("cf_loop") -->
	</cfif>
</code>

Therein lies the rub, you would have to (in this loop situation) set a counter each time for what row you are on and pass that to the column tag somehow. Hence my question...