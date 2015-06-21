---
title: Rooting my Galaxy S5
layout: post
permalink: /2015/06/21/rooting-my-galaxy-s5/
categories:
  - android
tags:
  - android
description: It’s been a while I have tinkered with my Android phone, I thought it’s time to root and play around. How hard can it be right? I have done this 100 times before. You already know where this is going, 2+ hours of flashing rebooting until it worked…. :)

---

It’s been a while I have tinkered with my Android phone, I thought it’s time to root and play around. How hard can it be right? I have done this 100 times before. You already know where this is going, 2+ hours of flashing rebooting until it worked…. :)

There is plenty information about what to do compared to years ago. Mostly if you follow the tutorials it should go right but sometimes it just doesn’t. Let me walk you trough what I did to root my phone and eventually install a custom rom :)

Download ODIN, there are two version old and new one, the ui is different. Download custom recovery, find the new version on xda forums. Let’s start

I used the latest odin, connected my phone it starts flashing but nothing else happens it just hangs showing progress bar. Hum lets try and reboot the phone in download mode, pfff it works. Seems odin does not start as system, lets try again, it works and the phone reboots, I reboot in recovery mode but I end up in samsung recovery, wtf. Ooh it seems there is a script that brings back recovery mode, to fix it remove battery when the flashing is done, before the phone boots and then boot in recovery mode to override the script. Watch out not to remove the battery to soon :)

Custom recovery is there victory :) , make a backup, shit can’t need 8 gig. Lets just root, seems to work, reboot phone, hum stuck on boot screen. Let’s wipe everything, reboot and the phone is still stuck on boot, boot again hum now I see it’s optimising apps… After some time I am in my android but root is broken, damn it. Root again and now the phone is stuck on boot before samsung logo, damn it.

Now I can’t get the phone to boot in any way, I have two options flashing original with odin, but need to wait 2 hours for a download or install a custom rom. Let’s do custom rom, but how do I install it I can’t copy the zip on to it. Oke no problem let’s sidelode it trough adb. It seem to work, phone is rebooting, damn stuck at boot again. Reboot to recovery again and wipe everything, try again, seems to work phone reboots, stuck on boot again, I wait a minute or 2 and reboot, ooh I see it’s optimising apps. It seems it was working on the first boot as well only it was optimising apps but not showing it. Now I am in a running android with root working whooooo. Finally I can use my phone again.

Now only thing I need to do is install some of the samsung apps trough recovery to allow exchange support etc.. But also install all my apps and configure them, have no backup of them… Luckily there is lastpass helping with passwords :)

No mater how many times you have done this it’s alway journey, I really need to fix/root my phone when I buy while I still have my other phone working so I have more time to mess around