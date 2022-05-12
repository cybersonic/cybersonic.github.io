---
title: Debugging Bitbucket Pipelines locally
layout: post
categories: bitbucket pipelines devops docker
header-img: ''
subtitle: Debugging your pipelines in bitbucket can be a pain, here is one simple
  trick that can ease it a bit!

---
So debugging [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) is a pain.

If you have ever developed complex pipelines sometimes the odd things catch you out, for example, recently the version of `jq` ([https://stedolan.github.io/jq/](https://stedolan.github.io/jq/ "https://stedolan.github.io/jq/")) installed worked differently in the pipeline than on my local machine (because, of course, it would!)

The answer (after you know it) is somewhat obvious. Run the pipeline image locally! 

If you look at the top of the `bitbucket-pipelines.yml` you will see the following:

      image: atlassian/default-image:2
      options:
       ...
      definitions:

This means that the default image that is used to run most of your pipelines is `atlassian/default-image:2` !

Therefore we can run our code by running the image above:

     docker  run -it atlassian/default-image:2

And that's it! Now you can pass environment variables as usual (with `-e` ) or map a volume to your code to see what happens. 

Hope that saves you some more minutes today!