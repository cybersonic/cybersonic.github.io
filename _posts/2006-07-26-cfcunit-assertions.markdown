---
layout: post
title:  "CFCUnit Assertions"
uid:	"8A98D5D3-EA6D-7B04-0BAC616164F5900A"
date:   2006-07-26 11:06 AM +0000
categories: coldfusion
---
I am doing a big application that has a number of CFCs that connect to another application and also writing modifications to that application. You can imagine that things get a bit complicated after a while. 

Once one gets to this level of complication, you need to start unit testing. So, I got myself <a href="http://www.cfcunit.org/">CFCunit</a> downloaded, and then I was a bit stumped, yes there is some <a href="http://www.cfcunit.org/cfcunit/docs.cfm?event=WritingTests">documentation</a> on how to do a simple TestCase, but my TestCases are NOT going to be simple (init should return an object, that object should have a value and not be empty in one of the properties, a certain method should return a struct, another an array etc etc). I couldnt find after following the documentation what were the assertions I could use, so I did a bit of digging through the code and using Spike's <a hgref="http://www.spike.org.uk/projects/cfcdoc/">CFC Documentation</a> tool I managed to get all the assertions you can use.I hope this list helps other people. Next, I shall be setting up John Ashenfelter's CFCUnit ant task (which I built myself from source, but dont know the syntax... anyone?)

<blockquote>
<p>assertArrayContainsNumber(array array, numeric value, [string failureMessage=&quot;&quot;])</p>
<p>assertArrayContainsString(array array, string value, [string failureMessage=&quot;&quot;])</p>
<p>assertComplexValue(any value, [string failureMessage=&quot;&quot;])</p>
<p>assertComponent(any value, [string failureMessage=&quot;&quot;])</p>
<p>assertContainsString(string string, string searchString, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that one string contains one or more instances of the specified searchString. If the seachString cannot be found, AssertionFailedError is thrown.</em></p>
<p>assertEqualsArray(array expected, array actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two Array are equal. If they are not an AssertionFailedError is thrown with the given message.</em></p>
<p>assertEqualsBoolean(boolean expected, boolean actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two booleans are equal. If they are not an AssertionFailedError is thrown with the given message.</em></p>
<p>assertEqualsNumber(numeric expected, numeric actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two numbers are equal. If they are not an AssertionFailedError is thrown with the given message.</em></p>
<p>assertEqualsQuery(query expected, query actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two Queries are equal. If they are not an AssertionFailedError is thrown with the given message.</em></p>
<p>assertEqualsString(string expected, string actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two strings are equal. If they are not an AssertionFailedError is thrown with the given message.</em></p>
<p>assertEqualsStruct(struct expected, struct actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two Structs are equal (value comparision). If they are not an AssertionFailedError is thrown with the given message.</em></p>
<p>assertFalse(boolean condition, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that a condition is false. If it isn't it throws an AssertionFailedError with the given message.</em></p>
<p>assertNotNull(any value, [string failureMessage=&quot;&quot;])</p>
<p>assertNotNullComponent(component object, [string failureMessage=&quot;&quot;])</p>
<p>assertNotRegexMatch(string regex, string string, [string failureMessage=&quot;&quot;])</p>
<p>assertNotSameComponent(component expected, component actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two components do not refer to the same object. If they do an AssertionFailedError is thrown with the given message.</em></p>
<p>assertNotSameStruct(struct expected, struct actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two structs do not refer to the same struct. If they do an AssertionFailedError is thrown with the given message.</em></p>
<p>assertNull(any value, [string failureMessage=&quot;&quot;])</p>
<p>assertNullComponent(component object, [string failureMessage=&quot;&quot;])</p>
<p>assertObject(any value, [string failureMessage=&quot;&quot;])</p>
<p>assertRegexMatch(string regex, string string, [string failureMessage=&quot;&quot;])</p>
<p>assertSameComplex(any expected, any actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two complex variables refer to the same object. If they are not an AssertionFailedError is thrown with the given message.</em></p>
<p>assertSameComponent(component expected, component actual, [string failureMessage=&quot;&quot;])</p>
<p>assertSameStruct(struct expected, struct actual, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that two structs refer to the same struct. If they are not an AssertionFailedError is thrown with the given message.</em></p>
<p>assertSimpleValue(any value, [string failureMessage=&quot;&quot;])</p>
<p>assertTrue(boolean condition, [string failureMessage=&quot;&quot;])<br />
  <em>Asserts that a condition is true. If it isn't it throws an AssertionFailedError with the given message.</em></p>
<p>fail([string message=&quot;&quot;])<br />
  <em>Fails a test with the given message.</em><br />
</p>

</blockquote>