---
layout: post
title:  "Organising your ColdBox Handlers into Packages"
uid:	"40081980-702E-47AC-8C57F72AB9691886"

categories: 
permalink: organising-your-coldbox-handlers-into-packages
---
<p>I have been using Coldbox for a project for a few months now and like the framework. I won't get into all the features, since you can find out for yourself over at http://www.coldbox.org but one of the things that you realise once your project grows is that your handlers directory starts getting rather full of handler CFC's.<br /><br />It took me a little while to see how I could package them up a little better but then I spotted a small bit of the docs that tells you how to do it, so for example, if you were calling your handler as:<br /><br />  
<code>
  http://localhost/index.cfm?event=account.create
</code>
<br />
<br />And you have moved your account handler to a /user folder you can now call it as a package:<br />

<code>
http://localhost/index.cfm?event=user.account.create
</code>
</p>
<p>Of course, this isn't ideal, so you can now add a route for it in your routes.cfm file (if you have routes turned of of course):</p>
<p>  
<code>
	addRoute(pattern="account/create",
				handler="user.register",
				action="new");
</code>
</p>
  <p>And now you can have a nice SES friendly url such as:
<code>    
http://localhost/account/create
</code>   <br />Hope that helps people looking for how to do this!</p>