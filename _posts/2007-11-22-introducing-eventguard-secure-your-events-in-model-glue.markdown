---
layout: post
title:  "Introducing EventGuard: Secure your events in Model-Glue"
uid:	"8A9AE60B-AA34-D5E6-5C58AE0D3A44F149"
date:   2007-11-22 11:08 AM +0000
categories: coldspring
permalink: introducing-eventguard-secure-your-events-in-model-glue
---
EventGuard is an Action Pack for the <a href="http://www.model-glue.com/" title="The Model-Glue Framework">Model-Glue</a> framework that allows you to secure your events based whether a user is logged in or using a user's assigned roles.

On a simple level, it allows you to define which event-handler you will use to carry out the login, and then put a list of event-handler names that you want to protect. EventGuard also allows to define which event-handlers you want to exclude in your security check so that you can perform a blanket wide inclusion using "*".There are two things to "setup", include the EventGuard.xml in your ModelGlue.xml file with:

<code>
	< include template="/EventGuard/config/EventGuard.xml"/>
</code>

Where "/EventGuard/" is CF a mapping (recommended since you should keep the ColdSpring.xml file that is included in EventGuard out of your web-root so that people can't see what you are protecting). 

The second part is configuring the EventGuard is to setup the EventGuard Bean in ColdSpring, you can do this by importing it into your own ColdSpring file using the relative path as follows:

<code>
	<import resource="../../EventGuard/config/ColdSpring.xml" />
</code>


The configuration of the EventGuard bean is pretty simple, yet powerful, it is setup by setting the loginevent,include and exclude arguments.
The loginevent argument is the event-handler to redirect requests to if they are not allowed to access the requested event-handler.
The include argument can take the following: 

<ul>
	<li>"*": to define ALL event-handlers as secure, you will be redirected to the login event-handler (remember to add any events-hanlders to your exclude argument so you can login!)
		e.g.:
		<code>
			<bean id="EventGuard" class="EventGuard.services.EventGuard">
					<constructor-arg name="loginEvent"><value>login</value></constructor-arg>
					<constructor-arg name="exclude"><value>logout,register,login.action</value></constructor-arg>
					<constructor-arg name="include"><value>*</value></constructor-arg>
			</bean>
		</code>
		
	</li>
	<li>a list of event-handler names: if any of these are requested and the user is not logged in you will be redirected to the loginevent
		e.g.:
		
		<code>
			<bean id="EventGuard" class="EventGuard.services.EventGuard">
					<constructor-arg name="loginEvent"><value>login</value></constructor-arg>
					<constructor-arg name="include"><value>admin,profile,userlist</value></constructor-arg>
			</bean>	
		</code>
		
	</li>
	<li>an array with structures with event and roles: if you want to use roles based permissions you can pass in this array and set a list of permissions for each event-handler
		
		e.g.
		
		<code>
			<bean id="EventGuard" class="EventGuard.services.EventGuard">
					<constructor-arg name="loginEvent"><value>login</value></constructor-arg>
					<constructor-arg name="exclude"><value>logout,register,login.action</value></constructor-arg>
					<constructor-arg name="include">
						<list>
							<map>
								<entry key="event"><value>myprofile</value></entry>
								<entry key="roles"><value>user,admin</value></entry>
							</map>
							<map>
								<entry key="event"><value>addressbook</value></entry>
								<entry key="roles"><value>user,admin</value></entry>
							</map>
							<map>
								<entry key="event"><value>admin.usermanager</value></entry>
								<entry key="roles"><value>admin</value></entry>
							</map>
						</list>
					</constructor-arg>
				</bean>
		</code>
	</li>
</ul>

And that is it. Your event-handlers should be guarded! If it isn't too obvious, EventGuard uses getAuthUser() and isUserInRole() to check the permissions. I might change this in the future so you can pass in the roles and whether the user is logged in but for now it seems to work ok.

Let me know what you think! I shall be releasing more action packs in the coming weeks, I am building a "top secret" web app, but a lot of the elements will be released as action packs to the community (well that is the plan, we shall see how we go!)