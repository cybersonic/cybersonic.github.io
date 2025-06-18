---
layout: post
title:  "Running Railo from any directory"
uid:	"BB788D63-7964-42D3-B1ED489C1328F284"
date:   2012-09-11 01:45 PM +0000
categories: railo
permalink: running-railo-from-any-directory
---
<p>Today on the Railo mailing list someone asked if there was a way to start railo from any directory and use that directory as the web root. A fair enough question and it got me intrigued.</p>
<p>So after a bit of research I come up with the following, of course this works for OS X, change the relevant bits to suit your OS (hey, send me how to do it and I shall update the post)</p>
<p>First off, I downloaded Railo Express (3.3.4.003) and saved it to:</p>
<p><code>/Applications/railo_runner</code></p>
<p>Then I copied the <code>./start</code> and renamed it to <code>./railo_runner</code></p>
<p>I added the path to <code>~/.bash_profile</code> by adding:</p>
<p>
	<code>
export RAILO_RUNNER=/Applications/railo_runner/
export PATH=$PATH:$RAILO_RUNNER
	</code>
</p>
<p>so now, to change the <code>railo_runner</code> script. Mine looks like this:</p>
<p><code>
#!/bin/bash
CURRPATH=$(pwd)
cd $(dirname $0)
java -DSTOP.PORT=8887 -DSTOP.KEY=railo -jar -Xms256M  -Xmx512M lib/start.jar -Drespath=$CURRPATH
</code></p>
<p>The only thing I added was the current path and added it as a System property with the -D flag, as you can see by the <code>-Drespath=$CURRPATH</code>. All is good so far, now to tell Jetty to do something with it!</p>

<p>In the <code>/Applications/railo_runner/contexts/railo.xml</code> I changed the system property that is used for the resourceRoot:</p>
<p>
	<code>
<?xml version="1.0"  encoding="ISO-8859-1"?>
<!DOCTYPE Configure PUBLIC "-//Jetty//Configure//EN" "http://www.eclipse.org/jetty/configure.dtd">
<Configure class="org.eclipse.jetty.webapp.WebAppContext">
  <Set name="contextPath">/</Set>
<!--
  <Set name="resourceBase"><SystemProperty name="jetty.home" default="."/>/webroot/</Set>
-->
   <Set name="resourceBase"><SystemProperty name="respath" default="./webroot/"/></Set>
  <Set name="defaultsDescriptor"><SystemProperty name="jetty.home" default="."/>/etc/webdefault.xml</Set>
</Configure>
	</code>
</p>
<p><code>
Now I can do the following:
Earth:~ markdrew$ cd ~/Sites/
Earth:Sites markdrew$ mkdir demo_site1
Earth:Sites markdrew$ cd demo_site1
Earth:demo_site1 markdrew$ railo_runner
</code></p>
<p>And voila! It creates the WEB-INF and you are good to go by http://localhost:8888!</p>