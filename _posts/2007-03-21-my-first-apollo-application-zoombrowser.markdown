---
layout: post
title:  "My first Apollo Application: zoomBrowser"
date:   2007-03-21 11:08 AM +0000
categories: air
---
I had a little play this morning with Apollo and Flex, and I apologize to all you Flexers out there, I haven't as yet had the time to REALLY get into Flex, so all of this is really obvious to you all. 

Anyway, I made a little browser implementation, you can load a URL and browse as you normally would, but if you have bad eyesight (as I do at 6 am) its nice to be able to zoom into the web page, hence zoomBrowser!

The code for this is really simple:

<code>
<?xml version="1.0" encoding="utf-8"?>
<mx:ApolloApplication xmlns:mx="http://www.adobe.com/2006/mxml" layout="absolute" height="700" width="800">

<mx:Script>
	<![CDATA[
		private function loadURL():void\{
			htmlBrowser.location = locationBar.text;
		}
	]]>
</mx:Script>
	<mx:HTML id="htmlBrowser" right="10" left="10" bottom="30" top="40" scaleX="\{zoomSlider.value}" scaleY="\{zoomSlider.value}"/>
	<mx:HSlider id="zoomSlider" right="10" bottom="10"  minimum="0.5" value="1" maximum="3" snapInterval="0.1" liveDragging="true"/>
	<mx:TextInput id="locationBar" text="http://" right="59" left="50" top="10" enter="loadURL()"/>
	<mx:Button label="Go" id="goButton" right="10" top="10" click="loadURL()"/>
	<mx:Label text="URL:" left="10" top="10"/>
	<mx:Label text="Zoom:" right="178" bottom="5"/>
	
</mx:ApolloApplication>
</code>

There are two functions, loadURL and zoomBrowser. LoadURL is called either when you press enter in the mx:TextInput field or when you click on the "Go" button. The mx:HTML item is simply bound to the slider and it resizes with the values.

Amazing that you can build such a complicated app (if you think about it) with so few lines of code!

<a href="http://www.markdrew.co.uk/blog/enclosures/zoomBrowser.air.zip">Download</a> and unzip and give it a whirl (you need to download the Apollo runtime from <a href="http://www.adobe.com/cfusion/entitlement/index.cfm?e=labs%5Fapollo#runtime">Adobe Labs</a>)