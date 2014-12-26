---
title: How to create a custom rom for Hero from Android sources
layout: post
permalink: /2010/01/21/how-to-create-a-custom-rom-for-hero-from-android-sources/
categories:
  - android
tags:
  - android
  - compile
  - compile android
  - compile hero
  - create hero build
  - hero
description: UPDATE1[27.01.2010] If you search on the Internet you can find a lot of custom roms for android phones but when you start searching for an tutorial on how to create one your self it gets confusing. You need to look very well and learn by trail and error to find all the stuff you need to create an rom of your own. That's why I decided to show you how to create an rom for HTC Hero from scratch. 
---
**UPDATE1[27.01.2010]** If you search on the Internet you can find a lot of custom roms for android phones but when you start searching for an tutorial on how to create one your self it gets confusing. You need to look very well and learn by trail and error to find all the stuff you need to create an rom of your own. That's why I decided to show you how to create an rom for HTC Hero from scratch. 

**Creating your work environment and getting the Android sources version 1.5**

I already have an automated script ([already posted][1]), but because we need Android 1.5 sources and not the master I made an small adjustment. You can download an altered version [HERE][2]  
Adjustment is downloading the cupcake branch by adding -b cupcake at the repo initializing command.

**Create an generic build**

This is an optional step but this way you can see if your environment can compile the default build.

{% highlight bash %}cd ~/myandroid
. build/evnsetup.sh
make
{% endhighlight %}

After waiting for a long time (depending on your machine) and if the compilation goes well you will have the following files:  
out/target/product/generic/system.img  
out/target/product/generic/ramdisk.img  
out/target/product/generic/userdata.img

**Test the generic build**

This is also an optional step, here I will try to show you how you can test your generic build or some other build on the emulator.

{% highlight bash %}cd ~/myandroid/out/host/linux-x86/bin
./emulator -system ~/myandroid/out/target/product/generic/ -kernel ~/myandroid/prebuilt/android-arm/kernel/kernel-qemu -data ~/myandroid/out/target/product/generic/userdata.img
{% endhighlight %}

You should get a window with text “ANDROID”, if so please be patience and wait for the emulator to startup. After the emulator has booted you will have your fresh compiled android running. You can play around with it to see if it works, also check “Menu → Settings → About phone” to see some info about your build.

**Create settings for Hero**

You have tested your work environment and saw your build work it's time to create setting for the Hero. When you want to compile an image for an specific phone you need the correct settings for it. All configuration files regarding an device go in to vendor/&#8230;. Explaining and finding information about all those configuration files would take a lot of time so I will skip that for now, maybe some other time I will try to explain what every file does and what you can do with it. For now the fastest way to get your configuration files is to use the ones that “loxK” has made, you can find them [here][3].

To make this how to easier I created an zip file for you to download, this zip file contains configuration files (from loxK) but also proprietary files needed by Hero to work properly. I did needed to change some settings to get it to work for me so there is some small difference between my configuration files and the loxK files. Download my configuration files [HERE][4]

{% highlight bash %}cd ~/myandroid/vednor/htc
unzip hero-configfiles.zip
chmod 755 proprietary/akm8973
{% endhighlight %}

UPDATE1[27.01.2010]  
I forgat to tell you that you need a deodexd com.htc.framework in the proprietery folder. [Here][5] I made an post on how to do this.

**Compile your first Hero rom**  
Now that we have prepared everything for our Hero it's time to compile your Hero rom.  

{% highlight bash %}
cd ~/myandroid  
. build/envsetup.sh  
lunch htc_hero-eng  
make  
{% endhighlight %}

Again after waiting for some time if everything goes right you will have your own fresh Hero rom ready to use.

Test your Hero rom on an emulator  
Sure you can go and install your rom directly on your phone but most of the time it's easier to look if the rom is working or not and if the changes you made are there correct by running it on the emulator.

{% highlight bash %}cd ~/myandroid/out/host/linux-x86/bin
./emulator -system ~/myandroid/out/target/product/hero/ -kernel ~/myandroid/prebuilt/android-arm/kernel/kernel-qemu -data ~/myandroid/out/target/product/hero/userdata.img
{% endhighlight %}

Test your Hero rom on an actual Hero phone

WARNING: Do a backup of your phone(nandroid) before doing anything. PLEASE if you don't know what you are doing then don't do it. I am not responsible for any damages you do on your own device!!!

If you are sure and know what you are doing then please proceed.

To test your build on Hero you need fastboot that is containd in ~/myandroid/out/host/linux-x86/bin or you can download it [HERE][6]. Other way of flashing your Hero is by using an update.zip file. In this how to I will explain to you how to use fastboot. I will explain how to create an update.zip from your build in some other future post of my.

My own Hero does not allow me to use fastboot so I need to use update.zip. As I have heard there are some different versions of Hero (some with different HBOOT), some of these versions allow fastboot and some of the don't.

This is how you use fastboot:  
Connect your phone to your PC, shut down your phone, press and hold the “Back” button and press “power on”. Your Hero should boot in fastboot mode now. Only thing left to do now is flash our new images to the phone. Be aware you need to get an response output from fastboot after every command if not then it's not working. Also if you get “FAILED (remote: signature verify fail)” you need to use update.zip instead of fastboot.

{% highlight bash %}cd out/host/linux-x86/bin/fastboot
fastboot flash system system.img
fastboot flash userdata userdata.img
fastboot reboot
{% endhighlight %}

If everything went well your Hero will boot with your own cupcake build, have fun.

 [1]: {{ site.baseurl }}/2009/10/25/creating-workspace-for-the-android-source/
 [2]: http://files.coralic.nl/createAndroidRepo.sh
 [3]: http://github.com/loxK/cupcake_platform_vendor_htc_hero
 [4]: http://files.coralic.nl/hero-configfiles.zip
 [5]: {{ site.baseurl }}/2010/01/27/deodexing-com-htc-framework
 [6]: http://android-dls.com/files/linux/fastboot