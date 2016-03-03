---
layout: post
title:  "FusionDebug 1.5 Beta 2! (and getting it to work on OS X)"
date:   2007-01-11 11:07 AM +0000
categories: fusiondebug
---
I just managed to get the <a href="http://www.fusion-reactor.com/fusiondebug/openBetaSignup.html">new beta of FusionDebug 1.5</a> downloaded and installed. There certainly has been a lot of work making this product a lot nicer to install ,it has one installer for both the plugin/standalone version and the server side settings. 

Since I am a bit weird (but you knew that already) I have a setup on my MacBook Pro that is as follows:

JRun installed in /Applications
Coldfusion deployed as a J2EE app server in /Applications/JRun/servers/cfusion
The web root is actually at /Library/WebServer/Documents (using the JRun SDK to build my own mod_jrun.so as <a href="http://www.adobe.com/cfusion/knowledgebase/index.cfm?id=tn_18748">documented here</a>)
To start different servers I use a launcher called <a href="http://lingon.sourceforge.net/">Lingon</a> which basically allows you to run commands (such as launching servers) on startup

Why am I telling you all this? Well, the problem is that when you install FusionDebug, it is nice enough to change the jvm.config to add some startup parameters that allow the debugger to connect. This is fine under "normal circumstances" but I have a number of servers attached and I dont want all of them listening to the debugger connection strings, so, the command that I actually want to run is to make *just* the Coldfusion Server that I want start up with debug mode on. To do this I add the following settings in lingon (Users Daemons -> "ColdFusionMX" -> Expert)

<code>
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>Label</key>
		<string>ColdFusionMX</string>
		<key>ProgramArguments</key>
		<array>
			<string>/System/Library/Frameworks/JavaVM.framework/Versions/1.4.2/Home/bin/java</string>
			<string>-server</string>
			<string>-Djava.awt.headless=true</string>
			<string>-Dsun.io.useCanonCaches=false</string>
			<string>-XX:MaxPermSize=128m</string>
			<string>-Dcoldfusion.rootDir=\{application.home}/</string>
			<string>-Djava.compiler=NONE</string>
			<string>-Xnoagent</string>
			<string>-Xdebug</string>
			<string>-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8001</string>
			<string>-jar</string>
			<string>/Applications/JRun4/lib/jrun.jar</string>
			<string>-start</string>
			<string>cfusion</string>
		</array>
		<key>RunAtLoad</key>
		<true/>
	</dict>
	
</code>

What this definition basically says is:
"Run java, from the 1.4.2/Home path, as a server, make it headless, open a debug socket on port 8001, no need to suspend until the debugger has connected, then run a jar, from Jrun/lib/jrun.jar and tell it to -start cfusion"

Make sense?

So now, when I restart the service, only my cfusion server runs with a debug.

Right, next...

There is a problem with Eclipse's own implementation of the Java Debug Interface as it doesn't accurately reflect the Sun reference implementation (read more about it <a href="http://www.fusion-reactor.com/fusiondebug/support-appleMacIssue.html">here</a>). So, to fix that in your version of Eclipse (that you want to run Fusion Debug on) you have to make a copy of the Eclipse.app (the main Eclipse icon that you click on), rename it to something like EclipseFB and then right click, Show Package Contents, browse to Contents/OS X and edit the eclipse.ini file

You should remove the line that says something like 
<code>
"-Xbootclasspath/p:../../../plugins/org.eclipse.jdt.debug_3.2.1.r321_v20060731/jdi.jar"
</code>
 and then save it.

You should now be able to connect to your server as per the rest of the documentation.