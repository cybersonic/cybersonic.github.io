---
layout: post
title:  "Running MongoDB from Sublime Text 2"
uid:	"C5CAE5AF-8757-457E-8FE89D54DF4D332B"
date:   2013-11-08 11:10 AM +0000
categories: 
permalink: running-mongodb-from-sublime-text-2
---
<p>For last night's presentation at the CFUG about MongoDB I was running the demos right from Sublime Text 2. This was mainly to be able to increase the font but I was asked how I did it. (I generally use either the mongo shell or <a href="http://robomongo.org/">RoboMongo</a> which is awesome!)</p>
<p>Here you can see how it was running: </p>
<p><a href="/blog/assets/content/Screenshot 2013-11-08 15.08.53.png" target="_blank"><img src="/blog/assets/content/Screenshot 2013-11-08 15.08.53.png" alt="" width="500" height="245" /></a></p>
<p>The way I pulled this off was to create my own Build System called MongoDB:</p>
<p><img src="/blog/assets/content/Screenshot 2013-11-08 15.09.37.png" alt="" width="444" height="253" /></p>
<p>Now that you have a blank Build system, all you need to do is enter the following:</p>
<p>
<script src="https://gist.github.com/cybersonic/7372861.js"></script>
</p>
<p>Of course, replace the path to mongoDB with whatever the path to your installation of mongoDB is! And finally all you have to do is hit the cmd+B buttion and it will then send the path to the current file to mongo. </p>
<p>I got this working for Sublime Text 2 but in Sublime Text 3 it <span style="text-decoration: line-through;">didn't work as expect</span> the code is not exactly the same. You have to change the build script to the code below:</p>
<p>
<script src="https://gist.github.com/cybersonic/7373013.js"></script>
</p>
<p> I can send commands to MongoDB too <span style="text-decoration: line-through;"> but it doesn't display anything in the Results pane which is a shame. So if you get it working in Sublime Text 3 let me know! </span></p>
<p> </p>