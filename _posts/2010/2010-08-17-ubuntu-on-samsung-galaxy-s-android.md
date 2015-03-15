---
title: Ubuntu on Samsung Galaxy S (Android)
layout: post
permalink: /2010/08/17/ubuntu-on-samsung-galaxy-s-android/
categories:
  - android
tags:
  - android
  - galaxy s
  - samsung galaxy s
  - ubuntu
  - ubuntu on android
  - ubuntu on galaxy s
description: In my previous post I showed you how to create an chroot environment for the arm and run it on your Ubuntu. But it's much nicer to see it work on a real device or on an Android device like Samsun Galaxy S GT-I9000.
---
In my previous [post][1] I showed you how to create an chroot environment for the arm and run it on your Ubuntu. But it's much nicer to see it work on a real device or on an Android device like Samsun Galaxy S GT-I9000.

To run Ubuntu on Android/Samsung you need to create an img file using my [post][1], you can also use two of my start and stop scripts from here [start][2] [stop][3].

I have also created an img for those that don't want to or can't create one: [Download][4]

Step 1:  
Lets begin by preparing our device by create an folder on android, connect your phone to your computer and do:

{% highlight bash %}sudo adb shell
cd /sdcard
mkdir ubuntu
exit
{% endhighlight %}

Step 2:  
Now you can upload the img file and if you like you can also upload my start and stop scripts.

{% highlight bash %}sudo adb push ubuntu.img /sdcard/ubuntu
sudo adb push startA_ubuntu.sh /sdcard/ubuntu
sudo adb push stopA_ubuntu.sh /sdcard/ubuntu
{% endhighlight %}

Step 3:  
Now that you have done all the prep work you can use your ubuntu by doing:

{% highlight bash %}su 
cd /sdcard/ubuntu 
sh startA_ubuntu.sh ubuntu.img
{% endhighlight %}

Step 4:  
To exit just run:

{% highlight bash %}exit
sh stopA_ubuntu.sh
{% endhighlight %}

That's it, no more no less :)

Oh I have also created two movies, first one shows how to setup and the second one is the prove it works on galaxy S. Have fun watching.

 [1]: {{ site.baseurl }}/2010/08/12/creating-chroot-for-arm-on-ubuntu-with-rootstock/
 [2]: {{ site.baseurl }}/assets/files/ArmChrootUbuntu/startA_ubuntu.sh
 [3]: {{ site.baseurl }}/assets/files/ArmChrootUbuntu/stopA_ubuntu.sh
 [4]: http://www.megaupload.com/?d=YKUX4Q89