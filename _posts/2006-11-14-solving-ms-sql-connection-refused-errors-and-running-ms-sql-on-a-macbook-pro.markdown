---
layout: post
title:  "Solving MS SQL \"connection refused\" Errors and running MS SQL on a MacBook Pro"
uid:	"8A98FA52-95CB-311E-B7E222C0187AF59F"
date:   2006-11-14 11:06 AM +0000
categories: microsoft
permalink: solving-ms-sql-connection-refused-errors-and-running-ms-sql-on-a-macbook-pro
---
I did a fresh install of Windows with ColdFusion 7.02 and MS SQL 2000 (SP2?) under Parallels on my MacBook Pro the other day. After I had installed everything I tried to set up a DSN in ColdFusion but I kept getting "connection refused" errors, no matter what I did. I did a lot of googling to find a solution and found lots of work arounds including setting up a ODBC data-source. None of these were satisfying, I mean, you SHOULD be able to connect to a database right? That's the whole point!

So that I don't do the same mistake again I thought I would blog it. The solution is actually rather simple, you just have to install <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=90DCD52C-0488-4E46-AFBF-ACACE5369FA3&amp;displaylang=en">Microsoft SQL Server 2000 Service Pack 3a</a>. That totally solves the problem. (I haven't checked with upgrading to Service Pack 4 yet.)

On a related note, I was able to connect to the Microsoft SQL Server running under Parallels from OS X. Pretty neat!