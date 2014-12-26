---
title: Apache 2.4 on Ubuntu 13.04 from source
layout: post
permalink: /2013/05/11/apache-2-4-on-ubuntu-13-04-from-source/
categories:
  - linux
tags:
  - apache
  - apache 2.4
  - compile
  - install
  - source
  - ubuntu
  - ubuntu 13.04
description: I wanted to test Apache 2.4 on my Ubuntu 13.04 but it was not available as a package, so I went and compiled the sources. In this post you can find the steps needed to make the latest Apache available on your Ubuntu.
---
I wanted to test Apache 2.4 on my Ubuntu 13.04 but it was not available as a package, so I went and compiled the sources. In this post you can find the steps needed to make the latest Apache available on your Ubuntu.

Prepare the build server

{% highlight bash %}sudo apt-get install build-essential
cd ~/Downloads/
{% endhighlight %}

Download all the necessary files. Apache needs apr, apr-util and pcre to be build. 

{% highlight bash %}wget http://mirrors.supportex.net/apache//httpd/httpd-2.4.4.tar.gz
wget http://ftp.nluug.nl/internet/apache//apr/apr-1.4.6.tar.gz
wget http://ftp.nluug.nl/internet/apache//apr/apr-util-1.5.2.tar.gz
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.32.tar.gz
{% endhighlight %}

Unpack the compressed files

{% highlight bash %}tar xvfz httpd-2.4.4.tar.gz
tar xvfz apr-1.4.6.tar.gz
tar xvfz apr-util-1.5.2.tar.gz
tar xvzf pcre-8.32.tar.gz
{% endhighlight %}

Apr and apr-util do not have to be build separately they can be included in Apache.

{% highlight bash %}mv apr-1.4.6 ~/Downloads/httpd-2.4.4/srclib/apr
mv apr-util-1.5.2 ~/Downloads/httpd-2.4.4/srclib/apr-util
{% endhighlight %}

Pcre needs to be build

{% highlight bash %}cd pcre-8.32
./configure --prefix=/home/armin/pcre
make
make install
{% endhighlight %}

Now we can build Apache where we tell it that we have included apr, we tell it where the pcre is located and we also tell it where we want to install it. To speed up the build you can use make -j 4 (or any other amount of threads)

{% highlight bash %}cd ~/Downloads/httpd-2.4.4
./configure --prefix=/home/armin/apache --with-included-apr --with-pcre=/home/armin/pcre
make
make install
{% endhighlight %}

We can start Apache now

{% highlight bash %}cd ~/apache/bin
sudo ./apachectl
{% endhighlight %}

Apache is not completely ready now, it needs to be fine tuned. Like adding the user to run under, ip, port, etc..

For those who do not want to go trough all the steps them self here is a video showing how it's done.