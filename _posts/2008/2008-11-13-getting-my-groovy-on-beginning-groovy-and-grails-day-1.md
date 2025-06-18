---
layout: post
title:  "Getting my Groovy on. Beginning Groovy and Grails: Day 1"
uid:	"94E0D965-EBA1-548B-762E7338268456D3"

categories: frameworks
permalink: getting-my-groovy-on-beginning-groovy-and-grails-day-1
---
<p>I decided that since it's now hit winter, and the nights close in so early, that I should spend one hour each evening learning about something. Since <a title="ArgumentCollection - Broadchoice Engineering: Plain Text and HTML Emails via Spring" href="http://blog.broadchoice.com/index.cfm/2008/11/10/Plain-Text-and-HTML-Emails-via-Spring">Ray seems to be getting into Groovy</a> I thought to myself that I might be good with CF and ok with Java, I really needed to learn some other technologies. This helps me get my thinking hat on even when I am coding in CF. Revitalize the old noodle so to speak.
</p>
<p>
Now, if have heard of Groovy you might say "But it's just like Java". Well, yes and no. I think <a title="Groovy - Home" href="http://groovy.codehaus.org/">Groovy</a> is closer to ColdFusion in its dynamic/runtime approach than it is on Java. I do think that sometimes we are looking too much at the Java world and copying a lot of the OO ideas without thinking about how a dynamic language might solve that. Hence this little foray into learning a new language!</p>
<p>
Just so you know, I am working from the book "<a title="Amazon.co.uk: Beginning Groovy &amp; Grails: From Novice to Professional (Expert's Voice in Open Source): C et al Judd: Books" href="http://amazon.co.uk/dp/1430210451">Beginnning Groovy and Grails</a>" by Judd, Nusariat and Shingler.
</p>
<p>
So, what is Groovy? well from reading the book it seems that the Java Developers of the world were jealous of the productivity gained from the dynamic language developers (such as Ruby and PHP) and wanted a way to join those kids whilst maintaining backwards compatibility. Sure, there is more in the book, but go buy it and read it yourselves ;) so along was developed Groovy. The language sits on top of the JVM the same way that java does and in fact, I learned that you can copy and paste your complete Java code into a .groovy file and it will run with no problems! </p>
<p> The syntax is much cleaner too, compared to java, compare the following examples (to just get a class created):
</p>
<p>
Java:</p>
<p>
<code>
package uk.co.markdrew.testings;
public class Todo\{
	private String name;
	private String note;
	
	public Todo()\{}
	
	public Todo(String name, String note)\{
		this.name = name;
		this.note = note;
	}
	
	//imagine the getters and setters, another 12 lines of code which I cant be bothered to write
}</code></p>
<p><code>
</code>
Groovy:
<code>
public class Todo\{
	String name;
	String note;
}	</code></p>
<p><code>
</code>
Right... that is about it... the groovy class already has a constructor, and the variables can be accessed either directly or through what seems to be auto generated getters and setters. YAY for less code!
</p>
<p>
So, how I got started? Well I downloaded the <a href="http://dist.groovy.codehaus.org/distributions/installers/cross-platform/groovy-1.5.7-cross-platform-installer.jar">cross platform installer</a> from the <a title="Groovy - Download" href="http://groovy.codehaus.org/Download">Groovy website</a>
</p>
<p>
Running through that it then asks you to add GROOVY to your environment variables and GROOVY/bin to your PATH variable, if you are on OS X you can do it as detailed <a title="OS X: Change your PATH environment variable | Mac system administration | Tech-Recipes" href="http://www.tech-recipes.com/rx/2621/os_x_change_path_environment_variable/">here</a></p>
<p><a title="OS X: Change your PATH environment variable | Mac system administration | Tech-Recipes" href="http://www.tech-recipes.com/rx/2621/os_x_change_path_environment_variable/"></a>
Once I did that, I was able to go to the terminal and type "groovy" and it picked it up and everything was super duper cool!</p>
<p>
Then I went to get the <a title="Groovy - TextMate" href="http://groovy.codehaus.org/TextMate">TextMate bundles</a> since I prefer learning a new language as simply as possible without needing to drop down into an IDE (learn the basics then you need the power of an IDE)</p>
<p>My first program was to make a Todos.groovy file with the following:</p>
<p>
<code>
	public class Todo \{
		String name
		String note
	}
	def todos = [
		new	Todo(name:"1", note:"one"),
		new Todo(name:"2", note:"two"),
		new Todo(name:"3", note:"three")
	]
	todos.each \{ 
		println	"$\{it.name} $\{it.note}"
	}
</code></p>
<p><code></code>
That's nice right? nice and neat!
I then learned about loops, Sets, Maps, Lists and string concatenation which you can see in the line (println	"$\{it.name} $\{it.note}") above.
Well, that is it so far, I am continuing to read the book and will move onto regular expressions (the bane of my life) tonight!</p>