---
layout: post
title:  "URGENT!: Seeking RegEx guru"
uid:	"8A9A76E8-0C95-2DBE-FBB6A46541022A25"
date:   2007-04-25 11:08 AM +0000
categories: webdev
permalink: urgent-seeking-regex-guru
---
No, not for a job, I just need to find a reg ex expression to find the values of the following expression:

<code>

xpath("/root/framework_root/framework_mg/controllers/controller/message-listener/@message/text()", "|")
</code>

basically its a function, you pass in two values, the xpath and then a delimiter. I need to get the value of the parameters.
e.g.
<code>
1. /root/framework_root/framework_mg/controllers/controller/message-listener/@message/text()
2. |
</code>

Any ideas?

(I SUCK at RegEx, and I am hoping someone can show me the light!)