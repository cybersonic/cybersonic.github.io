---
layout: post
title:  "CFEclipse tips and tricks"
uid:	"8A978434-DC71-A29A-7B773A6D613F9FC6"

categories: cfeclipse
permalink: cfeclipse-tips-and-tricks
---
<div style="CLEAR: both"></div>
I have been using cfeclipse now for a couple of months, in case you dont know what CFEclipse is you should check out <a href="http://cfeclipse.tigris.org/">http://cfeclipse.tigris.org/</a>, it is basically a plugin to <a href="http://www.eclipse.org">Eclipse</a> (java editor extraordinaire) that allows you and helps you in most wonderful ways to do your ColdFusion coding! I have switched to it and sometimes even try to contribute to its development a little and now find it really hard to go back to Homesite, CFStudio or Dreamweaver (Textpad will always be there like my lucky pair of underpants tho!). I thought I would add some hints and tips on how to get using it even more efficiently <strong>Snippets</strong> WE all have snippets in different environments, these are bits of code we re-use, such as creating a 2 column table or the header of an html file for example. CFEclipse has snippets on steroids. They are the real killer addition to this IDE. I shall use an example that I use every day to show how powerful they are, that is of adding fusedocs to my documents. Switch on the Snip Tree View (Window-&gt; Show View -&gt; Snip Tree View) and add a new snippet by clicking on the blue cross. You will be prompted with a dialog, enter the following:
<ul>
    <li><strong>Snippet Name:</strong> fusedoc </li>
    <li><strong>Trigger text:</strong> fusedoc </li>
    <li><strong>Snippet Description:</strong> This snippet inserts a skeleton fusedoc </li>
    <li><strong>Snippet Starting Block: </strong>
    <div class="code"><font color="#000080">&lt;fusedoc fuse=&quot;_____&quot;&gt;<br />&nbsp;&lt;responsibilities&gt;&lt;/responsibilities&gt;<br />&nbsp;&lt;properties&gt;<br />&nbsp;&nbsp;&lt;history type=&quot;____&quot; date=&quot;____&quot; author=&quot;_____&quot;&gt;<br />&nbsp;&lt;/properties&gt;<br />&lt;/fusedoc&gt;</font></div>
    </li>
    <li><strong>Snippet Closing lock:</strong> (leave this blank) </li>
</ul>
<p>Now click OK. you have made your first snippet! well done!</p>
<p>To insert this snippet into your code you can either double click it from the snip tree view or could (my favourite!) type <span style="FONT-FAMILY: courier new">fusedoc</span> folowed by the CTRL+i command </p>
<p>Thats good, but all is not over yet! this is all fine and dandy but in the fuse=&quot;&quot; I usually insert the filename, which is a drag to type it all the time by going back to the code that I inserted, so what you can do is to edit the snippet by right clicking on it and editing it so it says the following:</p>
<p>&nbsp;</p>
<div class="code"><span style="FONT-FAMILY: courier new">&lt;fusedoc fuse=&quot;<strong>$$\{fuse}</strong>&quot;&gt; &lt;responsibilities&gt;&lt;/responsibilities&gt; &lt;properties&gt; &lt;history type=&quot;____&quot; date=&quot;____&quot; author=&quot;_____&quot;&gt; &lt;/properties&gt; &lt;/fusedoc&gt;</span> </div>
<p>&nbsp;</p>
Now save it and try adding the snippet again, you should get a dialog where you can enter your fuse name! Great isnt it? but wait! there is more! Change the <strong>$$\{fuse}</strong> to <strong>$\{fuse:myfuse}</strong> and you should have &quot;myfuse&quot; already entered in the dialog box as default, fantastic! I could do that for my name... or... I could enter a dynamic variable. Try adding the following: <strong>$$\{fuse:$$\{CURRENTFILE}},</strong> this will make the dialog box default to the current filename! In the same manner you can add other variables as shown below:
<div class="code"><span style="FONT-FAMILY: courier new">&lt;fusedoc fuse=&quot;$$\{file:$$\{CURRENTFILE}}&quot;&gt;<br />&nbsp;&lt;responsibilities&gt;$$\{responsibilities}&lt;/responsibilities&gt;<br />&nbsp;&lt;properties&gt;<br />&nbsp;&nbsp;&lt;history type=&quot;$$\{action:create}&quot; date=&quot;$$\{date:$$\{DAYOFMONTH} $$\{MONTHNUMBER} $$\{YEAR}}&quot; author=&quot;$$\{author:$$\{USERNAME}}&quot; /&gt;<br />&nbsp;&lt;/properties&gt;<br />&lt;/fusedoc&gt;</span></div>
<div class="code"></div>
<p>The other variables that you can use are: </p>
<p><span style="FONT-FAMILY: courier new">$$\{DATE}<br />$$\{MONTH}</span> <br /><span style="FONT-FAMILY: courier new">$$\{TIME}<br />$$\{DATETIME}</span> <br /><span style="FONT-FAMILY: courier new">$$\{DAYOFWEEK}</span> <br /><span style="FONT-FAMILY: courier new">$$\{CURRENTFILE} - Current file name (just the file)</span> <br /><span style="FONT-FAMILY: courier new">$$\{CURRENTFOLDER} - Current folder (The path to the containing folder)</span> <br /><span style="FONT-FAMILY: courier new">$$\{CURRENTPATH} - Current path (full file name)</span> <br /><span style="FONT-FAMILY: courier new">$$\{CURRENTPRJPATH} - Just the folder</span> <br /><span style="FONT-FAMILY: courier new">$$\{USERNAME} - Current user</span> <br /><span style="FONT-FAMILY: courier new">$$\{MONTHNUMBER} - Month as a number</span> <br /><span style="FONT-FAMILY: courier new">$$\{DAYOFMONTH} - Day of month as a number</span> <br /><span style="FONT-FAMILY: courier new">$$\{DAYOFWEEKNUMBER} - Day of week (the week starts on Sunday)</span> <br /><span style="FONT-FAMILY: courier new">$$\{DATETIME24} - DateTime24 - a 24 hour clock version of datetime.</span> <br /><span style="FONT-FAMILY: courier new">$$\{YEAR} - Current year.</span> <br /><span style="FONT-FAMILY: courier new">$$\{YEAR2DIGIT} - Current two digit year.</span> </p>
<p>I have found myself using a lot more snippets and if you change the Key combination to Ctrl+ space it is consistent with the rest of the code highlight and completion in the IDE (to do this go to Window-&gt; Prefrences -&gt; Workbench -&gt; Keys and select Command Category:CFML Editor, Name:Insert Snippet, then under Key Sequence Name: click Ctrl+space and click add) If you are using CFEclipse, let me <a href="mailto:mark.drew@gmail.com">know</a> and send me any other tips that you would like to share! </p>
<p>&nbsp;</p>
<div style="CLEAR: both; PADDING-BOTTOM: 0.25em"></div>