---
layout: post
author: Mark Drew
title: Using Azul Zulu JRE with Docker Lucee
categories: 'lucee jre azul zulu docker '
header-img: img/img_0474.jpeg
subtitle: Azul Zulu is a smaller JRE than the OPENJDK one so this is one way to reduce
  our docker file size
permalink: azul-zulu-lucee-docker

---
In our previous posts about building a lucee docker image and adding a password we got our image down to a comfortable 239MB  
  
In the cfml slack Brad Wood mentioned that are other projects to bring down the size of Lucee, such as [Pete Freitag's Minibox]() which comes in at about 78 Mb! Great work! 

These series of posts are really not to compete with that. They are serving to document some practices and methods I use as well as to do some investigations that can fit in other development pipelines I am using.

In that conversation, Brad also mentioned about [Azul Zulu JDK](https://www.azul.com/downloads/?package=jdk). Which turns out to be only about 40MB! Let's give THAT a spin and see if everything works as expected!

As previously mentioned we only need the JRE so that is what I downloaded into our image: 

    FROM alpine as base
    #Install zulu JRE
    ADD https://cdn.azul.com/zulu/bin/zulu18.32.11-ca-jre18.0.2-linux_musl_aarch64.tar.gz zulu_jre.tar.gz
    RUN tar -xzvf zulu_jre.tar.gz
    RUN mv zulu18.32.11-ca-jre18.0.2-linux_musl_aarch64 zulu_jre
    ENV PATH=/zulu_jre/bin:$PATH
    #Set lucee version
    ARG LUCEE_VERSION="5.3.10.28-SNAPSHOT"
    ARG LUCEE_PASSWORD="password"
    # Download Lucee
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
    
    FROM alpine as final
    COPY --from=base /lucee /lucee
    COPY --from=base /zulu_jre /zulu_jre
    ENV PATH=/zulu_jre/bin:$PATH
    ENTRYPOINT [ "/lucee/startup.sh" ]

As usual we are using our alpine base, but now `ADD`ing the Azul zulu JRE and naming it `zulu_jre.tar.gz` . 

We then unzup it and move it to folder called `zulu_jre`, finally we add it to the Path so we can just call `java` from anywhere via `ENV PATH=/zulu_jre/bin:$PATH`

Once done we can do the usual thing we are doing with lucee, and download lucee light, our admin extension and warm up the server by doing `  RUN LUCEE_ENABLE_WARMUP=true /lucee/startup.sh`

That is our jre and lucee prepared. Now we create our final image:
` FROM alpine as final`
Copy both the JRE and Lucee:
```
COPY --from=base /lucee /lucee
COPY --from=base /zulu_jre /zulu_jre
```
And add the jre/bin path to the PATH variable via `ENV PATH=/zulu_jre/bin:$PATH`

And that is it! Once we build this our image has gone down to 184MB! That gives us some room to breathe huh? 

I will say I havent run a suite of tests on this JRE so I cant confirm (nor deny!) if it all works as intended but we shall see. It's always good to add monitoring and telemetry to your docker apps anyway (this will be for a future post)