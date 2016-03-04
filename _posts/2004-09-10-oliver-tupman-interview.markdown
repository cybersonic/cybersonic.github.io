---
layout: post
title:  "Oliver Tupman Interview"
uid:	"8A9788D7-DED0-AF9A-8CBAD761B6EEADF7"
date:   2004-09-10 11:04 AM +0000
categories: cfeclipse
permalink: oliver-tupman-interview
---
Last night a special event happened... CFEclipse version 1.1.16 was released including a number of bug fixes and more importantly new features.
You can use your ecplipse update feature or download it from: <a href="http://www.spike.org.uk/downloads/cfeclipse1.1.16.zip">http://www.spike.org.uk/downloads/cfeclipse1.1.16.zip</a>
<p>Some of the new features that were released are:</p>
<ul>
<li>Context insight for scope variables: just type SESSION. or APPLICATION. to get a list of the available scope variables</li>
<li><span class="style2">NEW!</span> Component insight available for pre-defined CFC's via user.xml: Just add your own CFC in to the user.xml and hit Ctrl+F5, that will reload all the Dictionaries to update the code completion etc</li>
<li><span class="style2">NEW!</span> cfinclude 'template' attribute proposals list directories & files:when adding a <span class="style1">&lt;cfinclude template=""&gt;</span> now lists all the files and directories! Handy!! You can also enter a non existent file name in there and if you right click you will see an option to "Open File...", if the file does not exist.. it will create it for you! Double Handy!

</li>
</ul><p><span class="style2">NEW!</span> Can change the editors background colour (cheers to Mulcahey Robert J.): Under Window -&gt; Preferences -&gt; CFEclipse -&gt; CFML Colours



<span class="style2">NEW!</span> Drag and drop text from outside the editor <strong>beta</strong> and may only work on Mac: This does work on PC's as I tried it from notepad.. not sure what would happen from Rich Text documents such as Word or Excel</p>
<p><strong></strong><span class="style2">NEW!</span> Snip behavior modified - single character triggers supported: Create a snippet called (for example "link") with the trigger "a" and the Snippet Starting Block as: <strong>&lt;a href="$$\{link}"&gt;$$\{display}&lt;/a&gt;</strong> you can now just type a + Ctrl + &lt;space&gt; and you get your snippet insertion</p>
<p><span class="style2">NEW!</span> Snip dialog has scroll bars for edit boxes, multi-line snips inserted with same indent as first line: This is great if you have very long snippets!</p>
<p><span class="style2">NEW!</span> F8 saves & refreshes browser if scribble file is already active: Check out Spike's <a href="http://www.spike.org.uk/cfeclipse/space/Scribble+pad" target="_blank">post</a> on the <a href="http://www.spike.org.uk/cfeclipse/space/" target="_blank">CFEclipse Wiki</a></p>
<p><span class="style2">NEW!</span> Now there's only one dialog per snippet for variables &amp; drop-downs for enumerator values: if you are a heavy user of Snippets this is a must!

</p>
<p>With this release I decided to interview one of the developers of CFEclipse, Oliver Tupman and get some details of his involvement and opinions on the direction of CFEclipse </p>
<p><strong>Mark Drew: In your own words what is CFEclipse? </strong>

<strong>Oliver Tupman:</strong> CFEclipse is an open-source attempt at creating the perfect coding environment for CFML coders. Of course there's also cross-over into the world of client-side stuff (JS, CSS, etc.).

</p>
<p><strong>MD: How did you get involved in the project? </strong>

<strong>OT:</strong> My ColdFusion experience started something like a year ago when I was asked to develop my company's new Quality Control intranet. I tried a whole bunch of IDEs including Dreamweaver, HomeSite, PrimalScript,jedit, etc and ended up using the tried and tested Textpad.

Then Rob released the first version of CFE. I tried it out and said to myself"doh, no CFScript insight". Asked Rob for the code, played around and got hooked. </p>
<p>

<strong>MD: What were you doing before this/what is your background?

</strong><strong>OT: </strong>I'm the youngest of the development team so my background probably isn't as impressive as everyone else. Currently I'm two years out of University working for a Geotechnical company using ColdFusion, MFC C++,.NET and a small bit of Java/FoxPro/everything. Prior to this I did PHP,C & C++ and some PERL.

<strong>MD: Why Eclipse as the IDE?
OT:</strong> Originally Eclipse held no benefits for me - why would a CF and Microsoft developer want it? There wasn't any CF support. Compared to Visual Studio 6 it is rather slow and hey, apart from CF I don't do any non-MS work.

But compare Eclipse to the behemoth that is MS.NET and now you're talking! I should seriously start looking into C# on Eclipse, but unfortunately I don't believe it supports everything I need to be as productive as I am at the moment. </p>
<p>

<strong>MD: What are the best bits?

</strong><strong>OT:</strong> CFE :D The Java support is fantastic. I sit in VS.NET wishing I had that sort of functionality (and then wondering whether I can persuade the boss to buy it for me). The source control support is great as well, I love that feature. Oh, and the fact that it's so extendible.</p>
<p>

<strong>MD: What is coming up next?

</strong><strong>OT: </strong>From my areas of CFE will be improved content assist (aka tag insight,'content assist' is the Eclipse terminology) including - hopefully -basic CSS &amp; JS support. Also coming along nicely is improved file parsing and CFScript block parsing.</p>
<p><strong>MD: Will it support fusebox/MachII?

OT:</strong> Hell yeah. Kinda. Sort of. In time. Basically there's a problem: how much time to devote between core CFE functionality and the support of frameworks. There are so many frameworks, where does one begin? With the one currently in vogue? The most widely used? The answer is probably going to be: the ones that developers are personally using :D One gets into CFE by scratching that itch.

My workplace use FB3 and I have no time to learn new ones, so I'm just sticking to core CFE functionality. I'll throw in extra bits of code to other framework stuff when someone has done the ground work. And I'll always be willing to provide dev help to anyone who wishes to contribute. </p>
<p>

<strong>MD: What is your favourite editor apart from eclipse?</strong>

<strong>OT:</strong> On Windows: Textpad. On *nix: Emacs! </p>
<p><strong>MD: Which other plugins do you use?</strong>

<strong>OT: </strong>Lets see, there's a JavaScript plugin, a CSS plugin, DBExplorer, XPathevaluator, that's about it. </p>
<p><strong>MD: Would you use non open source plugins?</strong>

<strong>OT:</strong> I'm of "tools to be used" opinion with a leaning towards open source. So if there's an open source tool that does the job, then cool. Otherwise I'll use closed source. For example: the XPath plugin is closed source. I think there's an open-source version being developed somewhere too. I'll probably switch to that soon. </p>
<p><strong>MD: What attracts you to the open source movement/ideology?</strong>

<strong>OT:</strong> Originally it was just "hey, its free". Being a poor Uni student that sort of thing really helped. But I wasn't really sure until I started playing with FarCry. Now using FarCry I can see what's happening within the code. I could, if I chose to, trace through the core and see hastate. Very cool.</p>
<p><strong>MD: How do you compare to He3?</strong>

<strong>OT: </strong>CFE compared to He3. I haven't really used He3 properly, and as I don't do any MachII development one of it's core features is of no use to me.Oh, and the CFML stuff in CFE feels more polished than He3. But perhaps it's improved by now. </p>
<p><strong>MD: Who to give feedback/donations to?</strong>

<strong>OT:</strong> Feedback and donations, hmm. Well on the feedback side of things then feel free to e-mail any member of the CFE dev team. We're always happy to hear from people. Alternatively hop along to the CFE project at <a href="http://cfeclipse.tigris.org/" target="_blank">http://cfeclipse.tigris.org/</a> and register. We have a user mailing list that's a good place to sound off.

On the subject of donations then I suspect that its best to mention it to one of the dev team leaders and we'll sort it out from there.</p>