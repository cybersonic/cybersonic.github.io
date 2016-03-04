---
layout: post
title:  "Problems with the RDS plugin and myEclipse"
uid:	"8A987229-C689-925C-45E984194F006703"
date:   2006-03-21 11:05 AM +0000
categories: adobe
permalink: problems-with-the-rds-plugin-and-myeclipse
---
If you have just got your clammy hands on the RDS plugin and installed it onto your Eclipse then got an error when you opened up a Quiery View, click on the details and if you see something like<br /><br />&quot;at org.springframework.ide.eclipse.beans.ui.....&quot;<br /><br />it means you have myEclipse installed and it is clashing with the RDS plugin.&nbsp; So you can disable (just momentarily I am sure) the myEclipse plugin by going to <br /><br />Help -&gt; Software Update -&gt; Manage Configuration <br /><br />There look for the myeclipse plugin and select it and click the disable link on the details. <br /><br />Hope that helps<br />