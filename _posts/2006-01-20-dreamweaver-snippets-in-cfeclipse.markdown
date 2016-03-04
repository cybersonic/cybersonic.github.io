---
layout: post
title:  "Dreamweaver Snippets in CFEclipse"
uid:	"8A97AAB6-CAE1-D617-FF861274074AAA08"
date:   2006-01-20 11:05 AM +0000
categories: cfeclipse
permalink: dreamweaver-snippets-in-cfeclipse
---
A question was asked today in the cf-talk list that I had to find a solution to and thought I would share it with you all:
<blockquote>
I noticed that there's been some mention that you can import your snippets from dreamweaver into eclipse. But I have not been able to find any instructions or examples on how to do such.

Does anyone know of any step by step instructions to do the snippets import?
</blockquote>

This is indeed possible for Dreamweaver snippets: 
<ol>
<li>copy your snippets from dreamweaver
<div class="code"><FONT COLOR=NAVY>&lt;dreamweaver<br>
root&gt;</FONT>\Configuration\Snippets</div>
<li>go to your workspace (the one you open with eclipse) mine is:
<div class="code"><A TARGET="_blank" HREF="D:\Applications">D:\Applications</A>\eclipse_3.1.1\workspace\.metadata\.plugins\com.rohanclan.cfml\snippets</div>
and copy your snippets there.
<li> dreamweaver snippets are stored as .csn files, rename them as .xml files
<li>refresh your snippets view in cfeclipse.
</ol>
 

Hope that helps you lot out :)

UPDATE: you dont actually have to rename them, you can keep the .csn names.