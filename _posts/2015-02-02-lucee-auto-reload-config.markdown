---
title: Lucee hidden feature - Auto reloading of the config
layout: post
permalink: lucee-auto-reload-config
---
A nice feature of [Lucee](http://luc.ee) that I found out this week from the Lucee team was the ability for a server (or a context) to automatically check the configuration file for changes and then reload them if they have changed. 

This is super useful if you are doing scripted deploys and/or synchronization from, for example a master instance to many slave instances of Lucee. 

###Check for Changes in ALL the contexts
To enable this for a whole Lucee server find lucee server xml file in :

	<Lucee Install Dir>/lib/ext/lucee-server/context/lucee-server.xml
	
At the top of this file you should see something along the lines of:

	<cfLuceeConfiguration hspw="xxx" salt="xx" version="4.2">
	
Now it's simple to add the following:

	<cfLuceeConfiguration hspw="xxx" salt="xx" check-for-changes="true" version="4.2">
	

Now that you have made the change you can either restart Lucee server from the administrator in:

	http://localhost:8888/lucee/admin/server.cfm?action=services.restart

Or actually make any change in the Server admin for the configuration to be picked up. This should now allow it to pick up any changes you have written to the lucee-server.xml file. 

###Check for changes in an individual context
If you only want an individual context to check for changes, you can do the same configuration but you would have to go to:

	<Site Root>/WEB-INF/lucee/lucee-web.xml.cfm
    
And and the same changes from above:

	<cfLuceeConfiguration hspw="xxx" salt="xx" check-for-changes="true" version="4.2">
    
Lucee will now check for any changes in the lucee config files every minute and if there is a change, reload it and enable those changes. 

A very handy little feature for those automated deployments! 


(Update: this feature has been added to the [Lucee Wiki](https://bitbucket.org/lucee/lucee/wiki/tips_and_tricks_Check_for_changes). If you have good tips, why not add them to the wiki too?)