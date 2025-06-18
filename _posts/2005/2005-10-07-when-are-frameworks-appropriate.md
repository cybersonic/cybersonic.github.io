---
layout: post
title:  "When are frameworks appropriate?"
uid:	"8A979B65-E10C-31CB-B20C992D5C3A6C69"

categories: cfeclipse,coldfusion
permalink: when-are-frameworks-appropriate
---
I have started on a small project and thought it was a good time to get into Fusebox 4. There has been some discussions around the community and especially by <a href="http://www.horwith.com/index.cfm?mode=entry&entry=AD4FCCF6-E081-0478-4797DCE14EA2A058">Simon Horowith</a>.

I already work on a plugin for CFEclipse that supports the  Fusebox 4 and Fusebox 3 frameworks giving you an outline of your application and thought this  was a good chance to both test FBX4 and learn some of the skills involved. Since this is a commercial project time is tight so I was hoping to get to grips with it pretty quickly. 

The result?

Well, I decided not to use a framework in the end. The application is pretty small, mainly logging users in and displaying a dynamic page which is a survey. There aren't that many actions in there, or different sections so after a while messing with doing login pages etc in the FBX 4 framework, I turned to just using the Application.cfc to sort that bit out. It also consumes a webservice which it then holds in memory for that user so that the questions are displayed and saved to memory so that when they log off, the results are sent back to the webservice (which is written in PHP, but don't get me started on that!) 

My thoughts?

Frameworks are good for larger apps. ColdFusion gives you a mini framework already and if you are neat and use good conventions and documenting you don't need a framework, and in fact it can be a hindrance to your development at this stage.

Of course, I am doing a larger project later in the month (in ASP of all things!) so I wonder if I should use FBX there?