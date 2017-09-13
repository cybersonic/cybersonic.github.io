---
title: cfscript.me and Sublime text
layout: post
subtitle: Get rid of those pesky tags for some smooth script
---

I am not sure how many people know about this but one of the things that come up in the issue tracker for the most awesome [CFML package](https://github.com/jcberquist/sublimetext-cfml/issues/73) for Sublime Text was the ability to convert tag based CFML documents to script automagically! 

The site, developed by [Peter Freitag](https://www.petefreitag.com/) is called [cfscript.me](http://cfscript.me/) (the title gave it away didn't it?) and it's pretty awesome! 

<img src="/img/cfscript_me.png">


Now the site is great, but there is also a [Commandbox](https://www.ortussolutions.com/products/commandbox) (which is awesome by the way ) [command over on Forgebox](https://www.forgebox.io/view/cfscriptme-command)! This means you can automatically convert a file by simply doing:

```
box cfscriptme Application.cfc
```

And your ugly tag based `Application.cfc` will look like a scripted beauty in a few seconds! 

Now this is all fine, you can even do folders and what not, but how about doing this right in your editor? If you are using Sublime Text you can go to `Tools > Build System > New Build System ...` and you can then create a new file as follows:

```
{
	"shell_cmd": "box cfscriptme sourcePath=\"$file_name\" force=true",
	"selector": "embedding.cfml"
}
```

Now all you have to do is click `cmd + b` and after a few seconds... magic! Why not give it a try?