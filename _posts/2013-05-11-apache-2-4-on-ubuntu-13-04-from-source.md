---
title: Apache 2.4 on Ubuntu 13.04 from source
author: admin
layout: post
permalink: /2013/05/11/apache-2-4-on-ubuntu-13-04-from-source/
categories:
  - Linux
tags:
  - apache
  - apache 2.4
  - compile
  - install
  - source
  - Ubuntu
  - ubuntu 13.04
---
I wanted to test Apache 2.4 on my Ubuntu 13.04 but it was not available as a package, so I went and compiled the sources. In this post you can find the steps needed to make the latest Apache available on your Ubuntu.<!--more-->

Prepare the build server

<pre class="brush: bash; title: ; notranslate" title="">sudo apt-get install build-essential
cd ~/Downloads/
</pre>

Download all the necessary files. Apache needs apr, apr-util and pcre to be build. 

<pre class="brush: bash; title: ; notranslate" title="">wget http://mirrors.supportex.net/apache//httpd/httpd-2.4.4.tar.gz
wget http://ftp.nluug.nl/internet/apache//apr/apr-1.4.6.tar.gz
wget http://ftp.nluug.nl/internet/apache//apr/apr-util-1.5.2.tar.gz
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.32.tar.gz
</pre>

Unpack the compressed files

<pre class="brush: bash; title: ; notranslate" title="">tar xvfz httpd-2.4.4.tar.gz
tar xvfz apr-1.4.6.tar.gz
tar xvfz apr-util-1.5.2.tar.gz
tar xvzf pcre-8.32.tar.gz
</pre>

Apr and apr-util do not have to be build separately they can be included in Apache.

<pre class="brush: bash; title: ; notranslate" title="">mv apr-1.4.6 ~/Downloads/httpd-2.4.4/srclib/apr
mv apr-util-1.5.2 ~/Downloads/httpd-2.4.4/srclib/apr-util
</pre>

Pcre needs to be build

<pre class="brush: bash; title: ; notranslate" title="">cd pcre-8.32
./configure --prefix=/home/armin/pcre
make
make install
</pre>

Now we can build Apache where we tell it that we have included apr, we tell it where the pcre is located and we also tell it where we want to install it. To speed up the build you can use make -j 4 (or any other amount of threads)

<pre class="brush: bash; title: ; notranslate" title="">cd ~/Downloads/httpd-2.4.4
./configure --prefix=/home/armin/apache --with-included-apr --with-pcre=/home/armin/pcre
make
make install
</pre>

We can start Apache now

<pre class="brush: bash; title: ; notranslate" title="">cd ~/apache/bin
sudo ./apachectl
</pre>

Apache is not completely ready now, it needs to be fine tuned. Like adding the user to run under, ip, port, etc..

For those who do not want to go trough all the steps them self here is a video showing how it&#8217;s done.