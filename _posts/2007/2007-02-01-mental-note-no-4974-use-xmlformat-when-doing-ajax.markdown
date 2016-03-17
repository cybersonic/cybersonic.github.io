---
layout: post
title:  "Mental Note No. 4974: Use XMLFormat() when doing Ajax"
uid:	"8A99AC39-E895-EFA0-6491EE8DE3192BAD"
date:   2007-02-01 11:07 AM +0000
categories: personal,coldfusion
permalink: mental-note-no-4974-use-xmlformat-when-doing-ajax
---
There is an application I built using some Spry related drop downs. It has been working for months (since the summer really) fine and all of the sudden the drop down boxes disappeared. Without going too much into what it does, its basically a page list and it stopped working.

After a lot of checking config and what have you, it basically come down to Internet Explorer chocking on the page names, even though they were in a CDATA block it still didn't like them. 

To cut a long story (of debugging, using a lot of profanity and most of the characters above the numbers on a keyboard) short, if you are not in control of what is going to be in your XML, add XMLFormat() to your output

<code>
<pagelist>
    ... loop...
        <page>
          <id>#id#</id>
          <pagename><![CDATA[#XMLFormat(pagename)#]]></pagename>
        </page>


</pagelist>

</code>