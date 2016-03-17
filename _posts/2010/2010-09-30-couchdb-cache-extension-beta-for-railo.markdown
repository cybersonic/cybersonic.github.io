---
layout: post
title:  "CouchDB Cache Extension (Beta) for Railo "
uid:	"FC538DF1-0956-465C-B8BE8E8A87A4D6D0"
date:   2010-09-30 05:08 AM +0000
categories: railo,couchdb,getrailo
permalink: couchdb-cache-extension-beta-for-railo
---
<p>
<img src="http://preview.getrailo.org/logos/couchdb-logo.png" alt="" align="left" /> I have spent a while working on this extension and after a hiatus of client work I managed to get it all uploaded and documented onto the <a title="Railo CFML Documentation Wiki - extensions:couchdb" href="http://wiki.getrailo.com/wiki/extensions:couchdb">Railo Wiki</a>. 
</p>
<p>
CouchDB is a noSQL database that allows you to store complex documents and get them by key (and revision), it is very performant and easy to replicate which makes it a great alternative as a distributed caching system, hence we created the CouchDB Cache Extension! 
</p>
<p>
It is fairly simple to install, you just have to add the preview extension provider (http://preview.getrailo.org/ExtensionProvider.cfc) to the list of your Railo Extension Providers and then under your Extensions/Applications section you should now see the CouchDB Cache extension, just install that, create a Cache Connection and start using it for your Objects, Templates, Queries etc! 
</p>
<p>
There are more detailed installation instructions over at the Wiki, why not check it out? <a title="Railo CFML Documentation Wiki - extensions:couchdb" href="http://wiki.getrailo.com/wiki/extensions:couchdb">http://wiki.getrailo.com/wiki/extensions:couchdb</a>
</p>