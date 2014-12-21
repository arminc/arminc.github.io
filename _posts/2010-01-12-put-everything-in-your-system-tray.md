---
title: Put everything in your system tray
author: admin
layout: post
permalink: /2010/01/12/put-everything-in-your-system-tray/
categories:
  - Linux
tags:
  - alltray
  - dock to tray
  - system tray
---
Ever wanted to minimize a window to system tray even if it could not buy it self? If so then alltray http://alltray.trausch.us/ is what you want.<!--more-->

This is how it works, you start an application like this:

<pre class="pretyprint">alltray someApp
</pre>

That&#8217;s it, the application starts normally but when you close it using X and alt-F4 it goes to system tray and stays there until you close it with File->Exit.

You can also start alltray and then click some window to dock it to system tray.

To install alltray on an debian based distro do this:

<pre class="pretyprint">sudo aptitude install alltray
</pre>