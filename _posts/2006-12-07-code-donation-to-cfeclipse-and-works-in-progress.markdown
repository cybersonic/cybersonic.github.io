---
layout: post
title:  "Code donation to CFEclipse and works in progress"
date:   2006-12-07 11:06 AM +0000
categories: cfeclipse
---
I thought I would update people on what has been happening in the world of CFEclipse:
<ul>
	<li>
		From a suggestion by <a href="http://ray.camdenfamily.com/">Ray Camden</a>, I asked <a href="http://www.mikenimer.com">Mike Nimer</a> if he would like to donate his <a href="http://www.mikenimer.com/eclipse/logviewer/index.cfm">Log Viewer</a> plugin code to the CFEclipse project, he has happily agreed and thus a new feature will be added to the beta in the next few days.

	</li>
 	<li><a href="http://rbdev.net/devblog/">Robert Blackburn</a> has contributed code to create Unit Tests. You can choose between CFUnit and CFCUnit as your base extension and currently it implements the default methods as well as a sample method to get you going. We shall be working on this functionality more so that it provides a bit more of the code you require.

</li>
	<li><a href="http://www.creative-restraint.co.uk/blog/index.cfm">Andy Allan</a> has been helping out with the design of the new site. This is ongoing and hopefully by the new year <a href="http://www.cfeclipse.org/">cfeclipse.org</a> will be re-designed and re-deployed in the new year adding, apart from a new look, a whole new bunch of easy to get to documentation and marketing messages (so you can point your boss to the site and say why you would want to use CFEclipse!)

</li>
	<li>
		<a href="http://www.thecrumb.com/">Jim Priest</a> has been working on a nice printable cheat sheet for CFEclipse, this should be available in the next few days when I get to style and print nicely!

	</li>

	<li>
		<a href="http://www.andyjarrett.co.uk/">Andy Jarett</a> has also been helping me on the server side part of a new feature I am working on (which will be available in the 1.4 release next year, if not sooner). 

	</li>
	
	<li>
		I have been working on the new update site. This means that your old CFEclipse 1.2 version needs to be removed manually (we changed the package name from com.rohanclan to org.cfeclipse) if you would like to update to 1.2.1 which is a fix in CFEclipse 1.2 (i.e. the old release) to work with the RDS plugins and Flex installations. This fix was provided by Dean Harmon and you can read more about it <a href="http://www.cfreport.org/index.cfm/2006/10/12/CFEclipse-13-Beta-and-FlexBuilder">on his blog</a>.
		The new update site now carries CFEclipse 1.2.1 (stable) and CFEclipse 1.2.9.5 Beta, but I just need to make sure that a few things are removed from the beta so its all working nice (all works fine, its just some new features that I need to check are up to date) and you can check it out at <a href="http://www.cfeclipse.org/betaupdate">http://www.cfeclipse.org/betaupdate</a> using Eclipse's update manager.


	</li>
	
	<li>
		For future versions of CFEclipse we are splitting out some of the code into individual projects for better manageability. <a href="http://www.edomgroup.com/blog/index.cfm">Mike Kelp</a> has been working on making the Parser (the thing that actually reads your CFML and checks whether it is valid or not) as a standalone library. This *could* mean that we can put the jar on a website, and people submit test cases where it is going wrong and we can just fix the parser (for example) and run it against a whole bunch of cfml code to test if it is parsing correctly.

	</li>
	<li>
		<a href="http://coolskool.blog-city.com/">Kola Oyedeji</a> has finally given in and agreed to help me out with bugs to CFEclipse and is currently busy tucking into some crazy code for the Edit this tag functionality (I think we all wish him the best of luck eh?)

	</li>
<li>
Also honorable mentions should go to Chris Hoper from <a href="http://www.designuk.com/">DesignUK for</a> re-designing the CFEclipse logo (more to come on this soon!)

</li>
</ul>

As you can see, there has been a number of people working hard for the project in different areas, if I have missed anyone out, let me know! I am writing this pre-coffee and my mind isnt what it used to be!

There will be some more updates, I am just trying to get the code nice and comfortable and bedded down right now.

EDIT: a couple more honorable mentions should go to <a href="http://blog.cutterscrossing.com/index.cfm">Cutter "Ohhh Sharp!" Blades</a> for some Top Secret work and to Tracy Logan for his fixing of the CFC Wizard! (see, coffee kicked in and the brain started working again!)