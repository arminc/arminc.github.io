---
title: Repair items in /dev under RedHat
layout: post
permalink: /2008/11/18/repair-items-in-dev-under-redhat/
categories:
  - linux
tags:
  - /dev
  - makedev
  - ptmx
  - pty
  - random
  - redhat
  - ssh
  - tty
  - urandom
description: Everyone knows this but I have to say it again, DONT forget to backup your stuff. 
---
Everyone knows this but I have to say it again, DONT forget to backup your stuff. Because if you don't you could end up spending valuable time recovering or repairing things like I had to. I will spare you the details what went wrong here that made it necessary to repair my /DEV, but the head problem was that I could not login with SSH and that terminal was not starting properly. This was happening because some of the items in /DEV where gone. To repair those tings this is what I did.

I am not giving you a solution to ONE problem or anything like that here. I am showing you how you can recover or repair some stuff in /dev in RedHat.

Creating /dev/null

{% highlight bash %}
mknod -m 666 /dev/null c 1 3
{% endhighlight %}

Creating /dev/console

{% highlight bash %}
mknod -m 622 console c 5 1
{% endhighlight %}

Create /dev/random

{% highlight bash %}
mknod -m 0644 /dev/random c 1 8
{% endhighlight %}

Create /dev/urandom

{% highlight bash %}
      mknod -m 0644 /dev/urandom c 1 9
{% endhighlight %}

For creating pty, ptmx and tty you need MAKEDEV that can be found in /sbin. If it's not there try to copy it from another machine like I did, and placing it in /sbin.

Create pty,tty,ptmx

{% highlight bash %}
./sbin/MAKEDEV pty
./sbin/MAKEDEV tty
./sbin/MAKEDEV ptmx
{% endhighlight %}