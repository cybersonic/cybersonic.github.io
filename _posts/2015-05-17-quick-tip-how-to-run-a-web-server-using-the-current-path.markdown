---
layout: post
title:  "Quick tip: How to run a web server using the current path"
uid:	"36708DDF-882F-4212-A62B78D156B008A6"
date:   2015-05-17 10:17 AM +0000
categories: npm
permalink: quick-tip-how-to-run-a-web-server-using-the-current-path
---
<p>A lot of times you want to run a simple web server from the current path. Whether it be to see how javascript behaves or if you have linked things right in an html file. A quick tip is to install an npm package called <a href="https://www.npmjs.com/package/http-server">http-server</a> (the clue is in the name!)&nbsp;</p>

<p>Installation is pretty simple, by the usual npm route:</p>

<pre>
npm install http-server -g</pre>

<p>And then you just have to go to the folder you want to serve files from and do:</p>

<pre>node bin/http-server</pre>

<p>or the following just worked for me:</p>

<pre>http-server</pre>

<p>Hope that helps!</p>