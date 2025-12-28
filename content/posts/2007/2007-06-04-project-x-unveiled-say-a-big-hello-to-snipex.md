---
layout: post
title:  "Project X unveiled: Say a big hello to SnipEx"
uid:	"8A9A7D50-93CC-050B-FA07A9DA7B9AB939"

categories: cfeclipse,coldfusion,snipex
permalink: project-x-unveiled-say-a-big-hello-to-snipex
---
At the CFEclipse presentation at <a href="http://scotch.scottishcfug.com/">Scotch on the Rocks</a> last week, Project X was finally unveiled.

SnipEx is a new server side project, written in CF which allows CFEclipse's Snippets View to get snippets from a remote server.

<strong>The Server</strong>
The SnipEx server is made up of a couple of CFC's as well as (currently) a MySQL server. The database interaction is pretty simple so this can be ported and modified to suit the needs of most people (such as adding notification and custom workflows). 

All the code behind it is in CFML so users should not have any problems adapting it to suit their needs both for internal snippet storage and for external display. 

The code for the SnipEx server will be released to the community this week on <a href="http://www.riaforge.org/">RiaForge</a>.

<strong>The Client</strong>
The client is simply CFEclipse. You can subscribe to up to eight SnipEx servers including an upcoming <a href="http://www.cfeclipse.org/">CFEclipse.org</a> hosted one and one hosted at CFLib.org (with a big thank you to <a href="http://ray.camdenfamily.com/">Ray Camden</a>) and you have the ability then to insert snippets from remote servers into your CFML documents as well as (if the server has been configured to do so) submit your own snippets to servers.


A big thank you has to go out to <a href="http://www.rbdev.net/devblog/index.php">Robert Blackburn</a>, that apart from developing the CFUnit plugin has also developed the core of this feature. Also a big shout out to <a href="http://www.andyjarrett.co.uk/andy/blog/index.cfm">Andy Jarrett</a> for the server side part of it!


Finally, you might be wondering when this will be released? Well, it will have to be in a couple of days time, as it will be part of a bigger release. So hold on for the moment!

<br>

<a href="/blog/enclosures/snipex_1.png" target="_new"><img src="/blog/enclosures/snipex_1_thumb.png" width="150" height="65" alt="Snipex 1 Thumb" align="top"></a>

<a href="/blog/enclosures/snipex_2.png" target="_new"><img src="/blog/enclosures/snipex_2_thumb.png" width="150" height="139" alt="Snipex 2 Thumb" align="top"></a>

<a href="/blog/enclosures/snipex_3.png" target="_new"><img src="/blog/enclosures/snipex_3_thumb.png" width="150" height="61" alt="Snipex 3 Thumb" align="top"></a>

<a href="/blog/enclosures/snipex_4.png" target="_new"><img src="/blog/enclosures/snipex_4_thumb.png" width="150" height="129" alt="Snipex 4 Thumb" align="top"></a>

<a href="/blog/enclosures/snipex_5.png" target="_new"><img src="/blog/enclosures/snipex_5_thumb.png" width="150" height="300" alt="Snipex 5 Thumb" align="top"></a>