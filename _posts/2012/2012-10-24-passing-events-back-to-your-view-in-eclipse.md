---
layout: post
title:  "Passing events back to your view in Eclipse"
uid:	"DF392B5B-3150-4493-870E993596FB1F40"

categories: java,eclipse
permalink: passing-events-back-to-your-view-in-eclipse
---
<p>This is going to be a bit of a technical post, and it's to do with views in Eclipse.  I tried to find this all over the place but in the end it was bits and pieces from different posts that actually gave me the answer, which is kinda odd. </p>

<p>So, here&#8217;s the problem. You are writing a plugin for Eclipse. You have a view, say a <code>TreeViewer</code> in there that is going to be populated with some content. You do the following:</p>

<p>
<script src="https://gist.github.com/3946901.js"> </script>
</p>

<p>All is great, we have a content provider which basically allows you to find children and parents in your Tree, and the LabelProvider which displays the right image and label for each item. </p>

<p>The content provider is notified when you change anything in the tree, but how about the other way?</p>

<p>So say I have a background process that updates <code>MyDataStore</code>? How do you then tell the tree to refresh?</p>

<p>This is something that has been bugging me for a long while and today I come up with a quick solution, which I hope works. </p>

<p>First off, we want to somehow subscribe to any changes that <code>MyDataStore</code> might recieve. To do that you can make <code>MyDataStore</code> Observable.</p>

<p>Now whenever MyDataStore is changed (for example, when someone calls the <code>updateMeSomehow()</code> method) you should also add the following calls within the method:</p>

<p>
<script src="https://gist.github.com/3946919.js"> </script>
</p>

<p>Now in your View, you can add a new observer, that will now have the <code>update()</code> methop triggered whenever something changes in myDataStore!</p>

<p>
<script src="https://gist.github.com/3946926.js"> </script>
</p>

<p>Now that&#8217;s not the end of it. If you were to call (as you would presume) <code>myTreeViewer.refresh()</code> you will get a <code>org.eclipse.swt.SWTException: Invalid thread access</code> error. That is because the TreeView is running in a UI thread, and the thread that updated your DataStore is probably in a different thread (usually). So what you need to do is go back to the Display thread and do the update asynchronously. </p>

<p>I know there are few people out there doing this, but hopefully this will help you, since I couldn&#8217;t find this answer that easily (in completeness).</p>

<p>References:
	<ul>
		<li><a href="http://docs.oracle.com/javase/1.4.2/docs/api/java/util/Observable.html" title="Observable (Java 2 Platform SE v1.4.2)">java.util.Observable</a></li>
		<li><a href="http://www.vogella.com" title="Java, Eclipse, Android and Web programming tutorials">Vogella</a>, a great site for Eclipse related stuff</li>
		<li><a href="http://stackoverflow.com/questions/6292523/eclipse-plug-in-how-to-update-a-view-once-a-job-is-complete" title="java - Eclipse plug-in: how to update a view once a Job is complete - Stack Overflow">Stack Overflow question</a></li>
	</ul>
	
	</p>