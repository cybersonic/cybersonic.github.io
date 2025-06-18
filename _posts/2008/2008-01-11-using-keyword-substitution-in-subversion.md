---
layout: post
title:  "Using keyword substitution in Subversion"
uid:	"8A9B1A0A-E308-A193-1CAC337B5011856A"

categories: webdev,eclipse
permalink: using-keyword-substitution-in-subversion
---
When I previously used CVS, I was able to put in my code some keywords that I wanted to substitue, such as the checkin date, who had checked it in, which version it was etc. 

I have had a hell of a time finding out how to do this in Subversion (SVN). Thanks to a link sent to me by <a href="http://rachaelandtom.info/blog/3">Tom Chiverton</a>, I managed to figure out how to do it via Eclipse.

First of, read the manual, especially the <a href="http://svnbook.red-bean.com/en/1.1/ch07s02.html#svn-ch-7-sect-2.3.4">svn:keywords</a> section.

So, lets say I want to put the following in my headers:
<code>
Author: $Author$
Date: $Date$
Revision: $Revision$
</code>

So in CFEclipse/Eclipse enter that in a file and check it in to your repository, nothing happens right?

No changes to the file happen, we must first set the properties for that file (or group of files):

1. Right click on your file and do Team -> Set Property

2. Select the "svn:keywords" property from the drop down 

3. In the text area add (without the quotes) "Date Author Revision"

4. Check in the file and reload when it asks if you want to reload the file (since SVN has changed it)

TADDA!!!

Your file should look like this now:

<code>
Author: $Author: mark.drew $
Date: $Date: 2008-01-11 15:03:22 +0000 (Fri, 11 Jan 2008) $
Revision: $Revision: 2076 $

</code>

I hope that helps!