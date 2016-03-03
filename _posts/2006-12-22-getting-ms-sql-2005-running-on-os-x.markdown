---
layout: post
title:  "Getting MS SQL 2005 running on OS X"
uid:	"8A99605D-D06E-B4EC-CC5800AD7D727148"
date:   2006-12-22 11:06 AM +0000
categories: microsoft
---
Ok, the title is a bit misleading, but if you are using Parallels it isnt. I come across a problem of connecting ColdFusion server (running under OS X) to a newly installed version of Microsoft SQL Server 2005 running under Parallels.

After I installed SQL Server, I was able to ping the machine but not connect to it and was getting "Connection Refused" errors in the Datasource setup under CFAdmin. 

To start off with, I went to check if the service was running. Since it was, I opened up Start -> All Programs -> Microsoft SQL Server 2005 -> Configuration Tools -> SQL Server Configuration Manager.

In the manager open the "SQL Native Client Configuration" then "Client Protocols" and double click on "TCP/IP" you should get a window with:

Default Port: 1433
Enabled:No

Change the Enabled setting to yes.

Then, open up Start -> Control Panel -> Windows Firewall and click on the "Exceptions" tab. "Click Add Port...", enter MS SQL as the name and add the port 1433.

You should now be able to connect to the MS SQL server from ColdFusion on OS X