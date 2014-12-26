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

I have also created an img for those that don't want to or can't create one: [Download][4]{.broken_link}

Step 1:  
Lets begin by preparing our device by create an folder on android, connect your phone to your computer and do:

<pre class="brush: bash; title: ; notranslate" title="">sudo adb shell
cd /sdcard
mkdir ubuntu
exit
</pre>

Step 2:  
Now you can upload the img file and if you like you can also upload my start and stop scripts.

<pre class="brush: bash; title: ; notranslate" title="">sudo adb push ubuntu.img /sdcard/ubuntu
sudo adb push startA_ubuntu.sh /sdcard/ubuntu
sudo adb push stopA_ubuntu.sh /sdcard/ubuntu
</pre>

Step 3:  
Now that you have done all the prep work you can use your ubuntu by doing:

<pre class="brush: bash; title: ; notranslate" title="">su 
cd /sdcard/ubuntu 
sh startA_ubuntu.sh ubuntu.img
</pre>

Step 4:  
To exit just run:

<pre class="brush: bash; title: ; notranslate" title="">exit
sh stopA_ubuntu.sh
</pre>

That's it, no more no less <img src='http://blog.coralic.nl/wp-includes/images/smilies/icon_smile.gif' alt=':)' class='wp-smiley' /> 

Oh I have also created two movies, first one shows how to setup and the second one is the prove it works on galaxy S. Have fun watching.

 [1]: http://blog.coralic.nl/2010/08/12/creating-chroot-for-arm-on-ubuntu-with-rootstock/
 [2]: http://files.coralic.nl/ArmChrootUbuntu/startA_ubuntu.sh
 [3]: http://files.coralic.nl/ArmChrootUbuntu/stopA_ubuntu.sh
 [4]: http://www.megaupload.com/?d=YKUX4Q89