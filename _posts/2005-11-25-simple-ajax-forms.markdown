---
layout: post
title:  "Simple Ajax Forms"
uid:	"8A97A0C4-E8F7-230D-BD0DCE88C4DF8BB5"
date:   2005-11-25 11:05 AM +0000
categories: ajax
---
I stumbled across a great and very simple way to implement AJAX in your applications. The library is available at <a href="http://redredmusic.com/brendon/ajform/">http://redredmusic.com/brendon/ajform/</a> 

It is very simple to implement, download the library, link it and then put an onSubmit handler on your form. 

I have put an example <a href="/ajax/">here</a>

How the form is implement is as follows:

A link to the library and I linked to a file that handles the preSubmit and on Response functions
<div class="code"><FONT COLOR=NAVY><FONT COLOR=MAROON>&lt;script language=<FONT COLOR=BLUE>"javascript"</FONT> src=<FONT COLOR=BLUE>"scripts/ajform.js"</FONT>&gt;</FONT></FONT><FONT COLOR=NAVY><FONT COLOR=MAROON>&lt;/script&gt;</FONT></FONT><br>
<FONT COLOR=NAVY><FONT COLOR=MAROON>&lt;script language=<FONT COLOR=BLUE>"javascript"</FONT> src=<FONT COLOR=BLUE>"scripts/index_handlers.js"</FONT>&gt;</FONT></FONT><FONT COLOR=NAVY><FONT COLOR=MAROON>&lt;/script&gt;</FONT></FONT></div>

Then in the form I add a onSubmit handler and define what function handles the pre-submission and the return of the data:
<div class="code"><FONT COLOR=NAVY><FONT COLOR=FF8000>&lt;form action=<FONT COLOR=BLUE>"search.cfm"</FONT> method=<FONT COLOR=BLUE>"post"</FONT> onsubmit=<FONT COLOR=BLUE>"javascript:preForm(this);ajform:getSearchData();"</FONT>&gt;</FONT></FONT></div>

The script uses the action in the form as the submit recipient. In this case a search script, and whatever is returned from that is handled by the getSearchData() function.

The search script does a quiery and then loops through the results outputting the html that makes up the images.

<div class="code"><FONT COLOR=MAROON>&lt;cfquery name=<FONT COLOR=BLUE>"getArt"</FONT> datasource=<FONT COLOR=BLUE>"#appllication.dsn#"</FONT>&gt;</FONT><br>
SELECT ajax_art.*, ajax_artists.FIRSTNAME, ajax_artists.LASTNAME<br>
FROM ajax_art LEFT JOIN ajax_artists ON ajax_art.ARTISTID = ajax_artists.ARTISTID<br>
<FONT COLOR=MAROON>&lt;/cfquery&gt;</FONT><br>
<br>
<FONT COLOR=MAROON>&lt;cfoutput query=<FONT COLOR=BLUE>"getArt"</FONT>&gt;</FONT><br>
<FONT COLOR=NAVY>&lt;div class=<FONT COLOR=BLUE>"artIamge"</FONT>  id=<FONT COLOR=BLUE>"art_#ARTID#"</FONT>&gt;</FONT><br>
<FONT COLOR=NAVY><FONT COLOR=PURPLE>&lt;img src=<FONT COLOR=BLUE>"images/thumbs/#getArt.LARGEIMAGE#"</FONT> width=<FONT COLOR=BLUE>"50"</FONT>&gt;</FONT></FONT><br>
<FONT COLOR=NAVY>&lt;/div&gt;</FONT><br>
<FONT COLOR=MAROON>&lt;/cfoutput&gt;</FONT></div>

In this case, the getSearchData() function simply checks the response from the search function and writes out what is returned to a div. 
<div class="code">function getSearchData(data , statusCode , statusMessage)\{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if( statusCode != AJForm.STATUS['SUCCESS'] ) \{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;alert( statusMessage );<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT COLOR=GRAY><I>&nbsp;&nbsp;&nbsp;//AJFORM succeeded.</I></FONT>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;else \{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT COLOR=GRAY><I> //we write the output to the div</I></FONT>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; document.getElementById('contentdiv').innerHTML = data;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;}<br>
<br>
&nbsp;&nbsp;&nbsp;}</div>

Very simple and straigh tforward... I like these kind of solutions!