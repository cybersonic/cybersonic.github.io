---
layout: post
title:  "Fun with mappings and resources: Part 3 DB Resources"
date:   2009-04-14 08:39 AM +0000
categories: getrailo
---
<p>In my last post I wrote about using RAM as a nice resource to render things from. For this post I shall go through doing a quick demo of the database resource.
</p>
<p>
That's right. You can use a database exacly like you would a file system. 
</p>
<p>
Before we get started, with the latest version of Railo you need to first add the following line into your &lt;web-root&gt;/WEB-INF/railo/railo-web.xml.cfm
</p>
<p> </p>
<blockquote>
	&lt;resources&gt;
		...
	<br />	
&lt;resource-provider arguments="case-sensitive:true;lock-timeout:1001;prefix:test_;" class="railo.commons.io.res.type.datasource.DatasourceResourceProvider" scheme="db"/&gt;
<br />
&lt;/resources&gt;
</blockquote>
<p>
It might be there already but commented out. This essentially adds another resource that you can use to create mappings.
</p>
<p>
Next, just create a database in mysql, nothing fancy, you just need to then create a datasource in either your web or server admin. I called mine "resourcedb" (imaginative eh?)
</p>
<p>
Now that we have the database, we need to create a mapping to this database. To address this newly created datasource as a mapping we add the following under the <strong>Archives &amp; Resources - Mappings</strong> section.
</p>
<p>
Virtual: /dbresource <br />
Resource: db://resourcedb</p>
<p>Now you are set! Here is my code now:</p>
<pre>&lt;cfif NOT DirectoryExists("/dbresource/elvis/")&gt;<br />	&lt;cfdirectory action="create" directory="/dbresource/elvis"/&gt;	<br />&lt;/cfif&gt;<br />&lt;cffile action="write" file="/dbresource/elvis/dump.cfm" output="&lt;cfdump eval=server&gt;"&gt;<br />&lt;cfdirectory action="list" directory="/dbresource" name="dbfiles" recurse="true"/&gt;<br />&lt;cfdump eval=dbfiles /&gt;</pre>
<p>And you should now get a nice list of the files in your db resource. This is useful if you want to share these files across distributed servers without exposing the file system itself.</p>
<p> </p>