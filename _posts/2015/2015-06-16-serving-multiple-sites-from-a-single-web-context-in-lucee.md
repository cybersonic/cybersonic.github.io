---
title: Serving multiple sites from a single web context in Lucee
layout: post
categories: 
permalink: serving-multiple-sites-from-a-single-web-context-in-lucee
---
Lucee has a great feature in the ability to separate each domain into it's own context. This allows you to set up individual settings for security, datasources, mappings, and in fact, anything set in the admin can be different for each domain. 

But what happens if you have 100 or 1000's of domains that you are serving from one instance of Lucee? There are (currently) two options for this:

1. Define all the contexts in the servlet container, in this case tomcat, and adding Host and Context entries for every domain such as:

		<Host name="mydomain1.com" appBase="webapps">
	  		<Context path="" docBase="/www/mydomain1/" />
	    </Host>
	   	<Host name="mydomain2.com" appBase="webapps">
		  	<Context path="" docBase="/www/mydomain2/" />
	    </Host>
	    ...
        
2. Use [mod_cfml](http://www.modcfml.org/) to handle the creation of your contexts automatically from the Apache definitions with the use of a Perl module and a Tomcat Valve

This can work great with one downside. You are kind of limited with the number of sites you can run. This is because each context takes *some* memory to create. But what if you have a bunch of applications that are similar and in effect don't need *any* differences to be made and can run from their own settings in the Application.cfc? 

Thanks to a post from [Nando Breiter](https://groups.google.com/forum/#!msg/lucee/UxesHxE6Ocg/GTLpf1LZ9RQJ) in the Lucee mailing list got me thinking and there is a way to run multiple applications, using one Lucee web context:

* Create a Context within the default Tomcat Host
* Proxy requests to sub folders of the Context
* Set your "/" mapping per application using the root directory

Let's get started:

### Create a Context within the default Tomcat Host
If you have installed Lucee from the default installer (or even if not) you will have a version of tomcat installed and in a path similar to `/opt/lucee/tomcat/conf` you are likely to find the `server.xml` file. In here you can see the default Host setting such as:

	<Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="true">
       ...
    </Host>
What this does is basically point to the `tomcat/webroot/ROOT` as the main location of all files. So if you go to http://localhost:8080 this is the default root. It is also where all the web-apps are installed. We need to change this to :

	<Host name="localhost"  appBase="webapps"
            unpackWARs="true" autoDeploy="true">
            <Context path="" docBase="/www/domains/" />
       ...
    </Host>
   
   This now points to the path where ALL our domains are going to live (`/www/domains/`) and will create a `WEB-INF` folder under this path. Under this path is where we will add our first domain, for example: `/www/domains/cmdbase_io/`. 
   
###Proxy the request for the domains to this folder
We need to point all requests to our domain http://cmdbase.io to `/www/domains/cmdbase_io` but more importantly, we need to proxy the request so that Tomcat will handle it. In reality this url http://cmdbase.io/index.cfm will actually be pointing to http://localhost:8080/cmdbase_io/index.cfm, so what we need is a mod_proxy and mod_proxy_ajp to be instlaled or enabled and a VirtualHost definition as follows:

 
    <VirtualHost *:80>
        ServerName cmdnase.io
        DocumentRoot /www/domains/cmdbase_io/
        <Proxy *>
        Allow from 127.0.0.1
        </Proxy>
        ProxyPreserveHost On
        ProxyPassMatch ^/(.+\.cf[cm])(/.*)?$ ajp://127.0.0.1:8080/cmdbase_io/$1$2
    </VirtualHost>
    
Now if you were to call http://cmdbase.io/index.cfm the request would get proxied to what Tomcat thinks is `ajp://127.0.0.1:8080/cmdbase_io/index.cfm`
Non-CFML files are served directly by apache from the `/www/domains/cmdbase_io/` path too. 

###Set your "/" mapping per application using the root directory
One problem with this is that your Lucee application will now not be able to find components, or include files if you are looking for them in the root, since now the root for your site is higher up than usual. So you need to create a per application mapping to the current folder. In your Application.cfc all you need to do is:

    component output="false" {
      this.mappings['/'] = GetDirectoryFromPath( GetCurrentTemplatePath());
    }
 
Now if you go looking for your components or include files in `/` you will be able to find them as usual!