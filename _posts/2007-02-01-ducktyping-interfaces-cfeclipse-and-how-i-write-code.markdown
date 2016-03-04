---
layout: post
title:  "DuckTyping, Interfaces, CFEclipse,  and how I write code"
uid:	"8A99ADC0-F62B-5033-7752B6F5EEC6AA84"
date:   2007-02-01 11:07 AM +0000
categories: coldfusion
permalink: ducktyping-interfaces-cfeclipse-and-how-i-write-code
---
My previous post about CFEclipse and DuckTyping got me thinking about how I develop applications.

In a couple of systems I have written, I create a number of services. What do I mean by this? Well, a service (in my terminology, I am not CS graduate, just an old hacker) in my code is a single component (singleton) that returns objects (such as pages, products, users, you get the idea). 

So for example, lets take a simple PageService:
<code>
	<cfcomponent displayname="PageService" output="false">
		<cffunction name="getPage" returntype="any">
			<cfargument name="pageid" required="false">
				... some code ...

			<cfreturn pageObject />
		</cffunction>
	</cfcomponent>
</code>

This component returns my pages which is all fine, but lets say, I am going to change the way I get pages (for some crazy reason) and instead of using a database, I want to use a file based storage, or an XML file. Instead of changing it, I create a couple more services:
<ul>
	<li>XMLPageService: gets pages from XML</li>
	<li>DBPageService: gets pages from a Database (my original service)</li>
	<li>FilePageService: gets pages from a FileSystem</li>
</ul>

Now, how do I instantiate these services? Well, I create a <em>PageServiceFactory</em>. The PageServiceFactory's role is to get me the right type PageService, with a function such as:
<code>
	<cffunction name="getPageService" returntype="Any">
		<cfargument name="servicetype" hint="type can be:db,xml or file">
			<cfswitch expression="arguments.servicetype">
				<cfcase value="db">
					<cfreturn getDBPageService() />
				</cfcase>
				<cfcase value="xml">
					<cfreturn getXMLPageService() />
				</cfcase>
				<cfcase value="file">
					<cfreturn getFilePageService() />
				</cfcase>
				<cfdefaultcase>
					<cfthrow message="unknown page service requested">
				</cfdefaultcase>
			</cfswitch>
		</cffunction>
</code>

This is a great example of DuckTyping for programming and not just the for ( the celebrity harlot which is) performance since, when I do my call, in my controller I call the Factory asking for a Page as follows:
<code>
	<cfset myPage = PageServiceFactory.getPageService('db').getPage("some page")>
	<cfset title = myPage.getTitle()>
	<cfset content = myPage.getContent()>
</code>

I am able to call the same method on each service even though the service type can change.

One of the requirements for duck typing to work in your code is that all the methods that you would expect to be there, ARE there (otherwise you get a function not found exception). You would have to either very rigorously test your code or setup unit tests that all of the PageServices have to pass.

In Java, you can define an interface that all the PageServices comply with,  basically the interface is a contract that the PageServices must follow with the functions and arguments that they have. Most java IDE's and editors, whilst you write your class, will alert you that you are not conforming to this contract and provide ways to overcome this.

This kind of functionality I would love to put in CFEclipse, if ColdFusion had interfaces.

How would the code change? The <em>getPageService</em> function in my Factory would then have a returntype of "IPageService", which would be my Interface, defining what functions all my PageService's have. In CFEclipse, whilst you are writing a new PageService, you would say it implements the "IPageService" interface. If you missed out any functions, CFEclipse would warn you that your new Service is not compatible, all before you have even saved the file.

Now you could have function insight when you type "getPageService("db")". This wouldn't be DuckTyping anymore, of course, but it would definitely remove a lot of the architectural mistakes that you could do in your application.

Or have I missed something?