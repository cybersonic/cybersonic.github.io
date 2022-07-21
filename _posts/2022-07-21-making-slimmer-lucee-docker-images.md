---
title: Making slimmer Lucee Docker Images
layout: post
categories: lucee docker dive microservices
header-img: img/img_0323.jpeg
subtitle: How to make nice and slim Lucee Docker images for your fast microservices.

---
In the last few years, I have had some requirements to turn what are essentially command line programs into small microservices. Lucee is GREAT at making services, so to make these microservices I (lazily) decided to take the most direct path, and use Lucee Express.

[Lucee Express](https://download.lucee.org/) is essentially Tomcat and Lucee all ready to run on Windows, macOS and Linux. Download unzip and run basically. This is perfect for this so the first thing I do is make a Docker image for this:

    FROM alpine
    ARG LUCEE_VERSION="5.3.10.28-SNAPSHOT"
    ADD https://cdn.lucee.org/lucee-express-${LUCEE_VERSION}.zip lucee.zip
    RUN mkdir /lucee && \
         unzip lucee.zip -d /lucee && \
         chmod +x /lucee/*.sh && \
         chmod +x /lucee/bin/*.sh && \
         rm -f lucee.zip && \
         rm -rf /lucee/__MACOSX
    COPY webroot /lucee/webapps/ROOT
    RUN apk add openjdk11
    ENTRYPOINT [ "/lucee/startup.sh" ]

To build the docker image above I do: `docker build -t markdrew/lucee-light .`

Let me run through it quickly:

1. `FROM alpine`: Uses the alpine base image. This is a super tiny Linux distro
2. `ARG LUCEE_VERSION="5.3.10.28-SNAPSHOT"` : this allows me to add the version when I build the image. I can just change the version of lucee by passing `--build-arg LUCEE_VERSION=5.4` for example
3. `ADD https://cdn.lucee.org/lucee-express-${LUCEE_VERSION}.zip lucee.zip` downloads the lucee version to lucee.zip
4. The next `RUN` line is more complex, but basically unzips lucee.zip and makes the startup `.sh` files executable and then deletes the lucee.zip and extra `__MACOSX` folder that was uncompressed from the zip.
5. `COPY webroot /lucee/webapps/ROOT` we copy our code to the lucee web root. This is our app so we have to run it.
6. `RUN apk add openjdk11` We install the JDK! Cant run lucee without a JDK
7. `ENTRYPOINT [ "/lucee/startup.sh" ]` finally we set the entry point, the script we run when we start.

And that is it. So after building, we get the following when we run `docker images`

    REPOSITORY             TAG       IMAGE ID       CREATED         SIZE
    markdrew/lucee-light   latest    b7085aaed9a9   9 minutes ago   648MB

Ok, 648MB... it's ok but not good enough really. A colleague ([Zac Spitzer](https://dev.lucee.org/u/zackster/summary "Zac Spitzer")) mentioned that we don't actually need the full **JDK**, so we went to get just the **JRE**. This changed the line: `RUN apk add openjdk11` to `RUN apk add openjdk11-jre`

This gave a nice cut down:

    REPOSITORY             TAG       IMAGE ID       CREATED       SIZE
    markdrew/lucee-light   latest    71e1b58415f3   2 hours ago   355MB

355MB! That's a great improvement!

Zac also reminded me that since I am basically not using any extensions such as database drivers or whatever, I can download a "light" version of Lucee, so I can now add the jar download for lucee-light after I download the express version:

    ...
    ADD https://cdn.lucee.org/lucee-express-${LUCEE_VERSION}.zip lucee.zip
    ADD https://cdn.lucee.org/lucee-light-${LUCEE_VERSION}.jar lucee-light.jar
    ...

And in the RUN command where we expand Lucee, we can swap out the "fat" lucee.jar with the "light" one.

    RUN mkdir /lucee && \
    ...
        rm -f /lucee/lib/ext/lucee.jar && \
        mv lucee-light.jar /lucee/lib/ext/lucee.jar && \
    ...

Ok! This should remove a big chunk of the filesize!

After building I get...

    REPOSITORY             TAG       IMAGE ID       CREATED        SIZE                
    markdrew/lucee-light   latest    ae4bfae156db   1 second ago   320MB

Ok, not the greatest improvement. What is going on? I was expecting a lot less in there. Let's investigate!
There is a great tool to inspect docker images called [dive](https://github.com/wagoodman/dive "dive") that is perfect for this. It will look into our Docker image and tell us what is going on.

Let's inspect our image:
`dive markdrew/lucee-light`  
![](/img/screenshot-2022-07-20-at-22-25-44.png)

If we look at the summary it says:

    Image name: markdrew/lucee-light
    Total Image size: 320 MB
    Potential wasted space: 111 MB
    Image efficiency score: 65 %

Where is that 111MB of wasted space coming from? Well, despite deleting the zip files we don't need they are still defined in each layer. They were added at the top of the previous one and are still loitering in our image. One way to remove these is to create a [multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) script.

Here is the script with changes:

    FROM alpine as base
    ARG LUCEE_VERSION="5.3.10.28-SNAPSHOT"
    ADD https://cdn.lucee.org/lucee-express-${LUCEE_VERSION}.zip lucee.zip
    ADD https://cdn.lucee.org/lucee-light-${LUCEE_VERSION}.jar lucee-light.jar
    RUN mkdir /lucee && \
         unzip lucee.zip -d /lucee && \
         chmod +x /lucee/*.sh && \
         chmod +x /lucee/bin/*.sh && \
         rm -f lucee.zip && \
         rm -f /lucee/lib/ext/lucee.jar && \
         mv lucee-light.jar /lucee/lib/ext/lucee.jar && \
         rm -rf /lucee/__MACOSX
    COPY webroot /lucee/webapps/ROOT
    FROM alpine
    RUN apk add openjdk11-jre
    COPY --from=base /lucee /lucee
    ENTRYPOINT [ "/lucee/startup.sh" ]

The main changes are:

1. `FROM alpine as base` we create a base image where we do the Lucee installation
2. `FROM alpine` again. This is our next stack (or final image)
3. `COPY --from=base /lucee /lucee` we now copy from our base image the Lucee folder we prepared. This will be our final image which ignores all the previous steps, which were there just to build the `/lucee` folder. Those steps don't need to live on in our final image.

After building we get:

    REPOSITORY             TAG       IMAGE ID       CREATED        SIZE                 
    markdrew/lucee-light   latest    deac63b18892   1 second ago   210MB

210MB vs. 648MB. I will buy that for a dollar!

Ok, let's start it up! `docker run --rm --name lucee-light markdrew/lucee-light`

This takes: 1604 ms

Not bad, but we could pre-warm our image when we build it. This would expand all the required files that lucee needs and let lucee do whatever config it needs to do at startup. We don't need to do this every time we start a container, so let's add it to our build!

We need to add the warmup before our `ENTRYPOINT`

    COPY --from=base /lucee /lucee
    RUN LUCEE_ENABLE_WARMUP=true /lucee/startup.sh
    ENTRYPOINT [ "/lucee/startup.sh" ]

The command `RUN LUCEE_ENABLE_WARMUP=true /lucee/startup.sh` sets an environment variable called `LUCEE_ENABLE_WARMUP` and then runs lucee. This means Lucee will start, warmup and then shut down.

Let's try this build :

    REPOSITORY             TAG       IMAGE ID       CREATED                  SIZE         
    markdrew/lucee-light   latest    3d97c6111b99   Less than a second ago   239MB

Ok, the size has increased a little, which will be the addition of new files created by lucee. When we start up this image it now takes 1194 ms. Nice! 410 ms off our speed, nearly cut down by a third in this case!

I realise there might be even more speed improvements for our light image (I would love to hear them!) but hopefully this post has shown you some ideas for your own images and adventures with Lucee!