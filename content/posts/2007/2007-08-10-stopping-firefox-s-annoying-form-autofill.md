---
layout: post
title:  "Stopping Firefox's annoying form autofill"
uid:	"8A9AB111-9858-487C-55FCE1FED0CBC222"

categories: webdev
permalink: stopping-firefox-s-annoying-form-autofill
---
When I am developing websites, especially forms, Firefox has this habit of confusing me and wasting a number of minutes of my time by trying to be useful. How you might ask? Well, if you are working on pre-populating a form, say setting options in a select dropdown to selected = "true", Firefox will come along and say something like: "Hey Mark, I saw you posted that form before! I am going to be really annoying and not select any! Even though you told me to!"

Well, there is a simple way to fix this behaviour, all you have to do is go to <a href="about:config" target="_blank">about:config</a> and search for the Preference name "browser.formfill.enable"  and set its value to false (by double clicking on it if you are on a Mac)

This should stop Firefox from pre-filling your forms whilst you are in development