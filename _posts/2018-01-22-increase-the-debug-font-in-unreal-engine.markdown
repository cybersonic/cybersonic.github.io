---
title: Increase the Debug Font in Unreal Engine
layout: post
categories: ue4 unrealengine gamedev indiegamedev
header-img: img/UE4TinyFont.jpg
subtitle: How to stop going blind and see the debug in the right size
---
Since I updated to Unreal Engine 4.18 for a project I am working on the debug font has been tiny! This is on my iMac at 5K and before you start giving me the old "Hur hur! It's a Mac! You can't do no game dev on that!" it's also happening on my Dell Inspiron. It seems to stem from the fact that they are high DPI displays on both machines which somehow means that all the Print String statements one loves to use to see what is going on now become so tiny that I can barely make them out. 



This has led to a quest on increasing this font so I can get back to the bad practice of putting debug out on screen. 

This morning I finally found the answer, in part thanks to a clue by <a href="https://twitter.com/d0oo0p">@d0oo0p</a> that mentioned that it was using the default size of Small Font. 

So I looked in the Unreal Editor Preferences but no dice. 

The next place I looked (wouldn't be there surely?) was in the Project Settings and after a bit of noodling... I found it. 

To change it go to: 
1) You go to Edit->Project Settings...
2) Under Engine -> General settings you will see the fonts for your project! 

Find the Small Font (this is the one used for debugging) and double click on the selected font. 
<img src="/img/UE4FontSettings.jpg"/>
You can now go and change the size in the detals panel (under Legacy Font Size).
<img src="/img/UE4FontSettingsDetail.jpg"/>

FINALLY I don't have a font for ants!
<img src="/img/UE4BetterSizeFont.jpg"/>
