---
title: How to compile the HTC Hero kernel
layout: post
permalink: /2009/10/25/how-to-compile-the-htc-hero-kernel/
categories:
  - android
tags:
  - android
  - compile
  - htc hero
  - kernel
---
I don&#8217;t know how many people watch the news about the sources around the HTC but couple days ago HTC released there kernel sources for the Hero phone. I though it would be nice to see if I can get it to compile.<!--more-->

  
As you may have guest I did manage to compile the kernel. Here you can find the steps how to do so your self. You can follow the manual way, if you have used my [script][1] for building your workspace then you can use these two new scripts to get and compile the scripts or you can take the scripts and modify them to work in your environment.

So lets start, first of we need to get the kernel and extract it in our repo, (~/mydroid or ~/myandroid):

<pre>wget http://member.america.htc.com/download/RomCode/Source_and_Binaries/kernel_hero_0078c992.tar.bz2
tar xvjf kernel_hero_0078c992.tar.bz2
rm -rf kernel_hero_0078c992.tar.bz2
</pre>

Before we can try to compile the kernel we need to get the config file from our device, this is how we do that:

<pre>adb pull /proc/config.gz .
gunzip config.gz
mv config .config
</pre>

Make sure your .config file is in the root of ~/myandroid/kernel-hero

If you are using my script you don&#8217;t need to do this because I already have provided the config settings inside the script.

Now that we have prepared all that we have to try to compile it, to do so we have to follow these steps:

<pre>cd ~/myandroid/kernel-hero
export ARCH=arm
export CROSS_COMPILE=arm-eabi-
export PATH=$PATH:~/myandroid/prebuilt/linux-x86/toolchain/arm-eabi-4.4.0/bin
make
</pre>

If all goes well the kernel should compile. You can find the compiled kernel at ~/myandroid/arch/arm/boot/zImage  
I have not tested this kernel yet, but I will try to do so soon. When I test the kernel I will post an update.

You can download my scripts [getHtcHeroKernelSources][2] and [compileHtcHeroKernel][3].

 [1]: http://blog.coralic.nl/2009/10/25/creating-workspace-for-the-android-source/
 [2]: http://files.coralic.nl/getHtcHeroKernelSources.sh
 [3]: http://files.coralic.nl/compileHtcHeroKernel.sh