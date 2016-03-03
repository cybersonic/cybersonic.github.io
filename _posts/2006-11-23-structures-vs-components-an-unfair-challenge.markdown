---
layout: post
title:  "Structures vs Components, an unfair challenge?"
uid:	"8A99566A-93EC-D300-310CFB4902307DB9"
date:   2006-11-23 11:06 AM +0000
categories: coldfusion
---
A post over in the cf-talk list mentioned that using CreateObject was a lot slower than native datatypes in Coldfusion, well of course it is I thought, but I wanted to see HOW slow they compare, and what the difference would be between them.

So to this aid I did a script that looped, creating objects and timing it, in steps of 50 up to 2000 objects. The code to measure this is as follows:

<code>
	<!--- on the first round this file doesnt exist --->
	<cfif fileExists(expandpath("createObject.log"))>
	<cffile action="delete" file="#expandpath("createObject.log")#">
	</cfif>
	
	<!--- lets loop this crazyness--->
	<cfloop from="0" to="2000" index="x" step="50">
		
		<!--- arrays to fill--->
		<cfset stArray = ArrayNew(1)>
		<cfset oArray = ArrayNew(1)>
		
		<!--- create a struct --->
		<cfset tStartArray = GetTickCount()>
		<cfloop from="1" to="#x#" index="i">
			<cfset stItem = StructNew()>
			<cfset stItem.name = "Bob" & i>
			<cfset stItem.age = 20>
			 <cfset ArrayAppend(stArray,stItem)> 
		</cfloop>
		<cfset tArrayTotal = GetTickCount() - tStartArray>
		
		<!--- create an component --->
		<cfset tStartObject= GetTickCount()>		
		<cfloop from="1" to="#x#" index="i">
			<cfset oItem = CreateObject('component', 'Person')>
			<cfset oItem.setname("Bob" & i )>
			<cfset oItem.setage(20)>
			 <cfset ArrayAppend(oArray,oItem)> 
		</cfloop>
		<cfset tObjectTotal = GetTickCount() - tStartObject>
		<!--- log the two times for this iteration --->
		<cffile action="append" file="#expandpath("createObject.log")#" output="#x#,#tArrayTotal#,#tObjectTotal#">
	</cfloop>
</code>

I added some timing info after each iteration and was adding the objects (a struct and a simple Person component) to a log file.

So you dont think that the Person component is very heavy, I did the barest component possible, you might even say its Duck-like!

<code>
	<cfcomponent>
		<cfset this.name = "">
		<cfset this.age = 0>
		<cffunction name="setName">
			<cfargument name="name">
			<cfset this.name = arguments.name>
		</cffunction>

		<cffunction name="setAge">
			<cfargument name="age">
			<cfset this.age = arguments.age>
		</cffunction>
	</cfcomponent>	
</code>

The results for the component are pretty uniform, but what surprised me was how little speed it takes to create structures. Obviously this is the case, since they are basically a HashMap and in ColdFusion a very long running primitive (i.e. been around a while and optimised)

These results of course are of course unfair, you wouldnt create 2000 odd objects, you might create 5-10 of them as services and keep them cached, but what about beans?


Here is the chart of the results:

<img src="/speedtest/structVcomp.png">