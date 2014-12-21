---
title: Nginx 1.4 on Ubuntu 13.04 from source
author: admin
layout: post
permalink: /2013/05/12/nginx-1-4-on-ubuntu-13-04-from-source/
categories:
  - Linux
tags:
  - compile
  - install
  - nginx
  - nginx 1.4
  - ubuntu 13.04
  - ubunut
---
I worked with Apache for a long time and I never had the chance to do something with nginx until now. I decided to try nginx and see if I can get it up and running. In this post you can find the steps needed to make the nginx 1.4 available on your Ubuntu.<!--more-->

Prepare the build server

<pre class="brush: bash; title: ; notranslate" title="">sudo apt-get install build-essential
cd ~/Downloads/
</pre>

Download all the necessary files. Nginx needs pcre to be build. 

<pre class="brush: bash; title: ; notranslate" title="">wget http://nginx.org/download/nginx-1.4.1.tar.gz
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.32.tar.gz
</pre>

Unpack the compressed files

<pre class="brush: bash; title: ; notranslate" title="">tar xvfz nginx-1.4.1.tar.gz
tar xvzf pcre-8.32.tar.gz
</pre>

Build nginx where we tell it the pcre location, where we want to install it and we also tell it we don&#8217;t want to use gzip at the moment. To speed up the build you can use make -j 4 (or any other amount of threads)

<pre class="brush: bash; title: ; notranslate" title="">cd nginx-1.4.1
./configure --prefix=/home/armin/nginx --with-pcre=/home/armin/Downloads/pcre-8.32 --without-http_gzip_module
make
make install
</pre>

We can start nginx now

<pre class="brush: bash; title: ; notranslate" title="">cd ~/nginx/sbin
sudo ./nginx
</pre>

Nginx can be used to serve the pages now but it is not configured completely, it needs to be fine tuned.

For those who do not want to go trough all the steps them self here is a video showing how it&#8217;s done.