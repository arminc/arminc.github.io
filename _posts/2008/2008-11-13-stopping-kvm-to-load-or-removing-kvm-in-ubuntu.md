---
title: Stopping kvm to load or removing kvm in Ubuntu
layout: post
permalink: /2008/11/13/stopping-kvm-to-load-or-removing-kvm-in-ubuntu/
categories:
  - linux
tags:
  - kvm
  - ubuntu
  - virtualbox
  - vmware
description: hen I was working with VirtualBox and Vmware server I found out that if I enabled my hardware virtualization everything would freeze. So how com?
---
When I was working with VirtualBox and Vmware server I found out that if I enabled my hardware virtualization everything would freeze. So how com?

You have probably heard about kvm (kernel-based Virtual Machine) that is available in Ubuntu. It's used for creating virtual machines in ubuntu. It works nice but I wanted to use Vmware server, and this is where things go down.

When I am working with Vmware server and my hardware virtualization off everything works fine, but at this point I can not use the option to also have 64bit guests on my 64bit host. So what do I do, I enable the hardware virtualization. You can guess what happens next, when I try to start an installation or already made virtual machine in Vmware server my PC freezes.

I found out that the problem was caused by kvm. When I disabled the kvm everything works like a charm.

How to unload kvm just temporally, it comes back after restart:

{% highlight bash %}
sudo rmmod kvm-intel
{% endhighlight %}

If you use the option above you will have to run the command every time before you start your Vmware.

How to remove kvm from Ubuntu

{% highlight bash %}
sudo apt-get remove --purge kvm
{% endhighlight %}

This will delete kvm from your Ubuntu and will not come back anymore until you install it again.

You can check if kvm is deleted properly by making sure these three things are deleted:

{% highlight bash %}
/etc/kvm
/etc/udev/rules.d/45-kvm.rules
/etc/init.d/kvm
{% endhighlight %}