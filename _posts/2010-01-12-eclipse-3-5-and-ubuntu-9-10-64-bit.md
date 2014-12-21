---
title: Eclipse 3.5 and Ubuntu 9.10 64 bit
layout: post
permalink: /2010/01/12/eclipse-3-5-and-ubuntu-9-10-64-bit/
categories:
  - Linux
tags:
  - button
  - eclipse
  - not working
  - Ubuntu
---
I installed my new laptop with the latest Ubuntu after that I downloaded Eclipse zip and unzipped it. I started the Eclipse and wanted to install some updates and plugins when I found out that the windows where not working properly. Windows would not refresh right and also all buttons on popup windows where not responding. <!--more-->

I was searching the net when I found out that this was a known bug in eclipse, they fixed it in 3.6 dev edition. So you have two options for solving this problem:

First one:  
Go to [here][1] and download the 3.6 version of eclipse.

Second one:  
Make an bash script in your eclipse folder that looks like this:

<pre class="prettyprint">#!/bin/sh
export GDK_NATIVE_WINDOWS=1
./eclipse &

</pre>

 [1]: http://download.eclipse.org/eclipse/downloads/