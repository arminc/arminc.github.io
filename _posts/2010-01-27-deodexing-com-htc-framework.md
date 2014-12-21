---
title: Deodexing com.htc.framework
layout: post
permalink: /2010/01/27/deodexing-com-htc-framework/
categories:
  - android
tags:
  - backsmali
  - com.htc.framework
  - deodexerant
  - deodexing
  - smali
description: This is just an small tutorial that shows how deodexing works.

---
This is just an small tutorial that shows how deodexing works.

First of all you need these three tools, [deodexerant][1] , [baksmali][2] and [smali][3]

Connect your phone with USB and make sure you can acces adb and then do the following:

<pre class="brush: bash; title: ; notranslate" title="">adb push deodexerant /data/local
adb shell chmod 755 /data/local/deodexerant
adb forward tcp:1234 tcp:1234
adb pull /system/app/com.htc.framework.odex .
adb shell /data/local/deodexerant /system/app/com.htc.framework.odex 1234 &
java -jar baksmali.jar -x :1234 com.htc.framework.odex
</pre>

Now that you have a deodexd files in the out folder you need to create the classes.dex file again.

<pre class="brush: bash; title: ; notranslate" title="">java -jar smali-1.1.jar -d classes.dex out
</pre>

It's time to put the classes.dex in to the empty com.htc.framework.jar.

<pre class="brush: bash; title: ; notranslate" title="">adb pull  com.htc.framework.jar
zip com.htc.framework.jar classes.dex
</pre>

You have an deodexd com.htc.framework.jar, if you wish to use it you need to sign it:

<pre class="brush: bash; title: ; notranslate" title="">java -jar ~/myandroid/out/host/linux-x86/framework/signapk.jar ~/myandroid/build/target/product/security/testkey.x509.pem ~/myandroid/build/target/product/security/testkey.pk8 com.htc.framework.jar signed.jar
</pre>

You are done!

 [1]: http://smali.googlecode.com/files/deodexerant-v1.0-Android1.0-1.6
 [2]: http://smali.googlecode.com/files/baksmali-1.1.jar
 [3]: http://smali.googlecode.com/files/smali-1.1.jar