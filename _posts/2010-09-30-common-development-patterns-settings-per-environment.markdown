---
layout: post
title:  "Common Development Patterns: Settings per Environment"
date:   2010-09-30 12:27 PM +0000
categories: coldspring
---
<p>I am thinking of doing a range of blog posts related to common development patterns that I have seen implemented. These are not exactly Design Patterns, but practices that I see and have implemented myself.</p>

<p>To kick of this series, I thought I would talk about your application&#39;s settings depending on environment. As a background I was working on a Galleon application that in development runs on Apache with MySQL and in Staging/Live it runs on IIS and MS SQL. Generally you want to keep your environments the same of course, but the main changes were simply table names, emails and URLs so all the code was fine.</p>

<p>One of the things that annoyed me was that before I could check in my code to SVN, I would have to change the settings.ini.cfm file, putting all the live settings in there.</p>

<p>Since Galleon is not built on any framework, I decided to just easily plug in a config detector, so I could use a different settings file, settings.local.ini.cfm and not have to to change the main config.</p>

<p>I did this simply where the settings file is included so for Galleon I put this in the code:</p>

<p><code><cfset settingsfile="settings.ini.cfm" var=""> <cfif cgi.server_name="" eq=""> <cfset settingsfile="settings.local.ini.cfm"> </cfset></cfif> </cfset></code></p>

<p>(I have removed a lot of other code round it to make it simple)</p>

<p>This is a simple replacement, that is based on the CGI_SERVER_NAME</p>

<p>You could of course get a bit fancier, depending on the name of the physical machine, but you have to drop into Java and get the actual machine&#39;s host (rather than what I have placed in the URL, since you might be replicating the live site with an entry in your hosts file):</p>

<p><code><cfset thishost="createObject("> <cfset settingsfile="settings.ini.cfm" var=""> <cfif eq="" thishost=""> <cfset settingsfile="settings.local.ini.cfm"> </cfset></cfif> </cfset></cfset></code></p>

<p>If you are using ColdBox, you can just add the EnvironmentControl interceptor in your config/coldbox.xml.cfm:</p>

<p><code><interceptor class="coldbox.system.interceptors.environmentControl"> <property name="configFile">config/environments.xml.cfm</property> <property name="fireOnInit">false</property> </interceptor> </code></p>

<p>And in your config/environments.xml.cfm you can override any settings just by adding them to the correct section:</p>

<p><code><environment hosts="markdrew" name="development-mark" urls="unused"> <!-- where email bounces should go to --> <setting name="BounceEmail" value="mark@localhost"> <setting name="DevelopmentEmail" value="mark@localhost"> <setting name="BugEmails" value="mark@localhost"> </setting></setting></setting></environment> </code></p>

<p>If you are using ColdSpring for your configuration, you might want to do a couple of things, first thing you can do is simply call in a different coldspring.xml.cfm file when you create your bean factory, but to do this you would have to copy all your beans. The easiest way is to have the root coldspring.xml.cfm file have any settings that you want in a (configBean for example) and then include your main coldspring file.</p>

<p>So, wherever we are loading Coldspring up we can put an environment logic:</p>

<p><code><cfset application.cs="CreateObject(&quot;component&quot;,"> <cfif cgi.server_name="" eq=""> <cfset config=""> <cfelse> <cfset config=""> </cfset></cfelse></cfset></cfif> </cfset></code></p>

<p>In the coldspring.xml.cfm file we would have:</p>

<p><code><beans> <bean class="my.app.ConfigBean" id="Config"> <property name="project"><value>Project</value></property> <property name="dsn"><value>projectDatabase</value></property> <property name="adminEmail"><value>admin@somedomain.com</value></property> <property name="mode"><value>production</value></property> </bean> <import resource="/config/SharedColdSpring.xml"> </import></beans> </code></p>

<p>This would setup the Config bean that is passed to other objects and fill it with values that are required and then include the SharedColdSpring.xml that doesn&#39;t really need any changing per environment</p>

<p>In my coldspring.markdrew.xml.cfm I would have the same but with my settings:</p>

<p><code><beans default-autowire="byName"> <bean class="my.app.ConfigBean" id="Config"> <property name="project"><value>Project</value></property> <property name="dsn"><value>devDB</value></property> <property name="adminEmail"><value>mark@localhost</value></property> <property name="mode"><value>development</value></property> </bean> <import resource="/ws/config/SharedColdSpring.xml"> </import></beans> </code></p>

<p>I hope this gives you some ideas on how to remove some effort from your work day!</p>