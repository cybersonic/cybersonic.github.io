---
layout: post
title:  "Railo Tip: Getting information about built in Tags and Functions"
date:   2011-03-31 04:27 AM +0000
categories: getrailo
---
<p>
I am not sure people out there know this but Railo has four awesome functions that I use all the time, they are :
	</p>
<ul>
<li>getFunctionList</li>
<li>getTagList</li>
<li>getFunctionData</li>
<li>getTagData</li>
</ul>
<p> </p>
<p>
	<strong>getFunctionList* and getTagList</strong><br />
	These two functions will return a structure with all the functions or tags that are currently installed on the Railo server. For example, getFunctionList will return:<br />
	<img src="//blog/enclosures/getFunctionList.png" alt="" />
<br />
	
And getTagList will return:
<br />
	<img src="//blog/enclosures/getTagList.png" alt="" /></p>
<p>
	<strong>getTagData and getFunctionData</strong><br />
	
	Of course, this information in itself isn't amazing, since how do you know the arguments for each? This is where the getTagData and getFunctionData come in useful. For Example, if you want to get all the properties of say,  the function ImageFilter (I created the <a title="Filter Explorer" href="/filterexplorer/">FilterExplorer</a> using this function), all you have to do is:
	</p>
<p>
	<code>
		
	</code>	
	</p>
<p>
	And you will get a nice struct with all the info:	
	</p>
<p>
		<a href="/blog/enclosures/getFunctionData.png" target="new"><img src="/blog/enclosures/getFunctionData_thumb.png" alt="" /></a>
	</p>
<p>
The function getTagData is slightly different, in that you have to split out the namespace when calling it, so you have to call it as follows:
	</p>
<p>
		<code>
			
		</code>
	</p>
<p>
	Which gets you all the attributes and documentation for the tag:
	
	</p>
<p>
	<a href="/blog/enclosures/getTagData.png" target="new"><img src="/blog/enclosures/getTagData_thumb.png" alt="" /></a>
	</p>
<p> </p>
<p>
	Simply using those tags, I have started a little project using <a title="CloudBees: Cloud Platform as a Service for Java Web Apps, Supported Jenkins/Hudson and Jenkins/Hudson in the Cloud" href="http://www.cloudbees.com/">CloudBees</a>, <a title="ColdBox Platform - Defining Enterprise ColdFusion Development" href="http://www.coldbox.org/">ColdBox</a> and of course <a title="Railo - Accelerate Your Web Development" href="http://www.getrailo.org/">Railo</a>, that I shall show off a bit later. 	
</p>
<p>* getFunctionList is also available in CF9</p>