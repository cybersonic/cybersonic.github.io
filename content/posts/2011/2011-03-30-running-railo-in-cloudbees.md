---
layout: post
title:  "Running Railo in CloudBees"
uid:	"489DBB39-772F-4D09-9C57E3B8D6F5F916"

categories: railo,getrailo,cloudbees
permalink: running-railo-in-cloudbees
---
<p>
<img src="http://www.markdrew.co.uk/blog/enclosures/CloudBees.png" align="left" hspace="10">A while ago I was playing with the Stax.net deployment system, since then they have been bought by <a href="http://cloudbees.com/" title="CloudBees: Cloud Platform as a Service for Java Web Apps, Supported Jenkins/Hudson and Jenkins/Hudson in the Cloud">CloudBees</a>, a Platform as a Service for Java Web Apps and I wanted to see how easy it was to run Railo on it. 
</p>

<p>
	One of the advantages of running Railo in CloudBees (apart from scaling and versioning) is the ability to deploy incremental changes, rather than having to deploy the whole WAR as you have to do with AWS's BeanStalk. In this post I shall go through how to get a sample application running. 
</p>


<p>
<strong>Requirements</strong><br>
Before we get started we need to do the following:
	<ul>
		<li>Sign up for an account at CloudBees: <a href="https://grandcentral.cloudbees.com/account/signup">https://grandcentral.cloudbees.com/account/signup</a></li>
		<li>Download the CloudBees SDK and install it: <a href="https://cloudbees.zendesk.com/entries/414109-cloudbees-sdk">https://cloudbees.zendesk.com/entries/414109-cloudbees-sdk</a></li>
		<li>Download Railo as a WAR: <a href="http://www.getrailo.org/index.cfm/download/" title="Download the fastest Open Source CFML server!">http://www.getrailo.org/index.cfm/download/</a></li>
	</ul>

</p>

<p>
	Once you have setup the CloudBees SDK as they have mentioned, you need to setup your API and Secret Keys, to do this you can go get your keys from your <a href="https://grandcentral.cloudbees.com/user/keys">account page</a>, and add them to the file that should have been created (if you are using OSX or a Linux OS ) in:
	
<p>
<code>
~/.bees/bees.conifg
</code>
</p>	
</p>

<p>
	Now that we have all that installed, let's go create a simple app through the CloudBees web interface, I have named my application "railo" (surprise, surprise!).

	<br>
	Once it has been created, click on the configure button so that you can get the ID of the application, in my case it is "markdrew/railo".
</p>

<p>
	Now we have that application, we can go and download it, go to the folder you want to download the application to in the command line/terminal and type the following:
	<br>
<p>
<code>
> mkdir markdrew_railo
> cd markdrew_railo
> bees getapp -a markdrew/railo
</code>
	
</p>	
	<br>
	
	That was easy, if you setup your API and Secret keys you should get some XML and some other commands appearing and it should all be downloaded. Let's run it before adding Railo to the mix:
	<br>
<p>
<code>
> bees run
</code>
</p>
	<br>
	After a few seconds you can head to <a href="http://localhost:8080/">http://localhost:8080/</a> and get something that looks like the following:
	<br>
	<a href="http://www.markdrew.co.uk//blog/enclosures/cb_inital_run.png"><img src="http://www.markdrew.co.uk//blog/enclosures/cb_inital_run_thmb.png"></a>
	
</p>

<p>
	Now to add Railo to our application. You can stop the application by pressing Ctrl + C, and then rename the railo-3.2.2.000.war to railo-3.2.2.000.zip and uncompress it:
	<br>
<p>
<code>
> mv railo-3.2.2.000.war railo-3.2.2.000.zip
> unzip -d railo railo-3.2.2.000.zip
</code>
</p>	
	<br>
	Now that we have unzipped the WAR file into the railo directory we can copy the contents from the railo/ directory to the markdrew_railo/webapp directory.
	<br>
<p>
<code>
> cp -r railo/ markdrew_railo/webapp/
</code>
</p>		
</p>

<p>
	To test this, we can run the "bees run" command again and after a while you can test your application at <a href="http://localhost:8080/">http://localhost:8080/</a>, you should get the Railo start page! Awesome! 
	<br> Stop the application using Ctrl + C and let's clean out some files that are left over that we don't need:
	<br>
<p>
<code>
> rm -r webapp/WEB-INF/classes/
> rm webapp/index.jsp	
</code>
</p>

<p>
	Now that we have cleaned it up and tested it , let's go ahead and deploy it. This is as simple as typing:
	<br>
<p>
<code>
> bees deploy
</code>
</p>		
	The upload will take a while since it will upload something like 55Mb as our initial upload. Once this is done you should be able to check out your application live at the url defined in your configuration, mine is: <a href="http://railo.markdrew.cloudbees.net/">http://railo.markdrew.cloudbees.net/</a>
</p>

<p>
	Let's change the default homepage, so that we can see how much it has to upload next time. Change the contents of index.cfm to just display the current time:
	<br>
<p>
<code>
<!DOCTYPE html>
<html>
<head>
    <title>Changed!</title>
</head>
   <body id="documentation" class="twoCol">
	<cfoutput>
		#Now()#
	</cfoutput>
   </body>
</html>
</code>
</p>	
	<br>
	
	This time when we run the "bees deploy" command you should see that it has very quickly uploaded the changes and they should be live, without having to re-deploy the whole thing! Awesome! This is a massive advantage over AWS Beanstalk, that where small changes would require of a total re-deploy of your application. 
</p>