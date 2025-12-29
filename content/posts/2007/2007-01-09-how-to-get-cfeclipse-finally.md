---
layout: post
title:  "How to get CFEclipse (finally!)"
uid:	"8A996936-A4DE-6E14-DADDC730E01E4D17"

categories: cfeclipse
permalink: how-to-get-cfeclipse-finally
---
There has been some confusion (which both myself and the CFEclipse site haven't really help clarify) recently about where to get both the stable and latest versions of CFEclipse. This has been for a number of admin reasons as well as some technical ones.

So, going forward there will be 2 ways of getting CFEclipse, and both of these are through Eclipse's Software Update feature. 

To use this, do the following:
<ol>
	<li>In Eclipse, go to Help -> Software Updates -> Find and Install...</li>
	<li>select "Search for new features to install" and click <em>Next &gt;</em></li>
	<li>Click on New Remote site</li>
	<li>Enter <em>CFEclipse</em> as the Name and either of the addresses below for which update site you wish to use</li>
</ol>

The two addresses that you can use for the update sites are:

<ul>
	<li>For major releases: http://www.cfeclipse.org/update </li>
	<li>For the latest version: http://www.cfeclipse.org/betaupdate </li>
</ul>

To clarify, the best version I would say is to use the latest versions (beta) as they will have more bugs fixed etc. The major release version (currently 1.2.1) will be upgraded to 1.3 when we have fixed all the bugs in <a href="http://trac.cfeclipse.org/cfeclipse/query?status=new&amp;status=assigned&amp;status=reopened&amp;milestone=1.3+Beta+2">http://trac.cfeclipse.org</a>  (by the way, wanna contribute? help me fix these bugs!), and then will only get updated if there is a major fix. 

We wont have nightly builds as zips that you can download as we are changing how the project is built and there would be a number of folders to deploy to plugins and features directories (and I dont want to be repeating myself all the time on how to install it)

I hope that helps clear up how to get CFEclipse, we are populating the new website at the moment and should be going live fairly soon (?)