---
title: How to:Android 2.2 on Galaxy S without Odin or Kies
layout: post
permalink: /2010/10/14/how-to-android-2-2-on-galaxy-s-without-odin-or-kies/
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
categories:
  - Android
tags:
  - android 2.2
  - clockwork recovery
  - kies
  - odin
  - update rom
---
You may have heard or maybe not but there is an 2.2 version available for the Samsung Galaxy S. You may also know that the update over Kies will take a wile because Samsung has not released that yet. You may also know that you can flash your device with Odin witch is fine off course, but there is also a third method using the recovery and I am going to show you how.<!--more-->

First of all if you like Odin then stick to that <img src='http://blog.coralic.nl/wp-includes/images/smilies/icon_smile.gif' alt=':)' class='wp-smiley' /> if not this is how you can upgrade your Samsung Galaxy S using the recovery mode and the update.zip

First of all you need to have clockwork [recovery][1].You can use auto or manual way, I am going to show you the manual way. Download the recovery for Galaxy S from koush&#8217;s [website][2].

Besides the recovery you need to have a rom off course, thanks to DocRambone you can download one from XDA forum [here][3] direct link to rom is [here][4].  
Doc&#8217;s ROM is a slim version, meaning all the Samsung apps are removed and it also means it is pre rooted and contains busybox and superuser. Do not install this rom if you want those!

**Before you proceed you must know that everything you do is on your own risk, you can not blame me or others for destroying your device.** 

**CAUTION:** if you have any lagfixes on your phone be aware that it could cause some problems, I am not saying it will but it could, to be sure undo those first!

**Clockwork recovery:** it is not permanent it just loads the recovery in to ramdisk, it means when you exit the recovery reboot and then come back to recovery again you will see stock one again!

STEP 1:  
Rename the recovery zip to update.zip and upload it to your phone on the SDCARD. Now upload the rom as well, you don&#8217;t need to rename it.

STEP 2:  
Turn off your phone

STEP 3:  
Turn you phone on in recovery mode using the buttons Volume UP + Home + Power

STEP 4:  
Select apply sdcard:update.zip

STEP 5:  
The phone will reboot and will probably come back in to the stock recovery again if so then apply the sdcard:update.zip one more time. If you do see clockwork recovery proceed with step 7 and without doing this.

STEP 6:  
Phone will reboot now and will come back in to clockwork recovery.

STEP 7:  
It is smart to create an backup of your phone using nandroid!

STEP 8:  
Now install the rom using the option “install zip from sdcard” and selecting the doc&#8217;s rom.

STEP 9:  
Now you just wait and be patience until the install finishes. If all goes well you will return back to clockwork recovery. If so then choose reboot <img src='http://blog.coralic.nl/wp-includes/images/smilies/icon_smile.gif' alt=':)' class='wp-smiley' /> 

STEP 10:  
You are done, the phone is booting in to your new ROM!

If for some reason this does not work for you, use Odin to install an other &#8216;older&#8217; rom.

Credits go to: Koush and to DocRambone

 [1]: http://www.koushikdutta.com/2010/02/clockwork-recovery-image.html
 [2]: http://koush.tandtgaming.com/recoveries/recovery-clockwork-2.5.0.4-galaxys.zip
 [3]: http://forum.xda-developers.com/showthread.php?t=807848
 [4]: http://www.multiupload.com/AA9GSQ4LZI