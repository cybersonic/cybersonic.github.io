---
layout: post
title:  "CFObjective, CodeWars and Velociraptors"
uid:	"1FFD113B-014B-40EE-BC5E6F3958A978BF"
date:   2010-11-17 10:17 PM +0000
categories: codewar
permalink: velociraptor-code-war
---
<p>
Last night at <a href="http://www.cfobjective.com.au/" title="cfObjective(ANZ): The Enterprise ColdFusion Conference comes to Melbourne, Australia - 18-19 November, 2010">CFObjective ANZ</a>, Gert Franz and I were invited to the <a href="http://www.rocketboots.com/site/index.cfm/page/codewar" title="RocketBoots">CodeWar</a> hosted by <a href="http://twitter.com/#!/robinhilliard" title="">Robin</a> from RocketBoots. I have to say it was a great event at the European Beer Cafe in Melbourne, and the Railo "Flower Power" team managed, somehow, even with jetlag and lots of beers, to win (pure luck I have to say!). 
</p>
<p>
The CodeWar is a series of challenges where teams went against each other to complete a range of coding challanges in 20 minute rounds. 
</p>
<p>
One of the rounds, in which we didn't compete,  was the ability to find out which Velociraptors would survive if they were tied to a pole and were trying to mate. The awesome description of the challenge was:
</p>
<blockquote>
	<strong>VELOCIRAPTORS run Amok</strong>
	A large arena (1 square km) has 24 Vulcan Velociraptors, each chained to a post.<br>
	Each is severely afflicted with Pon farr.<br>
	Which is the lonely Velociraptor that is destined to die? and which is the lucky Velociraptor that will make a spectator outside the arena very unhappy?<br>
	
</blockquote>
<p>
Since we weren't involved in that challenge, I really wanted to give the solution a go, so here is my solution. 
</p>
<p>
First of we have a list of Velociraptors:
</p>
<code>
[
	['Alice',51.5,940.5,945.5],
	['Arthur',73.5,769.5,803.5],
	['Bertha',112,593,844],
	['Bessie',62,852,769],
	['Charles',37,224,144],
	['Clara',70,168,832],
	['Edward',171.5,120.5,535.5],
	['Elizabeth',83,199,235],
	['Emma',67.5,298.5,576.5],
	['Ethel',27,417,449],
	['Florence',47.5,369.5,386.5],
	['Frank',118.5,825.5,185.5],
	['Fred',31.5,920.5,875.5],
	['George',52.5,109.5,106.5],
	['Harry',97,210,701],
	['Helen',41,194,85],
	['Henry',127,473,603],
	['Joseph',144,490,211],
	['Marie',157,742,541],
	['Minnie',17,402,431],
	['Robert',66.5,398.5,784.5],
	['Ruth',130.5,656.5,282.5],
	['Thomas',64,140,894],
	['Walter',39.5,468.5,868.5]
]
</code>
<p>
The above is an array of arrays, with each individual array standing for a velociraptor, with it's name, radius of his chain, and their x and y location on the map. So that we can see where they all are and their reach, I decided to use the HTML5 Canvass tag. Here is the simple page with the canvass:
</p>

<code>
<!DOCTYPE html>
	<html lang="en">
	<head>
		<title>The Lonely Raptors</title>
	</head>
	<body>
		<canvas id="myRaptors" width="1000" height="1000"><p>Your browser doesn't support canvas.</p></canvas>
	</body>
	</html>
</code>
<p>
Next I, did a function that allowed me to display each of the velociraptors as a circle:
</p>
<code>
		var drawingCanvas = document.getElementById('myRaptors');
		if(drawingCanvas.getContext) \{
		    var context = drawingCanvas.getContext('2d');
		}
		function drawCircle(context, radius, x, y, name)\{
				context.strokeStyle = "#000000"; //Set the stroke
				context.fillStyle = "#" + (x*8).toString(16); //set a random colour for each circle
				context.globalAlpha = 0.5; //make it nicely transparent
				//Draw the circle
				context.beginPath();
				context.arc(x,y,radius,0,Math.PI*2,true);
				context.closePath();
				context.stroke();
				context.fill();

				//reset the colour and the transparency and then fill in the name
				context.globalAlpha = 1;		
				context.textAlign = "center";
				context.textBaseline = "middle";		
				context.fillStyle = "#000000";
				context.fillText(name, x, y);
		}

</code>
<p>
Then I loaded the velociraptor array and called the function to draw a circle:
</p>
<code>
	<cfscript>
		raptors  = Evaluate(FileRead("Velociraptors.txt"));
		for(r in raptors)\{
			WriteOutput("drawCircle(context, #r[2]#, #r[3]#, #r[4]#, '#r[1]#');");
		}
	</cfscript>
</code>
<p>
And finally, this is the result:
</p>
<img src="http://www.markdrew.co.uk/blog/enclosures/raptor.png">

<p>
	So we can see that the Velociraptor that will die of lonelyness is Robert as he has no overlap with any other 'raptor and that Edward will be having a tasty treat in the form of a visitor outside the enclosure! 
<br>
	You have to love HTML5 for being able to do these things so easily!
</p>