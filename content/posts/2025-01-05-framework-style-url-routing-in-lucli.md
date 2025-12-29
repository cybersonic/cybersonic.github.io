---
layout: post
author: Mark Drew
title: Framework-Style URL Routing in LuCLI (No Apache/Nginx Required!)
categories: lucee cli url-rewriting routing
header_img: img/img_0474.jpeg
subtitle: How LuCLI gained built-in URL rewriting thanks to an awesome community contribution
permalink: lucli-url-rewriting.html
draft: true
---

One of the best parts of open source is when someone comes along and adds a feature you didn't even know you needed. That's exactly what happened with LuCLI's URL rewriting support.

A contributor stepped up and added full framework-style URL routing to LuCLI, and now you can run ColdBox, FW/1, ContentBox, or any modern CFML framework without needing Apache or Nginx. Just `lucli server start` and you're good to go.

Let me show you what this means.

## The Problem

If you've ever deployed a CFML framework application, you know the drill:

1. Install Lucee
2. Set up Apache or Nginx
3. Configure mod_rewrite or nginx rewrites
4. Test and debug URL routing
5. Repeat for dev, staging, and production

It works, but it's a lot of moving parts just to get clean URLs like `/blog/my-post` instead of `/index.cfm/blog/my-post`.

For local development, it's even more annoying. You want to quickly spin up a server and start coding, not spend 20 minutes configuring a reverse proxy.

## The Solution

LuCLI now has built-in URL rewriting. Add this to your `lucee.json`:

```json
{
  "name": "my-app",
  "port": 8080,
  "urlRewrite": {
    "enabled": true,
    "routerFile": "index.cfm"
  }
}
```

Start your server:

```bash
lucli server start
```

Done. Your framework routing now works out of the box.

## How It Works

LuCLI uses the tuckey URLRewriteFilter under the hood. When you enable URL rewriting, all requests get routed through your specified router file (typically `index.cfm`) with the `PATH_INFO` CGI variable set correctly.

Here's what happens:

1. User visits: `/blog/my-first-post`
2. LuCLI routes to: `/index.cfm/blog/my-first-post`
3. Your router receives: `cgi.path_info = "/blog/my-first-post"`
4. Your framework handles the routing

Static files (CSS, JS, images) are automatically excluded from rewriting, so everything just works.

## A Real Example

Let's build a simple blog with clean URLs. Create a `lucee.json`:

```json
{
  "name": "my-blog",
  "port": 8080,
  "urlRewrite": {
    "enabled": true,
    "routerFile": "index.cfm"
  }
}
```

Now create your `index.cfm` router:

```cfml
<cfscript>
// Parse the PATH_INFO to determine the route
pathInfo = cgi.path_info ?: "";
route = len(pathInfo) > 1 ? right(pathInfo, len(pathInfo) - 1) : "home";
segments = listToArray(route, "/");
</cfscript>

<!DOCTYPE html>
<html>
<head>
    <title>My Blog</title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body>
    <nav>
        <a href="/">Home</a>
        <a href="/about">About</a>
        <a href="/blog">Blog</a>
    </nav>
    
    <main>
        <cfswitch expression="#arrayLen(segments) > 0 ? segments[1] : 'home'#">
            <cfcase value="home">
                <h1>Welcome to My Blog</h1>
                <p>Latest posts go here...</p>
            </cfcase>
            
            <cfcase value="about">
                <h1>About Me</h1>
                <p>I write about CFML and stuff.</p>
            </cfcase>
            
            <cfcase value="blog">
                <cfif arrayLen(segments) > 1>
                    <!--- Individual post --->
                    <cfset postSlug = segments[2]>
                    <h1>Blog Post: <cfoutput>#postSlug#</cfoutput></h1>
                <cfelse>
                    <!--- Blog listing --->
                    <h1>All Blog Posts</h1>
                </cfif>
            </cfcase>
        </cfswitch>
    </main>
</body>
</html>
```

Start the server:

```bash
lucli server start
```

Now you can visit:
- `http://localhost:8080/` - Home page
- `http://localhost:8080/about` - About page
- `http://localhost:8080/blog` - Blog listing
- `http://localhost:8080/blog/my-first-post` - Individual post

All with clean URLs, no Apache/Nginx configuration needed.

## Framework Integration

The best part? This works seamlessly with existing CFML frameworks. They're already designed to parse `PATH_INFO`, so they just work.

### ColdBox

```json
{
  "name": "coldbox-app",
  "port": 8080,
  "urlRewrite": {
    "enabled": true,
    "routerFile": "index.cfm"
  }
}
```

Your ColdBox routing configuration works exactly as documented. No changes needed.

### FW/1

```json
{
  "name": "fw1-app",
  "port": 8080,
  "urlRewrite": {
    "enabled": true,
    "routerFile": "index.cfm"
  }
}
```

FW/1's SES URLs work right away. Set `generateSES = true` and you're done.

### ContentBox

```json
{
  "name": "contentbox-site",
  "port": 8080,
  "urlRewrite": {
    "enabled": true,
    "routerFile": "index.cfm"
  }
}
```

ContentBox's clean URLs work without any additional configuration.

## Building a RESTful API

You can also use this for RESTful APIs. Here's a quick example:

```cfml
<cfscript>
pathInfo = cgi.path_info ?: "";
route = len(pathInfo) > 1 ? right(pathInfo, len(pathInfo) - 1) : "";
segments = listToArray(route, "/");
method = cgi.request_method;

if (arrayLen(segments) > 0 && segments[1] == "api") {
    cfheader(name="Content-Type", value="application/json");
    
    resource = arrayLen(segments) > 1 ? segments[2] : "";
    id = arrayLen(segments) > 2 ? segments[3] : "";
    
    switch (method) {
        case "GET":
            if (len(id)) {
                // GET /api/users/123
                response = getUserById(id);
            } else {
                // GET /api/users
                response = getUsers();
            }
            break;
        case "POST":
            // POST /api/users
            response = createUser();
            break;
        case "PUT":
            // PUT /api/users/123
            response = updateUser(id);
            break;
        case "DELETE":
            // DELETE /api/users/123
            response = deleteUser(id);
            break;
    }
    
    writeOutput(serializeJSON(response));
    abort;
}
</cfscript>
```

Now you have a RESTful API with clean URLs:
- `GET /api/users` - List users
- `GET /api/users/123` - Get user
- `POST /api/users` - Create user
- `PUT /api/users/123` - Update user
- `DELETE /api/users/123` - Delete user

## The Numbers

Let me show you why this matters:

- **Configuration time**: ~30 seconds (add JSON config, done)
- **Server startup**: ~2 seconds
- **Zero dependencies**: No Apache, Nginx, IIS configuration needed
- **Works everywhere**: Dev, staging, production, Docker containers

Compare that to setting up Apache with mod_rewrite or Nginx with location blocks, and you'll see why this is a game changer for rapid development.

## Excluded Resources

LuCLI automatically excludes common static resources from rewriting:

**File extensions**: `.css`, `.js`, `.jpg`, `.png`, `.gif`, `.ico`, `.svg`, `.woff`, `.pdf`, `.json`, etc.

**Directories**: `/images/`, `/css/`, `/js/`, `/fonts/`, `/assets/`, `/static/`

**Lucee admin**: `/lucee/` paths are protected

This means you don't have to think about it - static files just work.

## Shoutout to the Contributor

This feature was added by a community contributor who saw the need and implemented it. That's the power of open source - someone saw LuCLI could be better and made it happen.

If you're using LuCLI and have ideas for improvements, open an issue or submit a PR. The project is actively maintained and we love contributions.

## Try It Out

Want to test this out? Here's a quick start:

```bash
# Create a new directory
mkdir my-test-app
cd my-test-app

# Create lucee.json
echo '{
  "name": "test-app",
  "port": 8080,
  "urlRewrite": {
    "enabled": true,
    "routerFile": "index.cfm"
  }
}' > lucee.json

# Create a simple router
echo '<cfscript>
pathInfo = cgi.path_info ?: "";
writeOutput("<h1>Path: " & pathInfo & "</h1>");
writeDump(cgi);
</cfscript>' > index.cfm

# Start the server
java -jar lucli.jar server start
```

Visit `http://localhost:8080/test/path` and you'll see the routing in action.

## What's Next?

In the next post, I'll dive into LuCLI's module system and show you how to build reusable CLI tools with CFML. Spoiler: it's really cool.

Until then, check out the full URL rewriting documentation at [lucli.dev](https://lucli.dev/) or on [GitHub](https://github.com/cybersonic/LuCLI).

Happy routing!
