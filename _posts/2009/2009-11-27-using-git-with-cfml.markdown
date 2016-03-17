---
layout: post
title:  "Using Git with CFML"
uid:	"B37D5DAF-A381-49D4-AF6295F033E4C642"
date:   2009-11-27 01:08 AM +0000
categories: webdev,cfml
permalink: using-git-with-cfml
---
<p>Today I was writing a little app that helps me keep up with my Todo list, since I wanted to have a web interface for some reporting into my tasks.</p>
<p>The issue is that my todo list is just a text file (and before you go saying there are various apps, I am happy with my text file ok? for various reasons which are not part of this post), so I built a nice web interface to it, but the problem is that since I can modify it, and whilst I was developing it I wanted a way to back this file up. I mean, whist I am coding this app, I might make mistakes and want to roll back. </p>
<p>So I got thinking of a way to do this and realised I do this every day anyway, using <a href="http://git-scm.com/">git</a>!. So, I thought, for every change I do to the file, why not check it into its repository. </p>
<p>I fiddled about with cfexecute, which to be honest I haven't used much previously but I couldn't change the working directory, so, thanks to <a href="http://tim.bla.ir/tech/articles/changing-the-working-directory-of-cfexecute">Tim Blair's post</a> I managed to do the following: </p>
<p> </p>
<p>&lt;!--- since we have made modifications to the files, we need to commit them in git ---&gt;</p>
<p> &lt;cfscript&gt;  </p>
<p>     // first of we set the command to call  </p>
<p>     cmd1 = "git add TODO.txt";  </p>
<p>     cmd2 = "git commit -m 'autobackup'";</p>
<p>     // the environment variable is empty  </p>
<p>     envp = arraynew(1);  </p>
<p>     // and we want to run from a given "root"  </p>
<p>     path = "/Volumes/iDisk/Documents/TODO";  </p>
<p>     dir = createobject("java", "java.io.File").init(path);  </p>
<p>     // get the java runtime object  </p>
<p>     rt = createobject("java", "java.lang.Runtime").getRuntime();  </p>
<p>     // and make the exec call to run the command  </p>
<p><span style="white-space: pre;">	</span>rt.exec(cmd1, envp, dir);</p>
<p><span style="white-space: pre;">	</span>rt.exec(cmd2, envp, dir);  </p>
<p> &lt;/cfscript&gt;</p>
<p>And that's it. Every time the file is changed, it is added to my git repo locally. Handy!</p>
<p> </p>