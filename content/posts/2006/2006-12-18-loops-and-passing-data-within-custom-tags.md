---
layout: post
title:  "Loops and passing data within custom tags"
uid:	"8A995C17-D3BB-4B72-F65A953E7BA771F4"

categories: coldfusion
permalink: loops-and-passing-data-within-custom-tags
---
I have been doing some little mental exercises for a project that I might do in a few months, but something has me a little stumped. From the outset I should say that I haven't done custom tags for a while (and when I was doing them it was using Spectra custom tags) so I am a bit rusty in this.

Lets say you have the following situation, you have two custom tags that you are using <cfimport> to bring in, something like this:
	
<code>
<cfimport prefix="cms" taglib="tags">
<cms:text value="bob">
<cms:loop from="1" to="10">
	<cms:text value="bob">
</cms:loop>
</code>

The idea here is that for the &lt;cms:text&gt; if it isnt in a loop it displays bob. If it IS in a loop, it can find out which iteration its in, and print "I am x bob". Of course, that is the idea but this doesnt work, CF has already rendered the output and if you check what is in ThisTag.generatedContent its already too late, its flat content.
	
The only way that I can really do this I have found is to change it, so that any tag inside the cms:loop has a different namespace, so in the first iteration it is ignored, eg:
<code>
	<cms:loop from="1" to="10">
		<loop:text value="bob">
	</cms:loop>
</code>

Now, in the first iteration, it creates a fragment of code, including the same tags with a different namespace and saving the generated content as a file and then including it:

<code>
	<cfimport prefix="loop" taglib="tags">
		<loop:text value="bob">
</code>

This new fragment can now be parsed and you can get information about the loop state using getBaseTagData("cf_loop"). I must say this isn't the best way to do things! Anyone got any other suggestions?