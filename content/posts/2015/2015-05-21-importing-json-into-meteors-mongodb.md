---
title: Importing JSON into a Meteor MongoDB
layout: post
categories: 
permalink: importing-json-into-meteors-mongodb
---
[Meteor](http://meteor.com) is a great way to develop fast real-time appliations using JavaScript on both the client and server side. When you are developing these applications it's easy to create new collections of information by adding items doing the following script either in the client or server:

	Collection.insert({key:value});

But this is obviously not the most effective way to add lots data!

[MongoDB](http://www.mongodb.com/) has a tool called `mongoimport` which you can use to import data straight into a MongoDB instance itself, but that tool doesn't come with Meteor. What to do???

The answer is actually rather simple, all you have to do is install MongoDB but you don't need to run an instance of it, as you are already doing that with your Meteor installation.
Once you have it installed check in the `<MongoDB Install>/bin` path and you should see the `mongoimport` executable. Now, to import some json you need to tell it the host and database of the Meteor instance of MongoBD:

	mongoimport -h localhost:3001 --db meteor --collection tweets --type json --file exampletweets.json --jsonArray
That is a long command so let's break it down:

* `mongoimport` is obviously the command.
* `-h` is the host and port
* `--db` is the database, in this case it's meteor
* `--collection` is the collection we are going to be importing into
* `--type` is the format of the file we will be importing, in this case a json file of tweets
* `--jsonArray` MongoDB has a strange idea of what a json format is, if you omit this MongoDB will want a file in the format:
	
		

		{key:value}
        {key:value}
        {key:value}

Which I am sure you can tell is not JSON formatted (notice there are no commas nor are you in an array!). 
So if you want proper JSON format like:

    [
      {key:value},
      {key:value},
      {key:value}
    ]
    
You then need to add the `--jsonArray` so that MongoDB accepts it as plain JSON.

On a side note here, if you want to find out what host and port your Meteor instance of MongoDB is running on you just have to do:

		meteor mongo
And you should get a response like:

    MongoDB shell version: 2.6.7
    connecting to: 127.0.0.1:3001/meteor
    meteor:PRIMARY>
    
Hope that helps!