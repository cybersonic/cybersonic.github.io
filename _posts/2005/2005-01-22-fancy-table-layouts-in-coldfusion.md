---
layout: post
title:  "Fancy Table Layouts in Coldfusion"
uid:	"8A978FCC-AA67-9082-F2143B869A6C238E"
date:   2005-01-22 11:05 AM +0000
categories: coldfusion
permalink: fancy-table-layouts-in-coldfusion
---
Am interesting question come up in the cf-talk mailing list:
<i>I have a query with x number of records. I want to dynamically create a table on my display that displays five records per row, ie (qf = queryfield):

qf | spacer | qf | spacer | qf | spacer | qf | spacer | qf
qf | spacer | qf | spacer | qf | spacer | qf | spacer | qf
 
and so on...

Also need to know how to fill in empty cells on the last row if my recordcount isn't divisible by 5. Can anyone point me to an article/tutorial/code snippet which could show me how to do this efficiently?
</i>

My response is below, I am using a list just for demonstration but you can change it yourself to loop through a query with the basics in place.
<div class="code">
<span class="codecomment">//We set a list of words we are going to loop over</span>

<span class="codecftag">&lt;cfset </span>lWords = <span class="codecfvar">"eine, meine, miney, mo, catch, developers, by, their, toe"</span><span class="codecftag">&gt;</span>

<span class="codecftag">&lt;cfset </span>nLength = <span class="codecfvar">ListLen(</span>lWords<span class="codecfvar">)</span><span class="codecftag">&gt;</span>
<span class="codecomment">//The number of columns we want (this is a word and spacer)</span>
<span class="codecftag">&lt;cfset </span>columns = <span class="codecfint">5</span><span class="codecftag">&gt;</span>
<span class="codecomment">
//Now, we check how many rows there would be , I do a ceiling function
so that I get the upper integer e.g.</span>
<span class="codecomment">//if we have 9 items, and we have 4 columns, we shall have 3 rows, the last row having one item and 3 blanks</span>
<span class="codecftag">&lt;cfset</span> rows = <span class="codecfvar">Evaluate(ceiling(</span>nLength<wbr>
<p>/columns<span class="codecfvar">))</span><span class="codecftag">&gt;</span>
<span class="codecomment">//the ideal number of records that we shall have in TOTAL (including empty ones) in the table</span>
<span class="codecftag">&lt;cfset </span>idealrecords = <span class="codecfvar">Evaluate(</span>rows * columns<span class="codecfvar">)</span><span class="codecftag">&gt;</span>
<span class="codecftag">&lt;cfoutput&gt;</span>
Number of items = #nLength#&lt;br /&gt;
Number of columns = #columns# &lt;br /&gt;
Number of Rows = #rows#&lt;br /&gt;
Ideal Number of Columns = #idealcols#&lt;br /&gt;
<span class="codehtmltag">&lt;table</span> <span class="codehtmlattr">border="</span>1<span class="codehtmlattr">" width="</span>80%<span class="codehtmlattr">"</span><span class="codehtmltag">&gt;</span>
 <span class="codehtmltag">&lt;tr&gt;</span>

  <span class="codecomment">//Loop from 1 to the ideal total number of items (never mind rows)</span>

  <span class="codecftag">&lt;cfloop</span> <span class="codecftag">from="</span>1<span class="codecftag">" to="</span>#idealcols#<span class="codecftag">" index="</span>i<span class="codecftag">"&gt;</span>

  <span class="codecomment">//We set if this column needs a row</span>

       <span class="codecftag">&lt;cfset</span> colCounter = i <span class="codecfvar">MOD</span> columns<span class="codecftag">&gt;</span>

      <span class="codecomment"> //make sure that we dont need an empty space</span>

       <span class="codecftag">&lt;cfif</span> i <span class="codecfvar">LTE ListLen(</span>lWords<span class="codecfvar">)</span><span class="codecftag">&gt;</span>

               <span class="codehtmltag">&lt;td&gt;</span>#<span class="codecfvar">ListGetAt(</span>lWords, i<span class="codecfvar">)</span>#<span class="codehtmltag">&lt;/td&gt;</span>

       <span class="codecftag">&lt;cfelse&gt;</span>

               <span class="codehtmltag">&lt;td&gt;</span> <span class="codehtmltag">&lt;/td&gt;</span>

       <span class="codecftag">&lt;/cfif&gt;</span>

       <span class="codecomment">//Insert a row if required</span>

       <span class="codecftag">&lt;cfif</span> colCounter <span class="codecfvar">EQ</span> <span class="codecfint">0</span><span class="codecftag">&gt;</span>

         <span class="codecomment">//Unless we are at the end of the list (we already have a TR</span>

             <span class="codecftag">&lt;cfif</span> i LT idealcols<span class="codecftag">&gt;</span>

                 <span class="codehtmltag">&lt;/tr&gt;
                 &lt;tr&gt;</span>
              <span class="codecftag">&lt;/cfif&gt;</span>
         <span class="codecftag">&lt;cfelse&gt;</span>
         <span class="codehtmltag">&lt;td&gt;</span> <span class="codehtmltag">&lt;/td&gt;</span>
         <span class="codecftag">&lt;/cfif&gt;</span>
  <span class="codecftag">&lt;/cfloop&gt;</span>
  <span class="codehtmltag">&lt;/tr&gt;
&lt;/table&gt;</span>
  <span class="codecftag">&lt;/cfoutput&gt;</span>
</p>
</div>
What this gives you is:

eine | spacer | meine  | spacer | miney  | spacer | mo  | spacer | catch
developers  | spacer | by | spacer |their  | spacer | toe  | spacer | blank cell

<p>you can change the <span class="codecftag">&lt;cfset </span>columns = <span class="codecfint">5</span><span class="codecftag">&gt; </span> to change the number of columns and the code should still work</p>
<p>Let me know if this helpful to you! </p>