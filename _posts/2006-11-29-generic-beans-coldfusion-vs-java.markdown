---
layout: post
title:  "Generic Beans: Coldfusion VS Java"
uid:	"8A9958FA-FF09-326D-60DF7699BA63260F"
date:   2006-11-29 11:06 AM +0000
categories: coldfusion
permalink: generic-beans-coldfusion-vs-java
---
In my previous tests I wanted to see how fast I could get the creation of components. I decided to re-write a Generic Bean in Java and see if the speed changed at all. I had done this with a defined bean (a Person with a name and an age), but what about a Generic Bean?

I created the generic bean very quickly in Java, it hasnt got any logic in it, you create it and then <em>put()</em> and <em>get()</em> values or objects you have placed into this bean. There is no error checking, it could barf and do some crazy things so it's not production code, just for testing you understand.

The code for the test is as follows, its pretty similar to my previous tests so nothing should shock you here:

<code>
	<cffile action="append" file="#expandPath("results/#FORM.testname#.txt")#" output="Instances,CFMLBean,JavaBean">
	<cfset testgroup = GetTickCount()>
	<cfloop from="0" to="2000" step="50" index="x">

		<cfset cArray = ArrayNew(1)>

		<cfset cStart = GetTickCount()>
		<cfloop from="1" to="#x#" index="c">
			<cfset cfGenBean = CreateObject("component", "GenericBean")>
			<cfset cfGenBean.put("name", "Bob" & c)>
			<cfset cfGenBean.put("age", c)>
			<cfset ArrayAppend(cArray, cfGenBean)>
		</cfloop>
		<cfset cTime = GetTickCount() - cStart>


		<cfset jArray = ArrayNew(1)>
		<cfset jStart = GetTickCount()>
		<cfloop from="1" to="#x#" index="j">
			<cfset jGenBean = CreateObject("java", "uk.co.markdrew.java.GenericBean")>
			<cfset jGenBean.put("name", "Bob")>
			<cfset jGenBean.put("age", j)>
			<cfset ArrayAppend(jArray, jGenBean)>
		</cfloop>
		<cfset jTime = GetTickCount() - jStart>
		<cffile action="append" file="#expandPath("results/#FORM.testname#.txt")#" output="#x#,#cTime#,#jTime#">
		|&nbsp;
		<cfflush>
	</cfloop>
	
</code>

My CFFML based Generic bean is also pretty simple:

<code>
	<cfcomponent output="false">
		<cfset variables.values = StructNew()>

		<cffunction name="put" output="false" access="public" returntype="void">
			<cfargument name="key">
			<cfargument name="value">

			<cfset StructInsert(variables.values, arguments.key, arguments.value)>
		</cffunction>

		<cffunction name="get" output="false" access="public" returntype="any">
			<cfargument name="key">
			<cfreturn variables.values[arguments.key]>
		</cffunction>
	</cfcomponent>	
</code>

The Java one is again, pretty much the same as above, but in Java:

<code>
	package uk.co.markdrew.java;
	import java.util.HashMap;
	public class GenericBean \{
		private HashMap objectMap;
		public GenericBean() \{
			super();
			this.objectMap = new HashMap();
		}
		public void put(String key, Object object)\{
			this.objectMap.put(key, object);
		}
		public Object get(String key)\{
			return this.objectMap.get(key);
		}
	}	
</code>

So, what happened in this test? Well, from the chart you can see that Java won hands down!

Maybe something to think about if you are doing a lot of object instantiations?

<img src="/speedtest/generic_beans.png">


Again, this is another <a href="http://en.wikipedia.org/wiki/Caveat_emptor">Caveat emptor
</a> considering I might be wrong and delusional