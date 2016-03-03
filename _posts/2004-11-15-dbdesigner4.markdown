---
layout: post
title:  "dbdesigner4"
date:   2004-11-15 11:04 AM +0000
categories: webdev
---
<a href="http://photos1.blogger.com/img/21/1061/640/DBDesigner%204.jpg"><img style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; MARGIN: 2px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" src="http://photos1.blogger.com/img/21/1061/320/DBDesigner%204.jpg" border="0" /></a>
I have been looking for a way to emulate Microsoft SQL Server's Enterprise Manager when using a mySQL database. Basically I wanted to be able to design the tables in a db as you would do in EM and add relationships etc (this is the way I think so its nice to have a tool that behaves acordingly).
I asked Oliver T for any sugestions and he come up with <a href="http://www.fabforce.net/dbdesigner4/">dbdesigner4</a>. I got more than I bargained for. This is a great little app, not your usual "create DB", "create Table" kinda thing. But what it allows you to do is visually design all the tables (giving you hints like id<tablename> for the Primary Key) as well as all the relationships

Now the REAL cool thing about this is that you can group tables into Regions into which you can put related tables in the diagram so you can see WHAT all the tables are for.

Another thing that is SUPER cool about this is that you can use the provided SimpleWebFront plugin to create a PHP website to administer the tables! You add the groups into which you add the tables you want to administer.. add the DB connection properties for a mysql db and then point it to a directory for it to go off and create you a nice simple web front end to your db.

Did I also mention its free??? Rock on!