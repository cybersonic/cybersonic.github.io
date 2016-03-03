---
layout: post
title:  "Using GeoLocation in a Web Browser"
uid:	"0448E433-3BD5-4FF3-951B70C61CC33FC6"
date:   2011-04-17 08:10 AM +0000
categories: mobile
---
<p>
Having had an awesome time at WebDU, a couple of sessions had information about <a href="http://docs.phonegap.com/" title="PhoneGap API Documentation">PhoneGap</a>, <a href="http://jquerymobile.com/" title="jQuery Mobile | jQuery Mobile">JQuery Mobile</a> and more importantly geolocation available in HTML 5 applications. 
</p>
<p>
	Some of the confusion arose from what the difference is between PhoneGap and JQuery Mobile provide. 
	<br>
	Essentially, PhoneGap provides a common interface into the <a href="http://docs.phonegap.com/" title="PhoneGap API Documentation">various API's</a> provided on different movile devices. API's such as the Accelerometer, Camera, Compass, Geolocation, Contacts, Media and Notificaiton. 
	
	<br>
	<a href="http://jquerymobile.com/" title="jQuery Mobile | jQuery Mobile">JQuery Mobile</a> provides an API to develop a common UI that works across different devices as well as common ways for re-skinning and handling events within that UI.  
</p>

<p>
	A question come up about how to do GeoLocation within these devices and I pointed out that you can indeed do geolocation, and not only within a mobile device, but you can also do it using the HTML5 API's on desktop browsers. <br>
	This is actually really easy with the navigator.geolocation object in JavaScript. <br>
	
	To check whether you can actually use it all you have to do is check if this object exists in the DOM, with code like:
	<p>
	<code>
		if (navigator.geolocation) \{
		 	navigator.geolocation.getCurrentPosition(success, error);	
		}
	</code>
	</p>
	Now, if you run this code from some function, you will need to pass in two functions that will recieve the current position, or throw an error if there has been some problem getting the current location. The expanded code is shown below:
	
	<p>
		<code>
			
			function getLocation()\{
				if (navigator.geolocation) \{
				  navigator.geolocation.getCurrentPosition(success, error);
				} else \{
					document.getElementById("output").innerHTML = "Your browser doesn't handle the  GeoLocation API. Use Safari, Firefox 4 or Chrome";
				}
			}


			function success(loc)\{
				strout = "";
				for(l in loc.coords)\{
					strout += l +" = " +loc.coords[l] + "<br>";
				}
				strout += '<img src="http://maps.google.com/maps/api/staticmap?center='+loc.coords.latitude+','+ loc.coords.longitude +'&zoom=15&size=400x400&sensor=false">';
				document.getElementById("output").innerHTML = strout;
			}

			function error(err)\{
				document.getElementById("output").innerHTML = err.message;
			}
		
		</code>
	</p>
	And that is it. No external libraries or PhoneGap API's. Just a standard browser call. 
	
	<br>
	
	The navigator.geolocation.getCurrentPosotion() function will call the success(loc) function passing in a GeoPosition object that you can get the coordinates from. It also includes a few other handy properties such as longitude, lattitude, accuracy and heading if you are moving. 
	<br>
	
	<a href="http://www.markdrew.co.uk/loc/" title="Location Data">Check out a demo of the above code</a>. There are no other libraries or includes so you can just view the source to see how it works. 
	
</p>