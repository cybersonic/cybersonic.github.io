---
title: Converting Data with Node, Streams and Pipes
layout: post
permalink: converting-data-with-node-streams-and-pipes
header-img: img/pipes.jpg
subtitle: I had to import over 5Gb of data into MongoDB. This is how I did it.
---
In a recent project, I had to import a lot of data into MongoDB. What is a lot of data? Well, how about the names and addresses of all the doctors and therapists in the USA? This is called [NPI data](http://download.cms.gov/nppes/NPI_Files.html "NPI Files") and the import CSV file can be over 5Gb by itself. 

Importing CSV files into MongoDB can take a lot of time (especially when you have these many!) so one avenue of approach is to first convert it to a MongodB Extended JSON file and have found it to be quicker to import. But how to convert so much data to JSON? For a start, don't even think of opening that up with Microsoft Excel! 

There were very few tools that are able to manage that much data. Various scripts timed out until I came across the idea of using streams in Node. This is not something I have done much of but if you think of pipes in the command line as that funny little symbol `|` that lets you pass the results of one operation to another. 

So for example:

	cat npi.csv |  grep Mark

This would pass all the lines of npi.csv to the `grep` command and look for "Mark", it takes a while but you know it will eventually spit stuff out. You can now even output that out to a file (rather than just the screen) with:

    cat npi.csv | grep Mark > results.text

 In node, you can the idea of a [stream.Transform](https://nodejs.org/api/stream.html#stream_class_stream_transform "Stream Node.js v5.8.0 Manual &amp; Documentation") to pass data from the input to the output, and you do some transformation in the middle. In fact you can have multiple transformations that you pipe from one to the other, this looks like:

    var Transform = require('stream').Transform;
    var parser = new Transform({objectMode:true});
    
    parser._transform = function(data, encoding, done){
        this.push("Hey World!\n");
        done();
    }
    
    process.stdin
        .pipe(parser)
        .pipe(process.stdout);

You can now pipe the CSV data in as so:

    cat npi.csv | node convert.js

We are not converting much yet, and the result, despite it being millions of lines will just say "Hey World".
For this we need to parse the data first with 'csv-streamify' which we add with npm:

    npm install -s csv-streamify

And then add to our script:

    var Transform = require('stream').Transform;
    var csv = require('csv-streamify'); 
    var csvToJSON = csv({objectMode:true}); //* add the csvToJSON function
    var parser = new Transform({objectMode:true});
    
    parser._transform = function(data, encoding, done){
        console.log(data);  //** dump it as a test
        //Do some processing 
        this.push("hello"); //Pass the resultant data back to the pipe
        done();
    }
    process.stdin
        .pipe(csvToJSON) //*** call the CSV to JSON
        .pipe(parser)
        .pipe(process.stdout);

Once we have `require`'d the csv-stramify we can get a function from it to convert the incoming stream lines into individual JavaScript objects. This is half way there, we can then add the JSONSTream into the mix! 

    npm install -s JSONStream

Which will convert the JSON to a nice string for us! 

    var Transform = require('stream').Transform;
    var csv = require('csv-streamify');
    var JSONStream = require('JSONStream');

    var csvToJSON = csv({objectMode:true});
    var parser = new Transform({objectMode:true});
    var jsonToStrings = JSONStream.stringify(false);

    parser._transform = function(data, encoding, done){
        //Do some processing 
        this.push(data);
        done();
    }

    process.stdin
        .pipe(csvToJSON)        //Convert the input into JSON
        .pipe(parser)           //Parse the contents
        .pipe(jsonToStrings)    //Convert the JSON data we pushed back into a string
        .pipe(process.stdout);

Now we can convert our big CSV file to JSON. 

I am actually doing a bunch of processing in the `_transform` function, such as creating the proper JSON document for MongoDB and removing any empty fields etc etc, but I have left that out for clarity.

Finally, we can convert our data and save it to a new file 
    
    cat npi.csv |  node convert.js > npi.json

This will obviously take a while to process but at least it will process it! 