---
title: Saving Railo Configurations
layout: post
categories: how-to,vagrant,railo
permalink: saving-railo-configurations
---
Following from the previous post [Easy Railo App Development with Vagrant](http://blog.cmdbase.io/easy-railo-development-with-vagrant/) I want to touch on what gets deployed and committed in our repository for Vagrant deployments. 

Currently the `demosite` folder looks like this:

	Vagrantfile
	bootstrap.sh
	configs/
    	server.xml
	webroot/
    	index.cfm
    	WEB-INF/
        
Railo so far hasn't been configured as I have only run index.cfm so if I go to the [Railo Web Administrator](http://192.168.33.10:8080/railo-context/admin/web.cfm) I get the "New Password" dialog. Of course we don't want this going live like this and we want to save it in our repository maybe?

###1. Check in our code
Before I go further, I want to check in our code to git (hey that is how we share things round here!), so I do:

	> git init
    > echo ".vagrant" > .gitignore
    > git add .
    > git status
    
We see that all the important files have been added...

	new file:   .gitignore
	new file:   Vagrantfile
	new file:   bootstrap.sh
	new file:   configs/server.xml
	new file:   webroot/index.cfm
  
EXCEPT, where is the `WEB-INF` which is basically all of our Railo configuration?! Git ignores `WEB-INF` directories, but I don't want that in this case. I want Git to also have my Railo configuration, since it is now part of my whole application:

	> git add -f  webroot/WEB-INF/web.xml 
	> git add -f webroot/WEB-INF/railo/railo-web.xml.cfm 
	> git add -f webroot/WEB-INF/lib/*.jar
    > git add -f webroot/WEB-INF/lib/railo-server/context/railo-server.xml

Since WEB-INF is an ignored folder by git, you have to use the `-f` option to forcefully add these files. 

1. **web.xml**: that configures this as a Java Web applciation with the Railo Servlet (here you can also configure REST servlets and Flex servlets)
2. **railo/railo-web.xml.cfm**: this is where the Railo *WEB* Administration cofiguration goes. We haven't changed anything yet, so let's just check it in
3. **lib/*.jar** All the Jar files that Railo needs are stored here. I am ignoring everyhing else as I want to explicitly add the final config file...
4. **lib/railo-server/context/railo-server.xml** this is where any changes to the railo server configuration are stored. 

Finally we can check it all in:

	>git commit -m "Initial Commit"
    
###2.Chicken/Egg problem
There is currently a problem with this setup. Now that we have it all checked in. Let's pretend we are Bob. Bob is another developer and we are going get him to check out the project:

	> cd ..
    > git clone file://demosite demosite2
    > cd demosite2
    > vagrant up
 
That would essentially check out our repo again to `demosite2/` and then we would try and use `vagrant up` to get our develoment environment to run, but as you see there will be a big old error:
<pre>
Failed to mount folders in Linux guest. This is usually because
the "vboxsf" file system is not available. Please verify that
the guest additions are properly installed in the guest and
can work properly. The command attempted was:

mount -t vboxsf -o uid=`id -u tomcat7`,gid=`getent group vagrant | cut -d: -f3` sites_webroot /sites/webroot
mount -t vboxsf -o uid=`id -u tomcat7`,gid=`id -g vagrant` sites_webroot /sites/webroot
</pre>
  
 Despite the messages that vboxsf is not available, etc, the actual reason is that the user we are trying to share the `webroot` folder, `tomcat7` doesn't exist yet since the `bootstrap.sh` file hasn't run yet, and therfore that user doesn't exist! 
 
 GAH. 
 
 The only way I have (currently) come up with solving this is to comment out the mapping from the `Vagrantfile`, reloading vagrant, thus installing tomcat and the related `tomcat7` user, and then, uncommenting the line. 
 
     Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.vm.box = "hashicorp/precise32"
      config.vm.provision :shell, path: "bootstrap.sh"
      config.vm.network "private_network", ip: "192.168.33.10"
    #  config.vm.synced_folder "webroot/", "/sites/webroot", owner: "tomcat7"
    end

We restart vagrant with `vagrant reload --provision` and now that tomcat is installed we can uncomment the line and reload vagrant and it should mount perfectly.

	    default: /sites/webroot => /Users/markdrew/Sites/demosite2/webroot

###3. Check Tomcat Exists
This is great, but there is something untidy in the next startup:

	==> default: tomcat7 is already the newest version.

This is saying that we are trying to install tomcat *again*. We should  check if tomcat is installed, if not, install it and THEN pass any configs. The way I do this is to check if the `/etc/tomcat7` folder exists in my `bootstrap.sh` file:

    if [ ! -d "/etc/tomcat7" ]
        then
            sudo apt-get -y update
            sudo apt-get -y install tomcat7	
    fi
    cp /vagrant/configs/server.xml /etc/tomcat7/server.xml
    sudo service tomcat7 restart

That is better!
###4. Back to the Railo configs
Now that we have it all running, let's see what has happened to our files. If you hit  http://192.168.33.10:8080/railo-context/admin/web.cfm hopefully you will see the admin. Don't add a password yet. 

Let's see what has happened, do a `git status` and you will see that a couple of files are now modified:

	modified:   bootstrap.sh
	modified:   webroot/WEB-INF/railo/railo-web.xml.cfm
    
We know about bootstrap.sh, since we added the tomcat check. But what changed in the `railo-web.xml.cfm`?   
By running `git diff webroot/WEB-INF/railo/railo-web.xml.cfm` we can see the following diff:

     -<?xml version="1.0" encoding="UTF-8"?><railo-configuration version="2.0">
    +<?xml version="1.0" encoding="UTF-8"?><railo-configuration version="4.2">
	...
So the file has been updated! Let's put in a password in the web admin and do another `git diff webroot/WEB-INF/railo/railo-web.xml.cfm`:

	-<?xml version="1.0" encoding="UTF-8"?><railo-configuration version="2.0">
	+<?xml version="1.0" encoding="UTF-8"?><railo-configuration pw="f76d0a6..." version="4.2"><cfabort/>
    
What happens if we add a server admin password in http://192.168.33.10:8080/railo-context/admin/server.cfm and then we do a `git status`?:

	modified:   webroot/WEB-INF/lib/railo-server/context/railo-server.xml
	modified:   webroot/WEB-INF/railo/railo-web.xml.cfm
    
If we now look what has changed `git diff webroot/WEB-INF/lib/railo-server/context/railo-server.xml`:    

	---><railo-configuration version="4.2">
	+--><railo-configuration pw="f76d0a69..." version="4.2"><cfabort/>
    
OK! Now we can commit these two,

	> git add *
	> git commit -m 'adding passwords'

knowing that the password will be the same for everyone! 
###5. How about extensions?
Railo configurations are not only passwords and settings that are stored in the xml files. They are also extensions that can be jar files, cfm files and settings. One extension I use a lot is the [MongoDB extension](http://www.getrailo.org/index.cfm/extensions/browse-extensions/mongodb-beta/). 

A good way to see what we would have to check in is to install the extension. But before we do this, let's check in a few more folders (we don't want all of them) 

    git add -f webroot/WEB-INF/lib/railo-server/patches/
    git add -f webroot/WEB-INF/lib/railo-server/context/deploy/
    git add -f webroot/WEB-INF/lib/railo-server/context/extensions/
    git add -f webroot/WEB-INF/lib/railo-server/context/lib
    git add -f webroot/WEB-INF/lib/railo-server/context/library/
    git commit -m 'adding railo server folders'

The previous folders are required by the Railo admin, the rest can be generated but I want to keep these as part of our projects. The purpose of each is:

1. `patches/` : This has the exact Railo version that we are running. If we upgrade we can then commit the .rc files that are in there and make railo the most up to date version.
2. `deploy/` : if you have a .re file you can just drop it in here and it will get auto deployed. This is a hidden feature in Railo I believe. 
3. `extensions/`: as you might gather, this is where the original extenion file gets placed so that it can be uninstalled. 
4. `lib/`: This is where any extra jar files will be placed and is available for all contexts. 
5. `library/`: This is where the BIF (Built in Functions) and BIT (Built in tags). You can create your own and place them in here to be available as top level tags/functions instead of custom tags. 

Now that we have added the folders, we can go head and install the MongoDB extension.

I wont details step by step but basically go to the Railo Server Admin and select the Applications section and install it from there.

Once you have installed it you can do a `git status` and you will see the follwing:

	new file:   webroot/WEB-INF/lib/railo-server/context/extensions/0A85D4B22CA71014F45EAA2AE997E0B8/0.4.rep
	new file:   webroot/WEB-INF/lib/railo-server/context/lib/mongo-2.10.1.jar
	new file:   webroot/WEB-INF/lib/railo-server/context/lib/railo-mongodb-v04.jar
	new file:   webroot/WEB-INF/lib/railo-server/context/library/fld/mongodb.fld

    modified:   webroot/WEB-INF/lib/railo-server/context/railo-server.xml

	Untracked files:
    webroot/test-mongodb.cfm

Now you are tracking those folders, you can see all the files that make up the MongoDB extension. We can now add these (I delete the `test-mongodb.cfm` usually since it's just an example) to the repository and deploy it to other developers.

This has been a fairly long post and even though it seems to be Railo specific, I think this can go for a lot of other web apps (such as ColdFusion) if you treat them as part of the repository.