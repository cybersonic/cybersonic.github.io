---
layout: post
title:  "CFLOOP Rant."
uid:	"FC4D23B7-6939-42B0-BD0CF9C202EB3DF3"
date:   2011-08-04 07:19 AM +0000
categories: coldfusion
---
<strong>&lt;rant&gt;</strong>
<p>
I have to get this off my chest: the tag cfloop *REALLY* annoys me. 
</p>

<p>
	Not in all it's manifestations mind you, just in one of them, and that is... cfloop array. Why you might ask?<br>
	Well, if you want to loop an array you can do:
</p>
<code>
	<cfloop array="#MyArray#" index="a">
		<cfdump var="#a#">
	</cfloop>
</code>

<p>What "a" is in the index, is the actual item in the array. I think this is totally wrong to the point that if I had hair I would pull it out. <br>
	When the array attribute was introduced, I really think the developers had a brain fart.<br>
	 They could have so easily used another attribute,  maybe one that is already there. The attribute of "item" for example! I mean, it was there loitering in the tag lib, being used for collections, such as:
</p>


<code>
	<cfloop array="#MyArray#" item="a">
		<cfdump var="#a#">
	</cfloop>
</code>

<p>
	Now THAT makes sense! But why all the whining you might ask? Well, let's consider if you want to actually get the index of the array, what do you have to do? Oh yeah... set up another damn variable:
</p>

<code>
	<cfset counter = 1>
	<cfloop array="#MyArray#" index="a">
		<cfdump var="#a#">
		<cfset counter++>
	</cfloop>
</code>

<p>Wouldn't it have made a LOT more sense to do the following?:</p>

<code>
	<cfloop array="#MyArray#" item="a" index="counter">
		<cfdump var="#a#"> The actual item 
		<cfdump var="#counter#"> The index of the item
	</cfloop>
</code>

<p>
	See? now "a" can be the *ITEM* in the array and "counter" can be the *index* of the array. <br>

	<br>

</p>
<strong>&lt;/rant&gt;</strong>

<p>Side rant: Why name it "collection" when we could have named it "struct"?
<code>
	<cfloop struct="#myStruct#" item="st">
		
	</cfloop>
</code>
	
</p>