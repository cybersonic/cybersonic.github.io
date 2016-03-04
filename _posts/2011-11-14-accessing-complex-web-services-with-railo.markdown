---
layout: post
title:  "Accessing complex web services with Railo"
uid:	"7403B627-35AD-4ABE-AAD9914E21AB25BD"
date:   2011-11-14 01:26 PM +0000
categories: 
permalink: accessing-complex-web-services-with-railo
---
<p>Edit: Now with screencast! see the bottom of the post</p>
<p>There are a number of times when a webservice returns some very complicated data, or inversely it requires some even more complicated parameters to be sent. In the past I have spent hours trying to figure out how to send the right parameters to remote method calls, but instead of wasting a long time using either Adobe ColdFusion's or Railo Server's Axis adaptors, I go straight to the source, and in this post, I shall show you how to do it. </p>
<p>To start off, I am just going to use a simple web service I have created, but you can do this for even more complex services and get an idea what they return. </p>
<p>This is the webservice I am going to be calling:</p>
<code>
	<cfcomponent output="false">
		<cffunction name="getTime" returntype="String" access="remote" output="false">
			<cfreturn Now()>
		</cffunction>
	</cfcomponent>
</code>

<p>Ok, not the most complicated, but I just want to use it so that we all know how to do the process. </p>
<p>Next, I use a tool that comes with axis called WSDL2Java (both ACF and Railo use this in the background when making webservice calls. In CF they are called stubs), to do this I create a Java Project in Eclipse.</p>
<img src="http://www.markdrew.co.uk/blog/assets/content/wsdl/webservice_01.png">
<p>Then I create a lib folder, into which I copy ALL the .jar files that come with Railo Server (all the files in , for example /Railo-Express/lib/ext/). Now you won't need ALL of them but it's easier than trying to find out which ones you need. </p>
<img src="http://www.markdrew.co.uk/blog/assets/content/wsdl/webservice_02.png">
<p>Next, by right clicking on your project &gt; Properties &gt; Java Build Path &gt; Libraries I add all the .jar files that I copied over and click OK </p>
<img src="http://www.markdrew.co.uk/blog/assets/content/wsdl/webservice_03.png">
<p>Awesome, now we are ready to use the WSDL2Java function, create a new run configuration under the "Java Application" section , give it a name and then set the main class to be "org.apache.axis.wsdl.WSDL2Java"</p>
<img src="http://www.markdrew.co.uk/blog/assets/content/wsdl/webservice_04.png">
<p>Then in the arguments section, add the WSDL url (in my case http://dev.local:8888/RemoteService.cfc?wsdl):</p>
<img src="http://www.markdrew.co.uk/blog/assets/content/wsdl/webservice_05.png">
<p>Now you can click "Apply" and then "Run"</p>
<p>If you now click Refresh on your project you will see a new folder has been added to the root: </p>
<img src="http://www.markdrew.co.uk/blog/assets/content/wsdl/webservice_06.png">
<p>We can now move that folder to the "src" folder in our project to get it to compile:</p>
<img src="http://www.markdrew.co.uk/blog/assets/content/wsdl/webservice_07.png">
<p>Now for the real "Java Bit". I tend to write it first in Java to test the service, so create a new class in the src folder of your project, I called in Runner and make sure you tick the create "public static void main(String[] args)" checkbox, you should get some code like:</p>
<code>
public class Runner \{

	/**
	 * @param args
	 */
	public static void main(String[] args) \{
		// TODO Auto-generated method stub

	}
}
</code>
<p>Great, now let's use the ServiceLocator to get our webservice and call methods on it:</p>

<code>
public static void main(String[] args) throws RemoteException, ServiceException \{
	Remoteservice_wrapServiceLocator ws = new Remoteservice_wrapServiceLocator();
	String timeItem = ws.getRemoteServiceCfc().getTime();
	System.out.println(timeItem);
}
</code>
<p>If we run this now we get the time returned from the webservice! But we are not finished yet. You want to use these stubs from your CFML code right?</p>
<p>First thing to do is wrap all this up as a JAR file, luckily this is pretty easy, just right click on the project and select Export... &gt; Java &gt; JAR file, and then select where you want to save it, I am saving it into my /Railo-Express/lib/ as a file called DemoWebService.jar.</p>
<p>Now to restart Railo so that the new jar gets picked up. </p>
<p>Ok, let's use this in Railo, in this example, I just used the CreateObject() function with the third param that defines which jar to use:</p>
<code>
<cfscript>
		ws = CreateObject("java", "local.dev.RemoteService_cfc.Remoteservice_wrapServiceLocator", "/Applications/railo-express/lib/DemoWebService.jar");
		timeItem = ws.getRemoteServiceCfc().getTime();
		WriteOutput(timeItem);
</cfscript>
</code>
<p>And there you go, you have called the method easily.</p>
<p>This is a simple example, but if you can do it from Java you can do it from CFML. If there are complex objects to pass, you can just create an instance of that object and pass it to the webservice too. </p>

<p><strong>Edit:</strong> I have now also created some screencasts so you can see how it works<p>
	<p>Part One</p>
	<!-- copy and paste. Modify height and width if desired. -->        <object id="scPlayer"  width="1002" height="716" type="application/x-shockwave-flash" data="http://content.screencast.com/users/MarkRailo/folders/Jing/media/ad25bc72-297c-45d1-9157-272e48dfdc20/jingh264player.swf" > <param name="movie" value="http://content.screencast.com/users/MarkRailo/folders/Jing/media/ad25bc72-297c-45d1-9157-272e48dfdc20/jingh264player.swf" /> <param name="quality" value="high" /> <param name="bgcolor" value="#FFFFFF" /> <param name="flashVars" value="thumb=http://content.screencast.com/users/MarkRailo/folders/Jing/media/ad25bc72-297c-45d1-9157-272e48dfdc20/FirstFrame.jpg&containerwidth=1002&containerheight=716&content=http://content.screencast.com/users/MarkRailo/folders/Jing/media/ad25bc72-297c-45d1-9157-272e48dfdc20/00000003.mp4&blurover=false" /> <param name="allowFullScreen" value="true" /> <param name="scale" value="showall" /> <param name="allowScriptAccess" value="always" /> <param name="base" value="http://content.screencast.com/users/MarkRailo/folders/Jing/media/ad25bc72-297c-45d1-9157-272e48dfdc20/" /> <iframe type="text/html" frameborder="0" scrolling="no" style="overflow:hidden;" src="http://www.screencast.com/users/MarkRailo/folders/Jing/media/ad25bc72-297c-45d1-9157-272e48dfdc20/embed" height="716" width="1002" ></iframe> </object>
	
	<p>Part Two</p>	
<!-- copy and paste. Modify height and width if desired. -->        <object id="scPlayer"  width="996" height="716" type="application/x-shockwave-flash" data="http://content.screencast.com/users/MarkRailo/folders/Jing/media/780a5ae3-e085-4da3-a715-7e799a66ff85/jingh264player.swf" > <param name="movie" value="http://content.screencast.com/users/MarkRailo/folders/Jing/media/780a5ae3-e085-4da3-a715-7e799a66ff85/jingh264player.swf" /> <param name="quality" value="high" /> <param name="bgcolor" value="#FFFFFF" /> <param name="flashVars" value="thumb=http://content.screencast.com/users/MarkRailo/folders/Jing/media/780a5ae3-e085-4da3-a715-7e799a66ff85/FirstFrame.jpg&containerwidth=996&containerheight=716&content=http://content.screencast.com/users/MarkRailo/folders/Jing/media/780a5ae3-e085-4da3-a715-7e799a66ff85/00000004.mp4&blurover=false" /> <param name="allowFullScreen" value="true" /> <param name="scale" value="showall" /> <param name="allowScriptAccess" value="always" /> <param name="base" value="http://content.screencast.com/users/MarkRailo/folders/Jing/media/780a5ae3-e085-4da3-a715-7e799a66ff85/" /> <iframe type="text/html" frameborder="0" scrolling="no" style="overflow:hidden;" src="http://www.screencast.com/users/MarkRailo/folders/Jing/media/780a5ae3-e085-4da3-a715-7e799a66ff85/embed" height="716" width="996" ></iframe> </object>

<p>Part Three</p>
<!-- copy and paste. Modify height and width if desired. -->        <object id="scPlayer"  width="1002" height="716" type="application/x-shockwave-flash" data="http://content.screencast.com/users/MarkRailo/folders/Jing/media/daaa1ef1-1dbe-4d94-a43a-26308af1b05e/jingh264player.swf" > <param name="movie" value="http://content.screencast.com/users/MarkRailo/folders/Jing/media/daaa1ef1-1dbe-4d94-a43a-26308af1b05e/jingh264player.swf" /> <param name="quality" value="high" /> <param name="bgcolor" value="#FFFFFF" /> <param name="flashVars" value="thumb=http://content.screencast.com/users/MarkRailo/folders/Jing/media/daaa1ef1-1dbe-4d94-a43a-26308af1b05e/FirstFrame.jpg&containerwidth=1002&containerheight=716&content=http://content.screencast.com/users/MarkRailo/folders/Jing/media/daaa1ef1-1dbe-4d94-a43a-26308af1b05e/00000005.mp4&blurover=false" /> <param name="allowFullScreen" value="true" /> <param name="scale" value="showall" /> <param name="allowScriptAccess" value="always" /> <param name="base" value="http://content.screencast.com/users/MarkRailo/folders/Jing/media/daaa1ef1-1dbe-4d94-a43a-26308af1b05e/" /> <iframe type="text/html" frameborder="0" scrolling="no" style="overflow:hidden;" src="http://www.screencast.com/users/MarkRailo/folders/Jing/media/daaa1ef1-1dbe-4d94-a43a-26308af1b05e/embed" height="716" width="1002" ></iframe> </object>