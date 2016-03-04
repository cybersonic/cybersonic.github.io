---
layout: post
title:  "Update: CFEclipse 1.3.1.2 released for SFTP users"
uid:	"8A9A63AE-A3A9-4C8B-04DF0CCE830106FE"
date:   2007-03-07 11:08 AM +0000
categories: coldfusion
permalink: update-cfeclipse-1-3-1-2-released-for-sftp-users
---
I have put up another update of CFEclipse (version 1.3.1.2 if you are into numbers) that fixes a problem that users of the File Explorer were having with connecting to SFTP sites. The problem was that the plugin was checking if you had already accepted the host's certificate (I think that is what its called), if you hadn't it would prompt you (well it doesn't it does it in the background and you say no) so the connection would fail.

I have now set it to auto-accept, which as some people know, is what Dreamweaver does.

Another thing I have added are some new icon's for CFM and CFC files. In the background, there are actually now Editors, one for CFC's and one for CFM's but the CFC editor just extends the CFM editor so its essentially the same for the moment, until I start adding CFC specific parsing. This is something that should have been done long ago.

If you experience some problems do let me know.