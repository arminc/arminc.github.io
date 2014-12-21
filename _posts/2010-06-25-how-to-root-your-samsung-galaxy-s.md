---
title: How to root your Samsung Galaxy S
layout: post
permalink: /2010/06/25/how-to-root-your-samsung-galaxy-s/
aktt_tweeted:
  - 1
aktt_notify_twitter:
  - yes
categories:
  - Android
tags:
  - galaxy s
  - how to
  - root
  - root galaxy s
---
This is an “how to”. I will show you how to root your Samsung Galaxy S. The credits go to LeshaK for rooting method and lmfwtw for providing a small tutorial that this how to is based upon. Also credits to these sites [Samdroid][1] and [Samsung Firmwares][2]{.broken_link}.<!--more-->

So lets start and try to root our phone. 

THERE IS ALSO AN SECOND METHOD LOOK [HERE][3]

**BUT FIRST BEFORE I BEGIN PLEASE, PLEASE DO NOT TRY THIS IF YOU DON&#8217;T KNOW WHAT YOU ARE DOING OR YOU DON&#8217;T WANT TO RISK YOUR PHONE BEEING BRICKED. ALTHOUGH THE HOW TO WORKED FOR ME AND OTHERS THAT DOES NOT MEAN IT CAN NOT GO WRONG. I TAKE NO RESPONSOBILITY ON THIS, YOU ARE ON YOUR OWN.</p> 

YOU HAVE BEEN WARN!</strong>

**STEP1:**  
Not sure if it is really needed but just in case. On your phone go to Settings > Applications > Development > Check USB Debugging

**STEP2:**  
You need to install the Samsung Kies software from [here][4] or you can download the software directly from [here][5].

**STEP3:**  
Connect your Galaxy to the PC and wait for the drivers to get installed

**STEP4:**  
Disconnect your Galaxy from the PC and shut it down.

**STEP5:**  
Now it&#8217;s time to download Odin. Odin is the flashing program. You can download it from [here][2]{.broken_link} or you can download it directly from me [here][6]

**STEP6:**  
Connect your phone to your PC

**STEP7:**  
Boot your phone in to download mode, to do this press HOME + DOWN + POWER

**STEP8:**  
You should see that Odin has recognized your phone

**STEP9:**  
To proceed further you need to download two things and that is the pit file from [here][2]{.broken_link} or directly from me [here][7].  
You also need to download the patched kernel from LeshaK from [here][1] or directly from [here][8]{.broken_link} or from me [here][9]

**STEP10:**  
In Odin select the pit file and the pda file and then press start.

**STEP11:**  
When Odin finishes your phone will reboot automatically.

**STEP12:**  
Login to your phone and connect it to the PC where you have setup adb. For info about adb go [here][10] 

**STEP13:**  
Open up a terminal/commandline and do the following:

<pre class="brush: bash; title: ; notranslate" title="">adb shell 
su 
cat /sbin/su &gt; /system/bin/su 
chmod 4755 /system/bin/su
exit
exit
</pre>

**STEP14:**  
Now you have two options you can keep this kernel or you can go back to the stock kernel. The kernel provided by LeshaK could be unstable (these are his words) so it&#8217;s up to you. If you wish to go back just flash the stock kernel like you did with LeshaK kernel. You can find different firmwares [here][2]{.broken_link} just download your firmware and then look inside the tar files find the one with zImage in it. Remove everything besides the zImage, now you can flash that kernel.

I my self was running XXJF3 firmware but there is no firmware online for that so I just installed the kernel from XXJF5. You can download the tar file I used [here][11]

**STEP15:**  
For root to work perfectly we need to do some more steps. When done with STEP14, whether you choose stock or not you need to follow this. Go and download the su-2.1-e-unsecure-signed.zip from [here][12] or directly from [here][13] or directly from me (already unpacked) [here][14]

Unzip the zip file.

**STEP16:**  
Connect your Galaxy to your PC where you have adb working and do the following:

<pre class="brush: bash; title: ; notranslate" title="">adb push PATH_TO_SU_FROM_THEZIP/su /sdcard 
adb shell 
su 
cat /sdcard/su &gt; /system/bin/su 
chmod 4755 /system/bin/su 
exit 
exit 
adb install PATH_TO_SUPERUSER_FROM_THEZIP/Superuser.apk
</pre>

**STEP17:**  
From the market download an terminal for example the “*android terminal emulator*”.

**STEP18:**  
Open the terminal on you phone and type in “*su*”, if you get an popup asking you to give permission for root then you successfully have rooted your phone. 

Have FUN.

 [1]: http://forum.samdroid.net/f49/dev-kernel-i9000-root-lk9-01-beta9-22-06-2010-a-1319/
 [2]: www.samsung-firmwares.com
 [3]: http://forum.samdroid.net/f49/superuser-su-busybox-i9000-26-06-2010-a-1355/
 [4]: http://www.samsungapps.com/about/onPc.as
 [5]: http://service.samsungmobile.com/Kies/download.jsp?reg_country=gb&#038;model_code=GT-S8500&#038;language=en
 [6]: http://files.coralic.nl/Odin3-v1.0.zip
 [7]: http://files.coralic.nl/GalaxyS-pitFile.zip
 [8]: http://files.samdroid.net/files/2forum/i9000_Kernel_LK9_01b9.7z
 [9]: http://files.coralic.nl/i9000_Kernel_LK9_01b9.7z
 [10]: http://developer.android.com/guide/developing/tools/adb.html
 [11]: http://files.coralic.nl/StockKernelXXJF5-UpnackThis.zip
 [12]: http://forum.xda-developers.com/showthread.php?t=682828
 [13]: http://bit.ly/brI0EV
 [14]: http://files.coralic.nl/u-2.1-e-unpacked.zip