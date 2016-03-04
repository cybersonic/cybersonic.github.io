---
layout: post
title:  "Structures vs Components: Part 2"
uid:	"8A9956E7-FE1C-098B-44A7107070F31D36"
date:   2006-11-24 11:06 AM +0000
categories: coldfusion
permalink: structures-vs-components-part-2
---
So, in yesterday's post I compared structs vs components in a speed test. I thought I would expand the test to include adding rows to a query and creating Java objects.

The code I did is just an expansion of yesterday's and is as follows:

<code>
	Object Speed Test<cfflush>

		<!--- on the first round this file doesnt exist --->
		<cfif fileExists(expandpath("createObject.log"))>
		<cffile action="delete" file="#expandpath("createObject.log")#">
		</cfif>
		<cffile action="append" file="#expandpath("createObject.log")#" output="Instances,Structure,Component,Recorset,JavaObject">
		<!--- lets loop this crazyness--->
		<cfloop from="0" to="2000" index="x" step="50">
		.<cfflush>

			<!--- arrays to fill--->
			<cfset stArray = ArrayNew(1)>
			<cfset oArray = ArrayNew(1)>
			<cfset qArray = ArrayNew(1)>
			<cfset jArray = ArrayNew(1)>

			<!--- create a struct --->
			<cfset tStartStruct = GetTickCount()>
			<cfloop from="1" to="#x#" index="i">
				<cfset stItem = StructNew()>
				<cfset stItem.name = "Bob" & i>
				<cfset stItem.age = 20>
				<cfset ArrayAppend(stArray,stItem)>
			</cfloop>
			<cfset tTotalStruct = GetTickCount() - tStartStruct>

			<!--- create an component --->
			<cfset tStartComponent= GetTickCount()>		
			<cfloop from="1" to="#x#" index="i">
				<cfset oItem = CreateObject('component', 'Person')>
				<cfset oItem.setname("Bob" & i )>
				<cfset oItem.setage(20)>
				<cfset ArrayAppend(oArray,oItem)>
			</cfloop>
			<cfset tTotalComponent = GetTickCount() - tStartComponent>

			<!--- <cfset tStartQuery = GetTickCount()> --->
			<cfset tStartRecordset= GetTickCount()>	
			<cfset qSampleQuery = QueryNew("name,age", "VarChar,Integer")>
			<cfloop from="1" to="#x#" index="i">
				<cfset QueryAddRow(qSampleQuery)>
				<cfset QuerySetCell(qSampleQuery, "name", "bob" & i)>
				<cfset QuerySetCell(qSampleQuery, "age", 20)>

			</cfloop>
			<cfset tTotalRecordSet = GetTickCount() - tStartRecordset>



			<cfset tStartObject = GetTickCount()>
			<cfloop from="1" to="#x#" index="i">
				<cfset oPerson = CreateObject("java", "uk.co.markdrew.cfml.test.Person").init()>
				<cfset oPerson.setName("bob" & i)>
				<cfset oPerson.setAge(20)>
				<cfset ArrayAppend(jArray, oPerson)>
			</cfloop>

			<cfset tTotalObject = GetTickCount() - tStartObject>



			<!--- log the  times for this iteration --->
			<cffile action="append" file="#expandpath("createObject.log")#" output="#x#,#tTotalStruct#,#tTotalComponent#,#tTotalRecordSet#,#tTotalObject#">

			<!--- always flush once you have been there --->
			|<cfflush>
		</cfloop>
		done!	
</code>

Just for clarification, the java object that its instantiating is on the classpath already and the code for it is as follows :

<code>
	package uk.co.markdrew.cfml.test;

	public class Person \{

		private String name;
		private int age;
		public Person() \{
			super();
			// TODO Auto-generated constructor stub
		}
		public int getAge() \{
			return age;
		}
		public void setAge(int age) \{
			this.age = age;
		}
		public String getName() \{
			return name;
		}
		public void setName(String name) \{
			this.name = name;
		}

	}
</code>

Here is a chart of the results. If anyone has comments about my methodology, let me know, and I shall amend the test case as required.

<img src="/speedtest/speedComparison.png">

EDIT: I was forgetting to add the objects to the array, although this is academic since that should be a very fast function. I shall re-run the test with the modifed code.