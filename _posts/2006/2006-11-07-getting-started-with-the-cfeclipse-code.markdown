---
layout: post
title:  "Getting started with the CFEclipse code"
uid:	"8A98F5DD-0F45-76FB-487FB77FFBABEC78"
date:   2006-11-07 11:06 AM +0000
categories: cfeclipse,reference
permalink: getting-started-with-the-cfeclipse-code
---
I just got an email from Robert Munn, he managed to check out the branch code for CFEclipse (you can have a look at it <a href="http://trac.cfeclipse.org/cfeclipse/browser/branches/1.3-dev">here</a> ) and he asked where does one start? There is a lot of code and a few folders etc... so I thought I would start doing some posts describing how the code is organised and what goes where.
When you first download the source if you have followed the <a href="http://www.cfeclipse.org/go/documentation/developer-docs/checking-out">documentation</a> you should get a bunch of folders and files at the root of your application. 

<table>
	<tr>
		<td valign="top"><strong>dictionary</strong></td>
		<td>This is where all the language dictionaries go. They are XML definition files for each language version such as CF5-> CFMX7 as well as HTML, JavaScript and SQL (more on this on a later post</td>
	</tr>
	<tr>
		<td valign="top"><strong>doc</strong></td>
		<td>Help Documentation</td>
	</tr>
	<tr>
		<td valign="top"><strong>icons</strong></td>
		<td>Image files used for icons and buttons</td>
	</tr>
	<tr>
		<td valign="top"><strong>intro</strong></td>
		<td>(Product Version) When we do a Product Version (standalone) this is the folder where all the help docs will go</td>
	</tr>
	<tr>
		<td valign="top"><strong>lib</strong></td>
		<td>Where any other Java JAR libraries that are required are stored (such as Log4J etc)</td>
	</tr>
	<tr>
		<td valign="top"><strong>readme</strong></td>
		<td>Any readme files to go here. might be an idea for people to put descriptions of changes here!</td>
	</tr>
	<tr>
		<td valign="top"><strong>schema</strong></td>
		<td>Extension schemas so that other plugins can use CFEclipse, underused and will be used more in the future</td>
	</tr>
	
	<tr>
		<td valign="top"><strong>snippets</strong></td>
		<td>Additional snippet code base, we used to have a build for you to install pre-made snippets, and here they are, all pre-made for you</td>
	</tr>
	<tr>
		<td valign="top"><strong>src</strong></td>
		<td>This is where the actual Java code goes! The real stuff.</td>
	</tr>
	
	<tr>
		<td valign="top"><em>.classpath</em></td>
		<td>This file actually contains the paths to extra libraries that are used by CFEclipse</td>
	</tr>
	
	<tr>
		<td valign="top"><em>.project</em></td>
		<td>This is an Eclipse generated file, defines the project by name etc... you would probably overwrite this at any rate if you get errors about external builders</td>
	</tr>
	<tr>
		<td valign="top"><em>build.properties</em></td>
		<td>Used by Eclipse to define what to package up when its building the plugin, dont need to edit directly (see plugin.xml)</td>
	</tr>
	<tr>
		<td valign="top"><em>cfeclipse.product</em></td>
		<td>(Product Version) Central file to define a standalone build of CFEclipse (like the standalone version of FlexBuilder)</td>
	</tr>
	<tr>
		<td valign="top"><em>License.txt</em></td>
		<td>Does what it says on the tin. What did you expect? Shakespeare?</td>
	</tr>
	<tr>
		<td valign="top"><em>plugin.properties</em></td>
		<td>These are the externalisation of text strings from the plugin.xml file so we can be multi-lingual in the future</td>
	</tr>
	<tr>
		<td valign="top"><em>plugin.xml</em></td>
		<td>This is the core file of any plugin, open this in the Plug-in Manifest Editor, and you get a very good breakdown of what it does and how you can add features. This deserves its own post which I shall put up later</td>
	</tr>
	<tr>
		<td valign="top"><em>plugin_customization.ini</em></td>
		<td>(Product Version) This file puts some default settings like which perspective you want the product to start with</td>
	</tr>
	<tr>
		<td valign="top"><em>splash.bmp</em></td>
		<td>(Product Version) The startup splash screen for the product version</td>
	</tr>

</table>

I hope this helps people get a bearing on what the whole plugin is about. I shall post more info later on the plugin.xml file as that is a very important file and the basis of your plugin.