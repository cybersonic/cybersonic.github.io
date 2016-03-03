---
layout: post
title:  "KeyBindings in Eclipse"
uid:	"8A97A567-E112-8884-89B21B5FA888DBE6"
date:   2005-12-04 11:05 AM +0000
categories: cfeclipse
---
Keybindings have changed in Eclipse 3.1, so currently the way we are doing keyboard shortcuts is a bit depricated. 

I am currently looking at sorting out the keybindings so they work across Mac and PC's so that they are a bit more consistent.  Spike metioned in a post that:
<blockquote>
Getting keybindings to work correctly in plugin.xml is a bit of a black
art, but you're more than welcome to try.

If you do have a go at it, the Eclipse 3.x way of defining keys has changed.

Instead of using Ctrl you should use M1.

There are 4 modifier keys M1, M2, M3 and M4.

M1 corresponds to Ctrl on windows and I think cmd on Mac.
</blockquote>

I have been doing a bit of digging and for anyone that wants to help there is a good document from <a href="http://www.magma.ca/~pollockd/desudation.html">Douglas Pollock</a> who works at IBM on Eclipse that <a href="http://www.magma.ca/~pollockd/despumate/bindingsHowTo.html">describes</a> the changes he has made to the keyBinding architecture.

More to come on this topic once I get some results.

*UPDATE: Another link to the Eclipse documentation on this <a href="http://help.eclipse.org/help31/index.jsp?topic=/org.eclipse.platform.doc.isv/guide/wrkAdv_keyBindings.htm">topic</a>