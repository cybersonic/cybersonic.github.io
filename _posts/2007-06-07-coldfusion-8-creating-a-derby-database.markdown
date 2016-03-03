---
layout: post
title:  "Coldfusion 8: Creating a Derby database"
uid:	"8A9AA0B6-ABE4-5895-FB214153FBD7F334"
date:   2007-06-07 11:08 AM +0000
categories: webdev
---
I am not sure how many people noticed but ColdFusion 8 now comes with an in-built database called <a href="http://db.apache.org/derby/">Apache Derby</a>. This is great for people needing to deploy applications that need a little database that might be highly performant but without the need for complex queries etc.  (read SnipEx here).

To get you started, it comes with the sample applications already installed, but what if you want to create your own database, and point a datasource to it?

Well, help is at hand, this is what I did to create a test database and point a DSN to it:

Firstly, go to (in a terminal window) the directory where you will create the database files, in my case I was going to create it under /Applications/ColdFusion8/db/ .

Then run the following command:

<code>
> java -jar /Applcations/ColdFusion8/lib/derbyrun.jar ij
</code>
(obviously substituting your path to the jar). Once you have done that, you can now create a database by entering:

<code>
ij> connect 'jdbc:derby:cfeclipse_test;create=true';
</code>

Where <em>cfeclipse_test</em> is the name of your database, to exit just type "exit ;"

Now that you have created the database you can create a DSN entry for it, all you have to do is create a DSN of type "Apache Derby Embedded" and point it to the folder where you created the databse, in this case it would be "/Applications/ColdFusion8/db/cfeclipse_test"

It should all now work, and you have a DSN to create your tables and run your queries against.

For more info on Derby, check out: <a href="http://db.apache.org/derby/docs/dev/getstart/">http://db.apache.org/derby/docs/dev/getstart/</a>