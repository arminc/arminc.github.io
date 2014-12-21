---
title: How to create update.zip using your build aka system.img
layout: post
permalink: /2010/01/25/how-to-create-update-zip-using-your-build-aka-system-img/
categories:
  - Android
tags:
  - create update.zip
  - system.img
  - system.img to update.zip
  - update.zip
---
In my previous [post][1] I have already said that I will explain how to create an update.zip from your own build so here it is.<!--more-->

**Build unyaffs**  
To do anything at all you need to extract your system.img, but you can not do that with normal zip because it&#8217;s an special format. You need unyaffs to extract it, you can get the c en h file from [here][2] or download the zip containing those two files [here][3]. I made an small change in my unyaffs.c file so it does not create symbolic links, this way I don&#8217;t need to fix that later.  
Now let&#8217;s compile it:

<pre class="brush: bash; title: ; notranslate" title="">gcc -o unyaffs unyaffs.c
</pre>

**Extract system.img**  
To do this follow these command&#8217;s.

<pre class="brush: bash; title: ; notranslate" title="">mkdir ~/update
cd ~/update
mkdir system
cd system
~/unyaffs  ~/myandroid/out/target/product/hero/system.img
cd ..
</pre>

**Prepare your files for zip**  
You need to create some folders:

<pre class="brush: bash; title: ; notranslate" title="">mkdir -p META-INF/com/google/android
</pre>

In the META-INF goes a so called update-script, this scripts says what to do when the update.zip is run. Download the update-scriptNoBoot.txt [HERE][4] and put it in META-INF\com\google\android. Do not remember to rename it to update-script!!! It&#8217;s not a txt file.

**Create the update.zip**  
Zip the system folder and the META-INF folder to update.zip

<pre class="brush: bash; title: ; notranslate" title="">cd ~/update
zip -r update.zip system META-INF
</pre>

**Sign your update.zip**

<pre class="brush: bash; title: ; notranslate" title="">java -jar ~/myandroid/out/host/linux-x86/framework/signapk.jar ~/myandroid/build/target/product/security/testkey.x509.pem ~/myandroid/build/target/product/security/testkey.pk8 ~/update/update.zip ~/update/signed-update.zip
</pre>

All that&#8217;s left to do is rename your signed-update.zip to update.zip, upload it to your sdcard, reboot your phone to nandroid, do a wipe and then select install update.zip.

If you have done everything right you can reboot your phone and you will have a custom rom running. If not there is something wrong with your update.zip or your files in there. Most of the time if the update.zip is wrong your Phone will be stuck at the boot text. If you have issues with the update-script you will get those while installing.

DO NOT FORGET to make an backup with nandroid!!!

 [1]: http://blog.coralic.nl/2010/01/21/how-to-create-a-custom-rom-for-hero-from-android-sources/
 [2]: http://code.google.com/p/unyaffs/downloads/list
 [3]: http://files.coralic.nl/unyaffs.zip
 [4]: http://files.coralic.nl/update-scriptNoBoot.txt