<cfoutput>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <cfset description = post.description ?: globals.blogDescription>
    <cfset title = page.meta.title?:"">
    <cfoutput>
    <title>#title?:""# - #globals.blogName ?: ""#</title>
    </cfoutput>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <meta name="description" content="#description#">
    
    <cfset canonicalPath = page.canonicalUrl ?: "/" >
    <cfset canonical = "#globals.baseUrl##canonicalPath#">
    <link rel="canonical" href="#canonical#">
    <meta name="robots" content="index,follow">
    <link rel="alternate" type="application/rss+xml" title="#encodeForHtml(globals.blogName)#" href="#globals.baseUrl#/feed.xml">

    <!--- Open Graph --->
    <meta property="og:type" content="article">
    <meta property="og:title" content="#encodeForHtml(title)#">
    <meta property="og:description" content="#encodeForHtml(description)#">
    <meta property="og:url" content="#canonical#">
    <meta property="og:image" content="/img/about-bg.jpg" />
    <meta property="og:logo" content="/img/blog-header-og.jpg" />


    <cfif structKeyExists(post, "header_img") and len(trim(post.header_img))>
    <meta property="og:image" content="#globals.baseUrl#/#post.header_img#">
    </cfif>
    <cfif structKeyExists(post, "date")>
    <meta property="article:published_time" content="#encodeForHtml(post.date)#">
    </cfif>
    <cfif structKeyExists(post, "updated")>
    <meta property="article:modified_time" content="#encodeForHtml(post.updated)#">
    </cfif>
    <cfif structKeyExists(post, "author")>
    <meta property="article:author" content="#encodeForHtml(post.author)#">
    </cfif>
    <cfif structKeyExists(post, "tags")>
    <meta property="article:tag" content="#encodeForHtml(post.tags)#">
    </cfif>
    
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="#encodeForHtml(title)#">
    <meta name="twitter:description" content="#encodeForHtml(description)#">
    <cfif structKeyExists(post, "header_img") and len(trim(post.header_img))>
        <meta name="twitter:image" content="#encodeForHtml(globals.baseUrl & "/" & post.header_img)#">
    </cfif>
    <cfset twitter_author = config.author?.twitter >
    <!--- <cfif structKeyExists(config.twitter, "twitterSite")>
        <meta name="twitter:site" content="#encodeForHtml(globals.twitterSite)#">
    </cfif>
    --->
    <cfif !isEmpty(twitter_author)>
        <meta name="twitter:creator" content="@#twitter_author#">
    </cfif>    

</cfoutput>