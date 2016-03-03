---
layout: post
title:  "Ben Forta and Allan Manning at London CFUG"
uid:	"8A9792AB-B1FA-AF78-58C037A392F4BC28"
date:   2005-06-24 11:05 AM +0000
categories: coldfusion
---
The other evening Ben Forta and Allen Manning presented some interesting things at the London CFUG. 

The meeting was packed out this time and Allen presented a very interesting RIA that Prismix have been working on, which is built upon a three tier architecture, with the Presentation Layer in Flex, Business Layer and Integration (Data) Layers built in CF. I was very interested in the way that Allen built his app using VO (Value Objects) and CFCUnit. Using CFCUnit the whole development is done in a Test case, so that each CFC can be tested and more tests are added unitl the CFC "passes" all the tests.

The Integration layer was a self-made system that resembled Hibernate. Which I thought was very interesting in creating VO's and letting the Integration layer figure out all the SQL functions for creating, reading, updating and deleting records. Nice one Allen!

Afterwards Ben Forta did his presentation on the (asynchronous) Event Gateways that are available in ColdFusion MX 7 (mind you, only in Enterprise). The gateways open up very interesting possibilites in integrating CF with other systems such as Instant Messaging, Telnet, SMS, JMS amongst others. So now CF is not only browser based!

Must look more into the VO/DTO pattern in CF applications as this does seem to be the way to go. No more pesky SQL statements!