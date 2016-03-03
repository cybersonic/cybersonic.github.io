---
layout: post
title:  " Quick Tip on Railo Email Send Queues"
uid:	"13163767-0D48-447A-AFBA9097188B4F53"
date:   2010-07-22 09:54 AM +0000
categories: getrailo
---
<p> </p>
<p>When you send an email from the &lt;cfmail&gt; tag in Railo, there are times that for whatever reason the email won't be sent. Rather than digging through a bunch of folders to see what hasn't been sent, you can do a couple of things.</p>
<p>You can view all the task spool in the Railo Web Administrator -&gt; Services -&gt; Tasks page by going to http://&lt;your server&gt;/railo-context/admin/web.cfm?action=services.tasks</p>
<p>Or you can programatically get the task spool by doing the following code:</p>
<p>&lt;cfadmin action="getSpoolerTasks" type="web" password="#password#" returnVariable="tasks"&gt;</p>
<p>&lt;cfdump var="#tasks#"&gt;</p>
<p>You get a query by return that has the type, the item, how many times it has tried and an array of exceptions that have happened, this way you can manually or programatically deal with the errors.</p>
<div><br /></div>
<p> </p>