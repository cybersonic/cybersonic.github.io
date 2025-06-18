---
layout: post
title:  "Flex Builder and Macromedia Labs"
uid:	"8A979D78-9E8A-CA89-AE959B3A0DE695D8"

categories: flex
permalink: flex-builder-and-macromedia-labs
---
Just in time for the MAX conference (where every other developer seems to be but me!) Macromedia release a new section on their site (like Google) with <a href="http://labs.macromedia.com/">labs.macromedia.com</a>, as a showcase of their up-coming products.

One of the more interesting products for me is the Flex Builder 2. Formerly named Zorn it is an Eclipse based plugin that allows you to build flex applications as you would Java (write, compile, deploy as swf) rather than using the Flex server to do the compile and deploy for you (along with a hefty price tag!)

I am using the plugin version of Flex Builder 2 which is a fantastic way to develop since I can have my CFC's in one window and the flex app in another and switch between them in one IDE.

Pretty easy to develop, it builds automatically (as you would expect in eclipse) and you can both run and debug your applications. Awesome!

I have some niggles tho:
Firstly, is that the plugin is windows only. So I can only play with it at work. I don't understand why this is since (when writing the <a href="http://www.eclipse.org/">CFEcplipse</a> plugin) I never encountered features that I had to make Windows only.
Secondly, when running a flex app, it seems to run locally, from the file system (not from localhost) even when I changed the build paths for the project to run it through my webserver nothing runs in the swf. I am not sure if this is a limit on the alpha or something but there is nothing in the documentation.

I am re-reading the <a href="http://labs.macromedia.com/wiki/index.php/Flex:Accessing_Data">following (Flex Wiki)</a> and will let you know if this solves the problem. Seems to be that we have to create a Proxy to get it running.

Any Ideas out there?