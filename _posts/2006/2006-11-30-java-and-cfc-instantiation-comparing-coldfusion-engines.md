---
layout: post
title:  "Java and CFC instantiation, comparing ColdFusion engines"
uid:	"8A995996-B9DD-279F-02E069A2339C5151"
date:   2006-11-30 11:06 AM +0000
categories: coldfusion
permalink: java-and-cfc-instantiation-comparing-coldfusion-engines
---
Yesterday I posted my comparative tests between creating a CFC and a Java object, Andy Jarett mentioned in a post that I should try out the different engines: Adobe ColdFusion, BlueDragon and Railo and see how they stacked up against each other. So I run the *SAME* code on each of the engines, of course I had to put my Generic.jar file into the classpath for each engine to have access to it.

In the test I used Bluedragon 6.2.1, Coldfusion MX 7.0.2 and Railo 1.1, and pointed them to the same webroot*.

The results are fairly erratic but that is because I didnt run them a number of times, no, I didnt put trusted cache on all the engines, as I know this should improve performance but it is comparative right?

So, the results?

They speak for themselves. At the end of the day its a lot faster to use a Java class than a CFC.

<strong>CFC based GenericBean</strong>

<img src="/speedtest/results/all_cfcgenericbean.png">

<strong>Java based GenericBean</strong>

<img src="/speedtest/results/all_javagenericbean.png">

*I shall provide details on how to do this later on today