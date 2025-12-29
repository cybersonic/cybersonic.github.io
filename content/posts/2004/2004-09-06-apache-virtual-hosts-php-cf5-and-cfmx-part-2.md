---
layout: post
title:  "Apache, Virtual Hosts, PHP, CF5 and CFMX (part 2)"
uid:	"8A97884B-97FE-2906-3CEEA9DE9C341848"

categories: coldfusion,webdev
permalink: apache-virtual-hosts-php-cf5-and-cfmx-part-2
---
Continued from <a href="http://cybersonic.blogspot.com/2004/06/apache-virtual-hosts-php-cf5-and-cfmx.html">Part 1</a>...

In the last episode I talked about adding virtual hosts to your system and showed you how to set up one of your sites as a Coldfusion 5 site. That is a great start but I don't just run Coldfusion 5 (you Grandpa you might say! Who uses it?!) I also run <a href="http://www.php.net/">PHP </a>and ColdFusion MX on this poor little box.The next step is to add PHP support, so if you look back to your httpd.conf file we can add an entry for our PHP site as before, we add a new VirtualHost entry and add the right PHP module (you should have already installed PHP, I am not going into that... they have a better manual and more time)

&lt;VirtualHost php_project&gt;
ServerAdmin mark.drew@gmail.com
DocumentRoot "c:/www/php_project/"
ServerName php_project
ErrorLog logs/php_project-error_log
CustomLog logs/php_project-access_log common
LoadModule php4_module c:/php/sapi/php4apache2.dll
AddType application/x-httpd-php .php
&lt;/VirtualHost&gt;



Once you have added that you can start testing it by adding a php file in the root
(at c:/www/php_project/ in my case)
such as index.php with the following code

&lt;?php phpinfo();?&gt;



you should have it all running and telling you all sorts of very useful information about your php setup!

The next step will be to setup our CFMX Virtual Host.

I am presuming that you have Coldfusion MX installed on your machine and running either as a standalone server (off port 8500) or installed onto IIS, you can download a copy from <a href="http://www.macromedia.com/">http://www.macromedia.com/</a> and follow the install instructions here <a href="http://www.macromedia.com/support/coldfusion/installation.htmll">http://www.macromedia.com/support/coldfusion/installation.htmll</a>

Once you have your copy if CFMX running nicely you need to use the wsconfig tool that comes with CFMX, browse to your C:\CFusionMX\runtime\bin and double click on wsconfig.exe. This should pop open a window, click "Add..." and enter the correct values about the location of your Apache httpd.conf file and which instance of coldfusion you want to create a connector for, e.g.:


Jrun Host: localhost
JRun Server: default
Web Server: Apache
Configuration Directory: C:\Apache Group\Apache2\conf
Tick "Configure web server for ColdFusion MX applications"
And click "OK"



This would have created a connector in your Coldfusion Directory and added the following code at the bottom of your httpd.conf file:


&lt;Ifmodule&gt;# JRun Settings
LoadModule jrun_module "C:/CFusionMX/runtime/lib/wsconfig/1/mod_jrun20.so"
&lt;IfModule mod_jrun20.c&gt;
JRunConfig Verbose false
JRunConfig Apialloc false
JRunConfig Ssl false
JRunConfig Ignoresuffixmap false
JRunConfig Serverstore "C:/CFusionMX/runtime/lib/wsconfig/1/jrunserver.store"
JRunConfig Bootstrap 127.0.0.1:51010
#JRunConfig Errorurl &lt;optionally redirect to this URL on errors&gt;
AddHandler jrun-handler .jsp .jws
&lt;/IfModule&gt;



This means that ALL virtual hosts will now run Coldfusion.. which is what we DONT want.

What we need to do is create our Virtual Host for our coldfusion server and move this block inside only that Virtual host:


&lt;VirtualHost cfmx_project&gt;
ServerAdmin mark.drew@gmail.com
DocumentRoot "c:/www/cfmx_project/"
ServerName cfmx_project
ErrorLog logs/cfmx_project.local-error_log
CustomLog logs/cfmx_project.local-access_log common

Alias /cfide/ "C:/CFusionMX/wwwroot/cfide/"
Alias /Main/ "C:/CFusionMX/wwwroot/cfide/"

# JRun Settings
LoadModule jrun_module "C:/CFusionMX/runtime/lib/wsconfig/1/mod_jrun20.so"
&lt;IfModule mod_jrun20.c&gt;
JRunConfig Verbose false
JRunConfig Apialloc false
JRunConfig Ssl false
JRunConfig Ignoresuffixmap false
JRunConfig Serverstore "C:/CFusionMX/runtime/lib/wsconfig/1/jrunserver.store"
JRunConfig Bootstrap 127.0.0.1:51010
#JRunConfig Errorurl &lt;optionally redirect to this URL on errors&gt;
AddHandler jrun-handler .jsp .jws
&lt;/IfModule&gt;
&lt;/VirtualHost&gt;


Stop and restart your webserver and place a index.cfm into the path you defined as your directory for your Virtual Host (in this case: c:/www/cfmx_project/) and test your server.

Voila!