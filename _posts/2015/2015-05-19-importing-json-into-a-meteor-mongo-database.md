---
layout: post
title:  "Importing JSON into a Meteor Mongo Database"
uid:	"3AFA2740-A485-405E-868BD859A24830C6"
date:   2015-05-19 12:55 PM +0000
categories: meteor,mongodb
permalink: importing-json-into-a-meteor-mongo-database
header-img: img/mongo_csv_import.jpg
---
<p><a href="http://meteor.com/">Meteor</a> is a great way to develop fast real-time appliations using JavaScript on both the client and server side. When you are developing these applications it&#39;s easy to create new collections of information by adding items doing the following script either in the client or server:</p>

<pre>
Collection.insert(\{key:value});	
</pre>

<p>But this is obviously not the most effective way to add lots data!</p>

<p>MongoDB has a tool called <code>mongoimport</code> which you can use to import data straight into a MongoDB instance itself, but that tool doesn&#39;t come with Meteor. What to do???</p>

<p>The answer is actually rather simple, all you have to do is install MongoDB but you don&#39;t need to run an instance of it, as you are already doing that with your Meteor installation.<br />
Once you have it installed check in the &lt;MongoDB Install Path&gt;/bin and you should see the <code>mongoimport</code> executable. Now, to import some json you need to tell it the host and database of the Meteor instance of MongoBD:</p>

<pre>
mongoimport -h localhost:3001 --db meteor --collection tweets --type json --file exampletweets.json --jsonArray	
</pre>

<p>That is a long command so let&#39;s break it down:<br />
<code>mongoimport</code> is obvisouly the command.<br />
<code>-h</code> is the host and port<br />
<code>--db</code> is the database, in this case it&#39;s meteor<br />
<code>--collection</code> is the collection we are going to be importing into<br />
<code>--type</code> is the format of the file we will be importing, in this case a <code>json</code> file of tweets<br />
<code>--jsonArray</code> MongoDB has a strange idea of what a json format is, if you omit this it will want a file in the format:</p>

<pre>
\{key:value}
\{key:value}
\{key:value}
</pre>

<p>Which I am sure you can tell is not JSON formatted. So if you want proper JSON format like:</p>

<pre>
[
	\{key:value},
	\{key:value},
	\{key:value}
]
</pre>

<p>You need to add the <code> --jsonArray </code> so that MongoDB accepts it as plain JSON.</p>

<p>&nbsp;</p>

<p>On a side note here, if you want to find out what host and port your Meteor instance of MongoDB is running on you just have to do:</p>

<pre>
meteor mongo
</pre>

<p>And you should get a response like:</p>

<pre>
MongoDB shell version: 2.6.7
connecting to: 127.0.0.1:3001/meteor
meteor:PRIMARY&gt;	
</pre>

<p>Hope that helps!</p>

<p>&nbsp;</p>