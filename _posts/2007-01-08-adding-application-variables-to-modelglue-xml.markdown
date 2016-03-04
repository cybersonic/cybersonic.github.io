---
layout: post
title:  "Adding application variables to ModelGlue.xml"
uid:	"8A99681D-B786-9B5A-001D4DA3B3AEB4A3"
date:   2007-01-08 11:07 AM +0000
categories: model-glue,coldfusion
permalink: adding-application-variables-to-modelglue-xml
---
Continuing from my <a href="http://www.markdrew.co.uk/blog/index.cfm/2007/1/8/Adding-event-variables-to-ModelGluexml">previous post</a>, you might also want to add some application variables that you can access in your views easily.

To start with, ModelGlue comes with a generic bean that you can use to setup some values without having to create your own beans. You set this in the Coldspring.xml file and in this example, I am going to add some site wide information, such as a copyright value that will go in the footer.


<code>
	<bean id="copyrightConfig" class="ModelGlue.Bean.CommonBeans.SimpleConfig">
		<property name="config">
			<map>
				<entry key="year">
					<value>2007</value>
				</entry>
				<entry key="company">
					<value>Mark Drew Inc. PLC. SA. PTY. Ltd.</value>
				</entry>
				<entry key="link">
					<value>http://www.markdrew.co.uk</value>
				</entry>
				
			</map>
		</property>
	</bean>
</code>

What we have done here is set up an object called <em>copyrightConfig</em> with some values in it. The &lt;map&gt; item is actually setting up a structure. 

Now that we have a bean with our application wide configuration settings, we would like to put them available to all the views via the ViewState object. To do this, in the default controller we add code to the <em>onRequestStart</em> function to load our bean and put it in the ViewState:

<code>
 	<cfset stConfig = getModelGlue().getBean("copyrightConfig").getConfig() />
	<cfloop collection="#stConfig#" item="conf">
		<cfset arguments.event.setValue("copyright_" & conf, stConfig[conf])>
	</cfloop>	
	
</code>

The first line gets the copyrightConfig bean's config structure (remember those values we added to the &lt;map&gt;?), then we loop through the keys in the structure (adding  "copyright_" to the start, just so we know what they are) adding them to the event object. Later on in the view, we have available in the viewState the values as follows:

<code>
	<div id="footer">
		Copyright &copyright; #ViewState.getValue("copyright_year")# <a href="#ViewState.getValue("copyright_link")# ">#ViewState.getValue("copyright_company")# </a>
	</div>
	
</code>

If you don't like adding the "copyright_" to each of the values you could add the configuration structure to the the copyright key:

<code>
	<cfset arguments.event.setValue("copyright", getModelGlue().getBean("copyrightConfig").getConfig())>
</code> 

And then access the items as follows:

<code>
	<cfset stCopyright =  ViewState.getValue("copyright")>
	<div id="footer">
		Copyright &copyright; #stCopyright.year# <a href="#stCopyright.link# ">#stCopyright.company# </a>
	</div>
</code>

the only thing is that by accessing the values like this, you are taking away the in-built help that the ViewState.getValue() function gives you that if the value doesn't exist, it doesn't barf.