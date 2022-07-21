---
layout: post
author: Mark Drew
title: Adding a password to your Lucee Docker images
categories: lucee docker password
header-img: img/img_0102.jpeg
subtitle: Lucee is locked by default. Let's add a password so we can get into the
  admin!
permalink: password-for-lucee-docker

---
In the previous post I created a super slim image for Lucee in Docker. This image has a "lucee light" version which doesn't have the admin. Let's say we need the admin, so we are going to go back and build a "tubby" version of lucee. 

So let's do that!

Let's suppose we have the following docker file (I go over all the steps in my previous post):

    FROM alpine as base
    ARG LUCEE_VERSION="5.3.10.28-SNAPSHOT"
    ADD https://cdn.lucee.org/lucee-express-${LUCEE_VERSION}.zip lucee.zip
    RUN mkdir /lucee && \
         unzip lucee.zip -d /lucee && \
         chmod +x /lucee/*.sh && \
         chmod +x /lucee/bin/*.sh && \
         rm -f lucee.zip && \
         rm -rf /lucee/__MACOSX && 
    COPY webroot /lucee/webapps/ROOT
    FROM alpine
    RUN apk add openjdk11-jre
    COPY --from=base /lucee /lucee
    RUN LUCEE_ENABLE_WARMUP=true /lucee/startup.sh
    ENTRYPOINT [ "/lucee/startup.sh" ]

The code above is enough to get our image running, so let's build and start the image:

To build it: `docker build -t markdrew/lucee-light .`
To run it: `docker run --rm --name lucee-light -p 8989:8888 markdrew/lucee-light`

Now when we head to http://localhost:8989/lucee/admin/server.cfm?action=overview to view our admin we get: 

![](/img/screenshot-2022-07-21-at-13-58-14.png)