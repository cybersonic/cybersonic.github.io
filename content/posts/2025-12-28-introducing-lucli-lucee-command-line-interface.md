---
layout: post
author: Mark Drew
title: Introducing LuCLI - The Lucee Command Line Interface
categories: lucee cli development tools
header_img: img/img_0323.jpeg
subtitle: A modern, feature-rich command line interface that brings the power of Lucee to your terminal
permalink: introducing-lucli.html
draft: false
---

Over the years I've built a lot of CFML applications, and one thing that always bothered me was the lack of a proper command-line tool specifically for Lucee. Sure, we have CommandBox (which is excellent!), but I wanted something laser-focused on Lucee, something that felt like a native CLI tool you'd reach for every day.

So I built LuCLI - the Lucee-specific toolbox I always wanted.

## What is LuCLI?

LuCLI (pronounced "Lucee-EL-EYE") is a command line interface for Lucee CFML that integrates the Lucee engine with modern CLI features. Think of it as your Swiss Army knife for Lucee development: server management, CFML execution, module system, JMX monitoring, and more - all from your terminal.

Here's what you can do with it:

```bash
# Start an interactive CFML session
java -jar lucli.jar terminal

# Execute CFML expressions
lucli> cfml now()
2025-01-04T13:22:25.123Z

# Start a Lucee server for your project
lucli> server start
✅ Local Lucee server running on http://localhost:8080

# Run CFML scripts
lucli> run MyScript.cfm
```

## Why I Built It

I needed a tool that could:
- **Start Lucee servers quickly** without the overhead of full installations
- **Execute CFML scripts** from the command line (like running Python or Node scripts)
- **Manage multiple server instances** with different Lucee versions
- **Monitor server performance** in real-time
- **Work seamlessly in CI/CD pipelines** and Docker containers

LuCLI does all of this, and it's built specifically around Lucee's capabilities. It's small, focused, and gets out of your way.

## Quick Start

Getting started is dead simple:

```bash
# Download the JAR
curl -L -o lucli.jar \
  https://github.com/cybersonic/LuCLI/releases/latest/download/lucli.jar

# Start using it
java -jar lucli.jar terminal

# Or get help
java -jar lucli.jar --help
```

That's it! No installation, no complex setup. Download and run.

We also have some nice binary packages that you can add to your path (for example):

```bash
# Download the binary
curl -L -o lucli https://github.com/cybersonic/LuCLI/releases/download/v0.1.231/lucli-0.1.231-macos
# Copy it to the bin folder
cp lucli ~/bin

#Profit! 
lucli --version


 _           ____ _     ___ 
| |   _   _ / ___| |   |_ _|
| |  | | | | |   | |    | | 
| |__| |_| | |___| |___ | | 
|_____\__,_|\____|_____|___|

Version: 0.1.232-SNAPSHOT
Lucee Version: 7.0.1.93-SNAPSHOT

Copyright (c) Mark Drew https://github.com/cybersonic
Repository: https://github.com/cybersonic/lucli
```



## The Numbers

Let me show you some stats that convinced me this was worth building:

- **JAR Size**: ~40B (includes full Lucee 7 engine)
- **Server Startup**: ~2 seconds for a warm server
- **Memory Footprint**: Starts at ~256MB, configurable up to whatever you need
- **Test Suite**: 52+ tests covering all major features

These numbers mean you can spin up a Lucee environment faster than most Node.js apps can start!

## What Makes It Different?

### 1. Lucee-First Design
Everything is optimized for Lucee. The configuration format (`lucee.json`), the server management, the module system - all built specifically for how Lucee works.

### 2. Interactive Terminal
LuCLI gives you a Lucee-backed terminal session where you can run CFML scripts and components, explore your project, and keep state between commands. It's like a REPL but for your entire Lucee environment.

### 3. Embedded  Server
Spin up a Lucee server for the current directory with a single command. Framework-style URL routing is built-in and ready for ColdBox, FW/1, ContentBox, or whatever framework you're using.

```bash
lucli> server start --port 8080
✅ Local Lucee server running on http://localhost:8080
```

### 4. Modules & Automation
Create reusable CFML modules that work like CLI commands. Need a database migration tool? A code generator? A deployment script? Build it as a LuCLI module:

```bash
# Create a module
lucli modules init data-processor

# Run it
lucli data-processor --input=data.json
```

## A Real Example

Here's a quick workflow I use daily:

```bash
# Navigate to my project
cd ~/projects/myapp

# Start the server with a specific Lucee version
lucli server start --version 7.0.0.123 --port 8080

# Run my data migration script
lucli run migrations/001-initial-schema.cfm

# Monitor server performance
lucli server monitor
```

All of this without leaving my terminal. No GUI, no clicking around - just fast, efficient development.


## Try It Out

LuCLI is currently in alpha (v0.1.192 as of this writing), which means the API might change before v1.0, but it's stable enough for daily use.

Check it out:
- **Website**: [lucli.dev](https://lucli.dev/)
- **GitHub**: [github.com/cybersonic/LuCLI](https://github.com/cybersonic/LuCLI)
- **Documentation**: Full docs in github
- **Issues**: Found a bug? Open an issue!

Would love to hear what you think. 