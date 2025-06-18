---
layout: post
title:  "ModelGlue: Reload and Mode make a huge difference"
uid:	"8A98D229-9A67-576F-540AFCFB17DB5CC8"

categories: model-glue,coldfusion
permalink: modelglue-reload-and-mode-make-a-huge-difference
---
I just thought I would post this as some people asked me about OO frameworks and their performance speed. I have been developing a little model glue content management system for a certain CF IDE site who shall remain nameless and during the course of development I was thinking to my self "boy, this is slow, I know I am in development mode, but hell its not a hot rod". So I started having doubts about the performace and was getting worried. I thought I would remove the ModelGlue debugging and that made some difference, I turned off ColdFusion debugging and that made a bigger difference. I changed the reactor config from 
<code>
<property name="mode"><value>development</value></property>
</code>
to
<code>
<property name="mode"><value>production</value></property>
</code>

And it was still not exactly screaming along. Then I realised I had forgotten (hey, its REALLY hot and humid here in London today, brain is fried) the 
<code>
<property name="reload"><value>true</value></property>
</code>
property in the model glue config! I know, I know... easy mistake to do, but when I turned it to "false", guess what? Bovine excrement zooming off a shovel.

Just remember this when you are going into production kids, or if you are starting to do some comparisons with other frameworks... otherwise it just aint fair calling frameworks slow.