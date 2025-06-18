---
layout: post
title:  "Sending complex objects through webservices using ColdFusion"
uid:	"8A9AE4D2-FE50-B8A9-B8366361AEE70323"

categories: coldfusion,webdev,eclipse
permalink: sending-complex-objects-through-webservices-using-coldfusion
---
Title: Sending complex objects through webservices using ColdFusion

Using web servies with ColdFusion is pretty simple most of the time, you create a webservice object and then call the methods on that object, for example:
<code>
	<cfset ws = CreateObject("webservice", "http://localhost/someservice/?wsdl")>
	<cfset aResults =  ws.doSearch("find something")>
</code>

This is all fine and dandy if you have to pass a simple string or many other things, but what happens if, as I am having to do at the moment, you need to call a method that takes an object as a parameter? Sometimes, looking at the WSDL of the webserive isn't enough to tell you how to create an object to send to the webservice.

First of, a simple way of creating an object is with a struct, so if you had to send an parameter (lets say, SearchQueryTO) you can create it as follows:

<code>
	searchQuery = StructNew();
	searchQuery.params = "find Something";
	searchQuery.resultCount = "10";
	//Do a search with the object...
	results = ws.doSearch(searchQuery);
</code>

The searchQuery struct above now gets automagically translated into the SearchQuery object that the webservice requires, all fine so far, but recently I got stuck with trying to pass some data back to a webservice. The WSDL said that it was an array of SearchCriteriaTO's but no matter what I did (create Arrays etc) it wouldn't accept it.

In the ColdFusion server, all webservice calls generate java classes or "stubs" using a little Apache Axis library called wsdl2Java (imaginative eh), these stubbs are what you are actually calling from your code to connect to the webservice, since I didn't know EXACTLY what I had to call, you can do the following: 
<ul>
	<li>Zip up the stubbs for your service, they are held in <ColdFusion8Root>/stubs/ and there will be a "WSxxxxxxx" folder where the x's are a number. Delete them all and make a call to your miscreant webservice to see the folder generated for the stubbs</li>
	<li>In Eclipse, create a new Java Project, you wont be doing any actual java but it just will help so that you can import the zipped stub folder</li>
	<li>Right click on the project, and select Java Build Path</li>
	<li>Click on the Libraries tab and select "Add External Jars..." and select the zip that you created of your stubs and click ok</li>
	<li>In your project you should now expand the "Referenced Libraries" node and you will see all the java classes that make up your webservice</li>
	
</ul>


The problem I had was that I didn't know, even from the WSDL, how I was meant to send the array of objects, well, in my webservice, it had generated a ArrayofSearchCriteriaTO class,  which had a "searchCriteriaTO" property that was an array, therefore I had to first create the ArrayofSearchCriteriaTO and then put all the search criterias into the property:

<code>
	//create the array that we will pass
	ArrayOfSearchCriteriaTO = StructNew();
	ArrayOfSearchCriteriaTO['searchCriteriaTO'] = ArrayNew(1);
	
	//create the objects that we will put into the array
	sc = StructNew();
	sc['attributeName'] = "name";
	sc['stringValue'] = "some value";
	

</code>

You notice that I used the ['property'] to create the keys in the array, I did this to be sure that the keys would retain their case, of course this is not essential, but I was just trying to make sure that I was hitting the right properties (since java is case sensitive).