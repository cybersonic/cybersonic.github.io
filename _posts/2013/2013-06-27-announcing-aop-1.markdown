---
layout: post
title:  "Announcing AOP/1 "
uid:	"DD5288D3-3D2B-4D8D-90EC94F23FF33F0B"
date:   2013-06-27 11:08 AM +0000
categories: 
permalink: announcing-aop-1
---
<p>
I am happy to announce that today I got the AOP/1 framework to Alpha state (Version 0.1)! The AOP/1 framework was inspired from talking to a client that was using <a href="https://github.com/framework-one/di1/">DI/1</a> and I was describing how good it would be to have the ability to intercept methods, as you can with ColdSpring's AOP, but with less definitions (BTW, I know that ColdSpring 2 has radically trimmed down the syntax, which is awesome!). The main issue I have had with ColdSpring's implementation is that it is a great concept but very difficult to describe using the vocabulary (Advisor, Advice, AfterReturningAdvice,NamedMethodPointcutAdvisor,ProxyFactoryBean to name a few) to people. 
</p>
<p>Another side of it was that I wanted a much simpler way to do this, without having to always resort to looking stuff up in the manual. So I give you AOP/1!</p>

<p>Let's take a simple example. Using AOP/1 is very similar to working with Inject One ( see: <a href="https://github.com/framework-one/di1/wiki/Getting-Started-with-Inject-One">Getting Started with Inject One </a>), since it is just an extension of <a href="https://github.com/framework-one/di1/">DI/1</a>, you would first, define your bean factory:</p>

	<script src="https://gist.github.com/cybersonic/5877209.js"></script>

<p>So far all the configuration is identical to DI/1. Let's take a concrete example. Let's say we have a service that reverses a string. This would be defined under /services/Reverse.cfc :</p>

	<script src="https://gist.github.com/cybersonic/5877193.js"></script>

<p>All pretty simple so far! Let's go and get it a full example of using it:</p>


	<script src="https://gist.github.com/cybersonic/5877212.js"></script>


<p>This would output:</p>

<pre><code>	!olleH </code></pre>
<p>Everything is fine so far, but what if we want to intercept these calls? Well that is where AOP/1 does the hard work for you. All you have to define is a CFC (in your services if you like, or manually passing all the settings you want) with one or more of the following methods: <strong>before</strong>, <strong>after</strong>, <strong>around</strong> and <strong>onerror</strong>. In this case we have a before method defined in our BeforeInterceptor.cfc:</p>

	<script src="https://gist.github.com/cybersonic/5877213.js"></script>

<p>Now all we need to do is as above, but just add the fact that we are intercepting:</p>

	<script src="https://gist.github.com/cybersonic/5877219.js"></script>

<p>And that is it! Now all the method calls to the ReverseService will first call the BeforeInterceptor.before() method. So if we now call continue as before and do:</p>

	<script src="https://gist.github.com/cybersonic/5877229.js"></script>

<p>We would now get:</p>
<pre><code>	!olleHerofeb </code></pre>

<p>I hope this is a useful framework for people out there, and it allows them to do much more de-coupled development!
	I would also really like to thank Sean Corfield for allowing this project to under the framework-one family banner! 
</p>
<p>
	 <a href="https://github.com/framework-one/aop1/">You can Fork it, Clone it or Download it over at Github</a>
</p>