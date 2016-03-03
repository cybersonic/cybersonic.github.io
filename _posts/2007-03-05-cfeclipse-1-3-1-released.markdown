---
layout: post
title:  "CFEclipse 1.3.1 Released"
uid:	"8A9A60FF-B3C9-5C00-F6D85CF3D504FBD1"
date:   2007-03-05 11:08 AM +0000
categories: coldfusion
---
About three days late, from my milestones, but I finally released CFEclipse 1.3.1, you can get this from the usual update site (instructions available <a href="http://www.cfeclipse.org/index.cfm?event=page&amp;page=download">here</a>). I have put loads of effort into this and there is more to come, so if your bug hasn't been covered in this release, don't worry, I shall get to it soon!

One of the major bits of work has been replacing the FTP library we were using and converting all the functionality to use Apache VFS, which should hopefully stop many errors that we had before.

Also, as part of this "release" I have put previous versions on the update site (all the way back to CFEclipse 1.2.1) for those people suffering from some issues (hey, I hoped that I had fixed them, but you never know!)

When I released 1.3.0, many people bemoaned the fact that there were no release notes, well, now thanks to Trac, and the fact that I have been diligently managing the bugs with it, I can provide you with release notes! Hurrah!

Enjoy!

-----------------------

<strong>CFEclipse 1.3.1 Release Notes</strong>

<em>The CFEclipse Project is proud to present the latest release of the CFEclipse IDE.

A lot of effort has gone into the project over the last few months and more releases will be happening over the next few months.

We hope you find the following enhancements an fixes useful.



Mark Drew<br>
CFEclipse Project</em>


You can view more detail on each of these tickets on the <a href="http://trac.cfeclipse.org/cfeclipse/query?status=closed&amp;milestone=1.3.1&amp;order=type">CFEclipse Trac site</a>


Fatal crash for CFSCRIPT has now been fixed, also installation on Vista should not throw a security error
<ul>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/172">172</a> Typing <cfscript> makes CFEclipse 1.3 Beta to crash - defect</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/190">190</a> Preprocess.bat annoys Vista users - defect</li>
</ul>
	
Completely re-built File Explorer, now supports Local, FTP and SFTP connections. This has been a massive undertaking as we have changed the core libraries to make use of <a href="http://jakarta.apache.org/commons/vfs/">Apache's Virtual File System</a>, which means in the future we can add other file systems.
<ul>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/110">110</a> FTP plugin doesn't handle errors well - defect</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/168">168</a> File Explorer - FTP doesn't work - defect</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/166">166</a> File Explorer has no functionality - enhancement</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/230">230</a> Remote File Sorting in the File Explorer - enhancement</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/236">236</a> Add SFTP support - enhancement</li>
</ul>

The Dictionary view now handles multiple CF Versions and provides more information about tags. It changes the version to suit the currently focused file.
<ul>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/">191</a> Dictionary view doesn't reflect the project's set dictionary - enhancement</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/">238</a> Dictionary View add information about the tag and the attribute - enhancement</li>
</ul>

Interface improvements
<ul>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/122">122</a> Absolute File Locations Inconsistent in Status Bar - defect</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/64">64</a> Add file path to the status line - enhancement</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/206">206</a> Tag insight output for createObject incorrect - defect</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/66">66</a> CFC Methods View - Non Case Sensitive - enhancement</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/201">201</a> Lose "cffunction name:" from cfcomponent in the outline - enhancement</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/235">235</a> Different icons for cftags and cffunctions compared to html - enhancement</li>
</ul>

Changes to shortcuts: the CFSCRIPT shortcut occluded a very useful "Find Resource" feature of Eclipse and the find matching tag occluded the maximize and minimize functions. These changes are as follows:
<ul>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/205">205</a> Change the cfscript shortcut as it occludes the find resource shortcut - defect [Changed to Ctrl + Alt + R]</li>
	<li><a href="http://trac.cfeclipse.org/cfeclipse/ticket/229">229</a> Conflicting CTRL+M Keyboard shortcut - defect [Changed to Ctrl + Shift + N ]</li>
</ul>