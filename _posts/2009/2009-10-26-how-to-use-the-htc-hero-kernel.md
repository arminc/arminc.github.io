---
title: How to use the HTC Hero kernel
layout: post
permalink: /2009/10/26/how-to-use-the-htc-hero-kernel/
categories:
  - android
tags:
  - boot
  - boot.img
  - hero
  - htc hero
  - kernel
description: As you have seen in my previous post I have compiled the HTC Hero kernel, now is the time to use the kernel and that's what I am going to show you in this post.

---
As you have seen in my previous post I have compiled the HTC Hero kernel, now is the time to use the kernel and that's what I am going to show you in this post.

  
Let me start off with telling you that you can find a lot of information regarding android and boot on the [android-dls.com][1] site.  
There information is useful and there tools are working fine BUT they don't work for the Hero, actually they do but they miss one thing :)
Let's cut the chitchat and let me explain you how to boot your Hero with your own fresh kernel. Assume you have compiled your kernel using my way or your own way you get an zImage. Next thing you have to do is download the following things and put them all in one folder including your zImage: [boot.img][2] [mkbootimg][3] [repack-bootimg.pl(altered)][4] [unpack-bootimg.pl][5]

**CAUTION**: Please make an backup with nandroid before proceeding!!!!!!!

Step 1:

{% highlight bash %}unzip mkbootimg.zip{% endhighlight %}

Step 2:

{% highlight bash %}perl unpack-bootimg.pl boot.img{% endhighlight %}

Step 3:

{% highlight bash %}perl repack-bootimg.pl  zImage boot.img-ramdisk netBoot.img{% endhighlight %}

The repack script was fine but it missed the --base 0x19200000 statement at the mkbootimg line, that's what I added.

Our newBoot.img is ready for work right now. What you need to do now is upload it to your Hero, this can be done in two ways:

Method 1:

{% highlight bash %}fastboot flash boot newBoot.img
fastboot reboot
{% endhighlight %}

Method 2:

{% highlight bash %}adb push newBoot.img /sdcard
adb shell
cat /dev/zero > /dev/mtd/mtd2
	- write: No space left on device [this is ok, you can ignore]
flash_image boot /sdcard/newBoot.img
reboot your phone
{% endhighlight %}

If everything went oke your phone should boot with your new kernel. Have Fun!

 [1]: http://android-dls.com/wiki/index.php?title=HOWTO:_Unpack%2C_Edit%2C_and_Re-Pack_Boot_Images
 [2]: http://files.coralic.nl/boot.img
 [3]: http://files.coralic.nl/mkbootimg.zip
 [4]: http://files.coralic.nl/repack-bootimg.pl
 [5]: http://files.coralic.nl/unpack-bootimg.pl