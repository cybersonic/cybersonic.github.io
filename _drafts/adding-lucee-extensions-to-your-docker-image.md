---
layout: post
author: Mark Drew
title: Adding Lucee Extensions to your Docker Image
categories: lucee extensions docker build
header-img: img/img_0445.jpeg
subtitle: How to add extensions to our Lucee Docker Images
permalink: lucee-extensions-in-docker-images

---
In the [previous post](https://markdrew.io/password-for-lucee-docker), we added a password for Lucee admin, but to do so we needed to backtrack our changes in using lucee-light, back to the full version of Lucee.

So that we can keep the image size down AND add an administrator, we can install just the extension(s) we need. In this case, we will install the Lucee Administrator Extension, you can see it here: [https://download.lucee.org/#CED6227E-0F49-6367-A68D21AACA6B07E8](https://download.lucee.org/#CED6227E-0F49-6367-A68D21AACA6B07E8 "https://download.lucee.org/#CED6227E-0F49-6367-A68D21AACA6B07E8")

In the previous posts, you have seen me use the [ADD command](https://docs.docker.com/engine/reference/builder/#add) in the Dockerfile. This is a  shortcut to adding any file from either your local machine or the internet. The command `COPY` is generally seen as the way to get files into your docker image but `ADD` is very useful when we want to, well, add a file via a URL. There are reasons NOT to use `ADD` since it adds a layer where you could do it all in one RUN command (see [https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#add-or-copy](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#add-or-copy)) but since we are doing a multi-stage build it doesn't matter in this case.

Let's look at the changes in the Dockerfile

    FROM alpine as base
    RUN apk add openjdk11-jre
    ARG LUCEE_VERSION="5.3.10.28-SNAPSHOT"
    ARG LUCEE_PASSWORD="password"
    ADD https://cdn.lucee.org/lucee-express-${LUCEE_VERSION}.zip lucee.zip
    ADD https://cdn.lucee.org/lucee-light-${LUCEE_VERSION}.jar lucee-light.jar
    RUN mkdir /lucee && \
         unzip lucee.zip -d /lucee && \
         chmod +x /lucee/*.sh && \
         chmod +x /lucee/bin/*.sh && \
         rm -f lucee.zip && \
         rm -rf /lucee/__MACOSX && \
         mv lucee-light.jar /lucee/lib/ext/lucee.jar && \
         mkdir -p /lucee/lucee-server/context/ && \
         mkdir -p /lucee/lucee-server/deploy/
    RUN echo ${LUCEE_PASSWORD} > /lucee/lucee-server/context/password.txt 
    # Add the admin extension
    ADD https://ext.lucee.org/lucee.admin.extension-1.0.0.3.lex /lucee/lucee-server/deploy/lucee.admin.extension-1.0.0.3.lex
    COPY webroot /lucee/webapps/ROOT
    RUN LUCEE_ENABLE_WARMUP=true /lucee/startup.sh
    
    FROM alpine
    RUN apk add openjdk11-jre
    COPY --from=base /lucee /lucee
    ENTRYPOINT [ "/lucee/startup.sh" ]ok at the changes in the Dockerfile:

We are still installing everything as usual, but the two additions are:  
`mkdir -p /lucee/lucee-server/deploy/` where we create the deployment directory (since lucee hasn't started up yet and had a chance to create the folder)

And our addition of the Lucee Admin extension via:  
`ADD https://ext.lucee.org/lucee.admin.extension-1.0.0.3.lex /lucee/lucee-server/deploy/lucee.admin.extension-1.0.0.3.lex`

Now when lucee starts up with `LUCEE_ENABLE_WARMUP=true` it will expand it's files AND extract the extension for us.
Once all this is done we move everything back into our final layer and we are ready to rock. And we are now back to a more comfortable 239MB