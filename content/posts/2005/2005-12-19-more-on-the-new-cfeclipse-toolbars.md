---
layout: post
title:  "More on the new CFEclipse Toolbars"
uid:	"8A97A74B-0315-5CD3-5432FEC60458D382"

categories: cfeclipse
permalink: more-on-the-new-cfeclipse-toolbars
---
<p>I have been working on the new editor toolbar for CFEclipse over the last few 
  days, so I thought I would post up some images so you can see how things are 
  going. It is a difficult task as its a matter of sourcing a ton of icons for 
  strange concepts such as &quot;throw&quot; and &quot;catch&quot; etc.</p>
<p>So without further ado... here are some of the toolbars (these toolbars can 
  be switched off and on from the CFEclipse/Editor Preference panel by the way, 
  so if you dont like them, you can just go right ahead and switch them off)</p>
<p><strong>CFML Basic</strong><br>
  This toolbar is pretty much complete (unlike a lot of the others) </p>
<p><a href="/images/cfmlbasic.png" target="_blank"><img src="/images/cfmlbasic.png" width="300" border="0"></a></p>
<p><strong>CF Flow<br>
  </strong>I have put as many of the icons for this toolbar as I can, the strange 
  concepts for icons is the cfswitch, case, defaultcase as well as the cfif, else 
  and elseif. If someone has some good ideas, send them over if not they might 
  just stay as words<strong><br>
  <a href="/images/cfflow.png" target="_blank"><img src="/images/cfflow.png" width="300" border="0"></a> 
  </strong></p>
<p><strong>CFForm</strong><br>
  I have to admit I havent put the icons here yet, but I am sure this wont be 
  too difficult in themselves as there are icons out there for each of these items 
  (especially since they are visual items rather than concepts)<br>
  <a href="/images/cfform.png" target="_blank"><img src="/images/cfform.png" width="300" border="0"></a><br>
  <strong>CFC<br>
  </strong>The CFC toolbar is finished and I hope the icons there make sense to 
  people<br>
  <a href="/images/cfc.png" target="_blank"><img src="/images/cfc.png" width="300" border="0"></a> 
  <br>
  <strong>CFDocument<br>
  </strong>The CFDocument toolbar hasnt been touched yet, but I have a bunch of 
  icons ready for this toolbar<a href="/images/cfdocument.png" target="_parent"><img src="/images/cfdocument.png" width="300" border="0"></a></p>
<p><strong>CFML Advanced<br>
  </strong>Another untouched toolbar, I think I can get icons for most of these, 
  but differences between cfpop and things like cfapplication might be a bit strange 
  so I am still looking for good icons for these tags.<a href="/images/cfmladvanced.png" target="_blank"><img src="/images/cfmladvanced.png" width="300" border="0"></a></p>
<p><strong>CFChart</strong><br>
  This toolbar, again by its visual nature shouldnt be too hard but all suggestions 
  welcome!<br>
  <a href="/images/cfchart.png" target="_blank"><img src="/images/cfchart.png" width="300" border="0"></a> 
</p>
<p>&nbsp;</p>
<p>The method I used to display these items is by using an XML layout file, in 
  which you can add tabs, as well as items to the toolbar (so if you want more 
  items, let me know!). Although this makes it easier to configure, the icons 
  need to be added to the CFPluginImages class so that they can be referenced 
  from other parts of the IDE if required (such as the Outline view for example).</p>
<p>I tried to keep the XML file simple yet with the ability to extend it to do 
  other functions rather than just insert tags, to do this, I have (and this is 
  still changing) set up two types of buttons, a cftag type and a custom type.</p>
<p>The cftag type of button just needs a value which refers to the tag that it 
  will insert, the custom type button refers to the class that is called. This 
  class is dynamically loaded and at the moment is geared to running actions that 
  have already been set. </p>
<p>Here is a cut down example:</p>
<div class="code">&lt;?xml version=<FONT COLOR=BLUE>"1.0"</FONT> encoding=<FONT COLOR=BLUE>"UTF-8"</FONT>?&gt;<br>
<FONT COLOR=TEAL>&lt;tabs&gt;</FONT><br>
&nbsp;&nbsp;&nbsp;<FONT COLOR=TEAL>&lt;tab name=<FONT COLOR=BLUE>"CFML Basic"</FONT>&gt;</FONT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT COLOR=NAVY><FONT COLOR=FF8000>&lt;button name=<FONT COLOR=BLUE>"CFParam"</FONT> type=<FONT COLOR=BLUE>"cftag"</FONT> value=<FONT COLOR=BLUE>"cfparam"</FONT>  image=<FONT COLOR=BLUE>"param.gif"</FONT> /&gt;</FONT></FONT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT COLOR=NAVY><FONT COLOR=FF8000>&lt;button name=<FONT COLOR=BLUE>"CFDump"</FONT> type=<FONT COLOR=BLUE>"cftag"</FONT> value=<FONT COLOR=BLUE>"cfdump"</FONT> image=<FONT COLOR=BLUE>"dump.gif"</FONT> /&gt;</FONT></FONT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT COLOR=NAVY><FONT COLOR=FF8000>&lt;button name=<FONT COLOR=BLUE>"CFComment"</FONT> type=<FONT COLOR=BLUE>"custom"</FONT> value=<FONT COLOR=BLUE>"com.rohanclan.cfml.editors.actions.CFCommentAction"</FONT> image=<FONT COLOR=BLUE>"comment.gif"</FONT>/&gt;</FONT></FONT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT COLOR=NAVY><FONT COLOR=FF8000>&lt;button name=<FONT COLOR=BLUE>"Surround with Hash/Pound signs"</FONT> type=<FONT COLOR=BLUE>"custom"</FONT> value=<FONT COLOR=BLUE>"com.rohanclan.cfml.editors.actions.CFVariableAction"</FONT> image=<FONT COLOR=BLUE>"hash.gif"</FONT> /&gt;</FONT></FONT><br>
&nbsp;&nbsp;&nbsp;<FONT COLOR=TEAL>&lt;/tab&gt;</FONT><br>
<FONT COLOR=TEAL>&lt;/tabs&gt;</FONT></div>
You can see that the CFDump button has a value of "cfdump" so that is the tag that it will call. The CFComment item has a custom type and it 
calls com.rohanclan.cfml.editors.actions.CFCommentAction, which is the internal action to surround something with a comment.

Going forward with this I might add a cffunction type, and maybe a htmltag type so that we can have some basic html tags being added.