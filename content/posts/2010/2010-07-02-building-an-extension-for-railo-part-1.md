---
layout: post
title:  "Building an Extension for Railo: Part 1"
uid:	"CC591F3D-9197-48DE-BC8F77B42174F8CA"

categories: extensions,railo,getrailo
permalink: building-an-extension-for-railo-part-1
---
<p>My role at Railo Technologies has so far been much more of a consultant so far. We consult and develop a number of projects on ACF and Railo and as I am a happy CFML user this has worked out great so far.<br /><br />One of the things that I wanted to get much more into was the engine itself, and adding features to it. One feature that I am currently working on is creating a <a title="Apache CouchDB: The CouchDB Project" href="http://couchdb.apache.org/">CouchDB</a> Cache Extension.<br /><br />Why CouchDB? Will firstly because it has a really simple API, secondly because you can make it replicate as needed and this makes for a great document based object store.</p>
<p>What I have been doing is:</p>
<p>Building an Extension</p>
<p>Building a development Extension Provider</p>
<p>Automating the updating of the Extension</p>
<p>Running Railo with a Java Debugger</p>
<p>Running tests on the extension</p>
<p><strong>Building the Extension and a Development Extension Provider</strong></p>
<p>Rather than going into all the backgound information about building your extension provider, there is a great tutorial over at the Railo Wiki, check that out before you go on, so that we are on the same page:</p>
<p><a href="http://wiki.getrailo.org/wiki/Tutorial:Extension_Provider">Building an Extension Provider Tutorial</a></p>
<p>Done? Good, now I can show you what I have been doing differently.</p>
<p>Each extension is a zip file with a config.xml that describes the steps involved in installing it to the Railo Administrator. But in my ExtensionProvider.cfc there is a method that gets information about the extension, and usually this is hard coded. I thought, why not include that in my extension? So I added an info node to the config.xml of the extension itself:</p>
<pre>&lt;config&gt;
 &lt;info&gt;
 &lt;id&gt;10EEC23A-0779-4068-9507A9C5ED4A8646&lt;/id&gt;
 &lt;version&gt;1.201007021028&lt;/version&gt;
 &lt;name&gt;couch&lt;/name&gt;
 &lt;type&gt;server&lt;/type&gt;
 &lt;label&gt;CouchDB Cache&lt;/label&gt;
 &lt;description&gt;CouchDB Cache extension&lt;/description&gt;
 &lt;created&gt;2010-July-2 10:28&lt;/created&gt; 
 &lt;category&gt;Core Extension&lt;/category&gt; 
 &lt;/info&gt;
 &lt;step&gt;&lt;/step&gt;
&lt;/config&gt;
</pre>
<p>Now in my extension provider, I can just dynamically read this data to provide information to the Railo Administrator:</p>
<pre>&lt;cffunction name="populateCOM" access="private" returntype="void"&gt;
 &lt;cfargument name="apps" type="query" required="yes"&gt;
 &lt;cfset var exp="this extension is experimental and will no longer work with the final release of railo 3.1, it is not allowed to use this extension in a productve enviroment."&gt;
 
 &lt;cfset var rootURL=getInfo().url &amp; "/extensions/"&gt;
 &lt;cfset var zipFileLocation = 'ext/CouchDBCache.zip'&gt;
 
 &lt;cffile action="read" file="zip://#expandPath(zipFileLocation)#!/config.xml" variable="config"&gt;
 &lt;cfset info = XMLParse(config)&gt;

 &lt;cfset QueryAddRow(apps)&gt;
 &lt;cfset QuerySetCell(apps,'download',rootURL &amp; zipFileLocation)&gt;
 &lt;cfset QuerySetCell(apps,'id', info.config.info.id.XMLtext)&gt;
 &lt;cfset QuerySetCell(apps,'name',info.config.info.name.XMLtext)&gt;
 &lt;cfset QuerySetCell(apps,'type',info.config.info.type.XMLtext)&gt;
 &lt;cfset QuerySetCell(apps,'label',info.config.info.label.XMLtext)&gt;
 &lt;cfset QuerySetCell(apps,'description',info.config.info.description.XMLtext)&gt;
 &lt;cfset QuerySetCell(apps,'created',info.config.info.created.XMLtext)&gt;
 &lt;cfset QuerySetCell(apps,'version',info.config.info.version.XMLtext)&gt;
 &lt;cfset QuerySetCell(apps,'category',info.config.info.category.XMLtext)&gt;
 &lt;/cffunction&gt;
</pre>
<p>If all is good, you should now be able to add the extension provider to the Railo Server context.</p>
<p><a href="/blog/assets/content/Screen%20shot%202010-07-02%20at%202%20Jul%2011.24.45.png"><img style="margin: 5px" src="/blog/assets/content/Screen%20shot%202010-07-02%20at%202%20Jul%2011.24.45.png" alt="" width="500" /></a></p>
<p> </p>
<p>And you should see your newly available extension in the Applications section of the Railo Server Administrator:</p>
<p><a href="/blog/assets/content/Screen%20shot%202010-07-02%20at%202%20Jul%2011.28.24.png"><img style="margin: 5px" src="/blog/assets/content/Screen%20shot%202010-07-02%20at%202%20Jul%2011.28.24.png" alt="" width="500" /></a></p>
<p>This means you can now install it! </p>
<p>In my next post I shall go into the other files that make up the extension and how you can automatically build it. </p>
<p> </p>