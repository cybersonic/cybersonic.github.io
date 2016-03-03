---
layout: post
title:  "Comparing Component speed on different CFML engines"
uid:	"8A99581F-AA08-8A3E-73F34781E38C41FF"
date:   2006-11-27 11:06 AM +0000
categories: coldfusion
---
After my previous couple of posts of comparing different speeds for instantiating structures vs components, I thought I would measure the same process on different Coldfusion engines.

I set up a small test that basically logs speeds to a database (for easy charting mainly) and I measure just the time of the inner loop (the creation of X number of objects). Now, this is not a scientific test and you should take the stats with a pinch of salt, they were run on my MacBook Pro (not exactly a server machine is it) and I tried to make everything as equal as possible (turning on the Trusted Cache for both Adobe ColdFusion and New Atlanta's BlueDragon, I wasn't able to spot something similar in Railo) and run the cycle a few times before setteling on the figure I was going to use (so the code could 'bed in').

The code that I am running on these tests is basically the same as before, but I am posting it here for comparison:

<code>
	Object Speed Test<cfflush>
		<cfloop from="0" to="2000" index="x" step="50">
		.<cfflush>

			<cfset tStartStruct = GetTickCount()>
			<cfloop from="1" to="#x#" index="i">
				<cfset stItem = StructNew()>
				<cfset stItem.name = "Bob" & i>
				<cfset stItem.age = 20>
			</cfloop>
			<cfset tTotalStruct = GetTickCount() - tStartStruct>

			<cfset tStartComponent= GetTickCount()>		
			<cfloop from="1" to="#x#" index="i">
				<cfset oItem = CreateObject('component', 'Person')>
				<cfset oItem.setname("Bob" & i )>
				<cfset oItem.setage(20)>
			</cfloop>
			<cfset tTotalComponent = GetTickCount() - tStartComponent>

				<cfquery name="logThis" datasource="reporting">
						UPDATE reports
						SET bdStruct = #tTotalStruct#,
						bdComponent = #tTotalComponent#			
						WHERE Instances = #x#
				</cfquery>
		|<cfflush>
		</cfloop>
		done!
	
</code>

I can post the precise results if people want but the charts kind of speak for themselves. Anything I missed?

<img src="/speedtest/comp_struct.png">
<br/>
<img src="/speedtest/comp_component.png">

EDIT: The versions of the engines are:

Adobe ColdFusion 7.02

New Atlanta Bluedragon Server JX 6.2.1.9

Railo (Live) 1.0.0.027

All these are the versions that run on OS X by the way