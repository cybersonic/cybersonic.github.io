---
layout: post
title:  "Quick Linux Port Redirect Tip"
uid:	"527EDAC7-46F3-498B-822D95973A7DF0F2"

categories: linux,railo,tomcat
permalink: quick-limux-port-redirect-tip
---
<p>A lot of the time when I am deploying applications on Railo, you get the installer, and install a version of tomcat (for example) and then setup Railo and then finally install Apache or NGinx.</p>

<p>This has been working well for a while but what if you dont want that extra webserver layer? There are times where I don&#39;t see the point of setting up Apache since all it will be doing (in my case) is proxying from port 80 to port 8080.</p>

<p>There are a couple of things you can do:</p>

<ol>
	<li>Try and change the port in tomcat by editing server.xml</li>
	<li>Use iptables to redirect the port without having to install anything else!</li>
</ol>

<p>&nbsp;</p>

<p>Recently I got into a <a href="http://projects.csail.mit.edu/gsb/old-archive/gsb-archive/gsb2000-02-11.html" target="_new">Yak Shaving</a> situation where having changed the port of Tomcat to port 80, meant that I need to change the user that Tomcat was going under (and I didn&#39;t want to do that!) so meant I had to do a bunch of other stuff and essentially meant that the only way out would be to install a web server. Which seemed overkill for the app (well, service) I wanted to deploy.</p>

<h3>IPTABLES to the rescue!</h3>

<p>After a quick trawl around the internet I found the solution, which was just to put some redirects in iptables.</p>

<p><code>sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080</code></p>

<p><code>sudo iptables -t nat -I OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 8080</code></p>

<p>This achieves the goal I was looking for without the need to configure yet another service (that will need restarting when we do other changes etc)</p>

<p>What do you think? Useful?</p>