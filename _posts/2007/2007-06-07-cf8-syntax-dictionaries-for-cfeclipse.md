---
layout: post
title:  "CF8 Syntax Dictionaries for CFEclipse"
uid:	"8A9A7DDD-9BF2-5B98-B0EC27C7E341E5A6"

categories: cfeclipse,coldfusion
permalink: cf8-syntax-dictionaries-for-cfeclipse
---
I have seen a lot of posts on various lists about this, and rather than making everyone hold out for the next release of CFEclipse (I am a bit behind due to having a flu since I got back from Scotch on the Rocks) I thought I would post up the dictionary file for ColdFusion 8 beta so you can install it yourselves.

Now, pay attention, I am going to detail the process here and wont be providing support for INSTALLING it. If you notice if any tags are wrong, send me the tag node from the XML and let me know the change and I can keep the master copy updated.

Here goes:

<ol>
	<li>Download and unzip the following file: <a href="http://www.cfeclipse.org/download/cf8dictionary.zip">cf8dictionary.zip</a>, you should have a file called cf8.xml</li>
	<li>Browse to &lt; eclipse install path &gt;/plugins/org.cfeclipse.cfml_&lt;version number&gt;/dictionary/ and move cf8.xml into that directory  </li>
	<li>open up the dictionaryconfig.xml file that is in that directory and add the following XML above the cfmx701 entry
		
		<code>
			
			<version key="cf8" label="Coldfusion 8">
						<grammar location="cf8.xml" />
						<grammar location="user.xml" />
					</version>	
			
		</code>
		</li>
	
	<li>Restart (or start) Eclipse.</li>
</ol>

You should now, if you look under CFEclipse in a projects preferences, have ColdFusion 8 added as a language.

Enjoy!