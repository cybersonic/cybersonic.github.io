---
layout: post
title:  "EventValidation: Getting Ajax (AJAJ) client side validation working"
uid:	"8A9AE8F9-C940-3EFE-6666C2337AF27EEF"
date:   2007-11-27 11:08 AM +0000
categories: coldfusion,coldspring,eventvalidation
permalink: eventvalidation-getting-ajax-ajaj-client-side-validation-working
---
One of the downfalls of the current cfform implementation of validation is that it only does it on the client side (as far as I have used it, it might have changed). So, you design your form, add some client side validation, then realise that people without javascript enabled are sending junk and you have to re-implement the validation server side.

So far so good. But then you are asked to change the validation ("hey, check it really is a creditcard number before we send it to the payment gateway", your boss says) and you implement that on the server side, and then copy the functionality to the client side. The list of changes go on, you go make a cup of coffee and forget to implement one side of the validation somewhere. 

With EventValidation, you define your validations in one place and you just define whether you are using client side validation. Lets check it out. 

Here is our modified form from before, and you notice, there is only one change, adding client="true" to the ev:setup tag (and make sure you import the form tags from "/EventValidator/taglib/form" as well as the showerror="true"):

<code>
<h1>Register</h1>
   <cfimport prefix="ev" taglib="/EventValidation/taglib">
   <cfoutput>   
   <form action="#ViewState.getValue("myself")#register.action" method="post" >
      <ev:setup id="ev_Register" successEvent="register.action" client="true" showerror="true">
      <div>
       <label for="email">email:</label>
         <input type="text" name="email" id="email" value="#ViewState.getValue("email")#">
      
       <label for="password">password:</label>
         <input type="password" name="password" id="password" value="#ViewState.getValue("password")#">
      </div>
      <div>
         <input type="submit">
      </div>
   </form>
</code>

What happens when you call this page, the form fields are replaced with a normal formfield and a hidden div. Also, javascript links are added to the header (in this case JQuery, the form plugin and the EventValidator setup script), which setup your form and the <abbr title="Asynchronous Javascript with JSON">AJAJ</a> based calls are added to the forms on the page (of course, it only adds it to forms that need it!)
	
And that is it, your headaches gone.

Apart from one, you would need to make a Virtual Directory on your web server to the "EventValidator/scripts" so you can have access to these scripts, but what if you can't do that (or cant be bothered?). The easiest way to change that is to copy the scripts from EventValidator/scripts somewhere else and change the scriptsrc attribute in the ev:setup tag:

<code>
      <ev:setup id="ev_Register" successEvent="register.action" client="true" showerror="true" scriptsrc="/scripts/">	
</code>

Now you are all sorted and <a href="http://www.markdrew.co.uk/EVDemo/index.cfm?go=ajaxerror" title="EventValidation Examples">can see it working.</a>