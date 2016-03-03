---
layout: post
title:  "Railo ORM and Magic Functions"
uid:	"FDC5D481-EB9C-4C93-811A61A4603F2BF4"
date:   2010-08-06 12:09 PM +0000
categories: getrailo
---
<p>Background: I am writing a little app to help us here at Railo with some of our contacts, nothing over the top or anything and wanted to take Sean Corfield's FW/1 for a spin. <br /><br />As I am developing, I went the most direct route, I just did some queries in the service layer so my code looks like:</p>
<pre>&lt;cffunction name="list" output="false"&gt;
	&lt;cfset var clients = 0&gt;
	
	&lt;cfquery name="clients" datasource="#variables.dsn#"&gt;
		SELECT * FROM contact;
	&lt;/cfquery&gt;
	&lt;cfreturn clients&gt;
&lt;/cffunction&gt;


&lt;cffunction name="view" output="false"&gt;
	&lt;cfargument name="clientid"&gt;
	&lt;cfset var qclient = 0&gt;
	&lt;cfquery name="qclient" datasource="#variables.dsn#"&gt;
		SELECT * FROM contact WHERE id = &lt;cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.clientid#"&gt;;
	&lt;/cfquery&gt;
	&lt;cfreturn qclient&gt;
&lt;/cffunction&gt;
</pre>
<p>OK, nothing world shattering, so I wanted to start using the ORM features of Railo (join the pre-release group to test them out!). I changed my code to look like:</p>
<pre>&lt;cffunction name="list" output="false"&gt;
	&lt;cfset var clients = 0&gt;
	
	&lt;cfquery name="clients" dbtype="orm"&gt;
		FROM contact
	&lt;/cfquery&gt;
	&lt;cfreturn clients&gt;
&lt;/cffunction&gt;


&lt;cffunction name="view" output="false"&gt;
	&lt;cfargument name="id"&gt;
	&lt;cfreturn entityLoad("contact",arguments.id,true)&gt;
&lt;/cffunction&gt;
</pre>
<p>I then defined my "contact" (I can show the code but it's hardly rocket science) and then when I reloaded I got the error:</p>
<pre>Component [contact] has no acessible Member with name [ID]
</pre>
<p>
Of course! My view code looks like:</p>
<pre>&lt;input type="hidden" name="id" value="#rc.data.id#"&gt;
</pre>
<p>
<br />I could change all my calls to fields to</p>
<pre>&lt;input type="hidden" name="id" value="#rc.data.getid()#"&gt;
</pre>
<p>
<br />but why bother? I just went to the Railo Admin -&gt; Archives &amp; Resources: Component -&gt; Magic Functions and enabled them, now all my view code works just as expected and I didn't have to change my view code.</p>
<p> </p>
<p> </p>