---
layout: post
title:  "Apache, Virtual Hosts, PHP, CF5 and CFMX (part 1)"
date:   2004-06-07 11:04 AM +0000
categories: webdev
---
Web development sometimes can be a right pickle. If you have been working for few different sites you start to get conflicts of technology or you start buying computers for the sake of running one environment per computer, NOT economic!


Take my current setup for example, I am doing development of a site in Coldfusion MX, support of another site based on Coldfusion 5 and development of another site based on PHP. To sort all these things out I use something called Virtual Hosts. The concept of a Virtual host is that of hosting a number of websites on one single server, most probably using a single IP address and using the URL (domain) name that is requested to display the chosen website.

In my setup I use <a href="http://httpd.apache.org/">Apache</a>(2.0.49) and have implemented the virtual hosts for each of the projects that I am working on, e.g.:

<strong>http://cf5_project/ </strong>which would point to c:/www/cf5_project
,
<strong>http://cfmx_project</strong> which would point to c:/www/cfmx_project
and
<strong>http://php_project</strong> which would point to c:/www/php_project

For each of these projects I have a slightly different setup and it is achieved as follows:

<strong>Add entries in the hosts file</strong>
To achieve this you need to edit the <strong>hosts</strong> file which can be found in:
C:\WINNT\system32\drivers\etc\hosts

and add the following lines.
<div class="code">
127.0.0.1 cf5_project
127.0.0.1 cfmx_project </div><div class="code">127.0.0.1 php_project 

</div>
of course, replacing WINNT for your system path, if you are using OS X you can use NETINFO manager under Applications/Utilities to add an entry (duplicate localhost and change the name)

<strong>Enable and add the Virtual Hosts in Apache</strong>
Now that you have done that, you need to change the configuration of Apache by editing the httpd.conf file

If you look at the bottom of the httpd.conf file you will see an entry such as:
<div class="code">
# Use name-based virtual hosting.
#NameVirtualHost *:80

</div>

Remove the # so that you can add a few more entries as follows:
<div class="code">
# Use name-based virtual hosting.
NameVirtualHost cf5_project
NameVirtualHost cfmx_project
NameVirtualHost php_project
</div>

Now that you have told apache which domain names it hosts, we can now defined each one with its different settings. To do this, add entries for each project below the <em>NameVirtualHost</em> entries.

<div class="code">
&lt;VirtualHost <strong>cf5_project</strong>&gt;
    ServerAdmin mark.drew@gmail.com
    DocumentRoot <strong>"c:/www/cf5_project"</strong>
    ServerName <strong>cf5_project</strong>
    ErrorLog logs/<strong>cf5_project-error_log</strong>
    CustomLog logs/<strong>cf5_project-access_log common</strong>
&lt;/VirtualHost&gt;

</div>
Note the changes in bold. The first one, next to "VirtualHost" should match the NameVirtualHost you added previously. Change the <em>DocumentRoot </em>attribute to point to your project's root directory, add the <em>ServerName</em> the same as the NameVirtualHost and then setup the name of the log files to which errors and access requests will be logged to.

Repeat this process for cfmx_project and php_project.

<strong>Adding the individual modules</strong>
For each project I have a different server assigned, for coldfusion 5 you need to download (and follow the install instructions) available from
<a href="http://home.nextron.ch/coldfusion">http://home.nextron.ch/coldfusion</a>

then I modified the entry for cf5_project as follows:

<div class="code">
&lt;VirtualHost cf5_project&gt;
ServerAdmin mark.drew@gmail.com
DocumentRoot "c:/www/cf5_project/"
ServerName cf5_project
ErrorLog logs/cf5_project.local-error_log
CustomLog logs/cf5_project.local-access_log common
<strong>#Coldfusion 5 module
LoadModule coldfusion_module modules/mod_coldfusion.so
AddHandler type-coldfusion cfm dbm</strong>
&lt;/VirtualHost&gt;

</div>

Once this runs we can then go on and set up CFMX as another Virtual Host.

to be continued...