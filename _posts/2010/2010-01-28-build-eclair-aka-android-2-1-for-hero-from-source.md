---
title: Build Eclair aka Android 2.1 for Hero from source
layout: post
permalink: /2010/01/28/build-eclair-aka-android-2-1-for-hero-from-source/
categories:
  - android
description: First of all let met thank (loxK, kiall, jnwhiteh and Behnaam) because those guys are doing a very good job buy creating rom's for Hero and posting there information on the net. This post is all about eclair and Hero. What you will see here is how to build eclair for Hero and how to create an update.zip so you can flash your Hero. 
---
First of all let met thank (loxK, kiall, jnwhiteh and Behnaam) because those guys are doing a very good job buy creating rom's for Hero and posting there information on the net. This post is all about eclair and Hero. What you will see here is how to build eclair for Hero and how to create an update.zip so you can flash your Hero. 

To do this you need couple of things, a workspace, eclair sources, hero vendor settings from the github [(provided by loxK, kiall and jnwhiteh)][1] and you need the HERO21 rom [(provided by loxK and Behnaam)][2].

Let's start by creating an workspace, to make it easy for you guys I made an script that will do everything for you. You can download it [HERE][3]. Be CAREFULL if you already have used my other [script][4] you will already have an folder called myandroid in your home directory. If so then you have two choices you can delete the myandroid folder

{% highlight bash %}cd ~
rm -rf myandroid
{% endhighlight %}

or you could replace the words “myandroid” to “myeclair” in the script.

So what does the script do, It installs required packages, setups folders, initializes the eclair repo, it initializes github repo (Hero vendor). Now that you have your workspace initialized it's time to proceed.

Before we can compile we need to do two more things.  
**First:**  
I found some problems with the Hero vendor settings so I had to modify them, this is what I did.

{% highlight bash %}gedit ~/myandroid/vendor/community/products/AndroidProducts.mk
{% endhighlight %}

Remove this:

{% highlight bash %}$(LOCAL_DIR)/community_hero_eu.mk \
{% endhighlight %}

Now remove community_hero_eu.mk:

{% highlight bash %}rm ~/myandroid/vendor/community/products/ community_hero_eu.mk
{% endhighlight %}

**Second:**  
Download the HERO21 rom from [HERE][5] and save it in “~/myandroid” as “update-hero.zip”. Now unzip the files needed by doing:

{% highlight bash %}cd ~/myandroid
pushd vendor/community/hero && ./unzip-files.sh && popd
{% endhighlight %}

If everything worked well you are ready to build your eclair for Hero. Do the following:

{% highlight bash %}cd ~/myandroid
. build/envsetup.sh
lunch community_hero_us-eng
make -j4
{% endhighlight %}

You will have to wait for some time, but if it all goes right you have just created eclair for Hero. Bear in mind that this is an clean Android no HTC no Google stuff!

It's time to build an update.zip. There are two methods for that, you could run the following:

{% highlight bash %}make otapackage
{% endhighlight %}

but this did not work for me.

Or you could create an update.zip from system.img as I did. I already have explained how to do this [here][6].  
There are some changes, use this [update-script][7], copy the boot.img from “~/myandroid/out/target/product/hero/system.img” to “~/update”

{% highlight bash %}cp ~/myandroid/out/target/product/hero/boot.img ~/update
{% endhighlight %}

and as last don't run this:

{% highlight bash %}zip -r update.zip system META-INF
{% endhighlight %}

but run this instead:

{% highlight bash %}zip -r update.zip system META-INF boot.img
{% endhighlight %}

When you finish signing your update.zip upload it to your phone, but DO NOT forget to make an backup with nandroid.  
Also BE AWARE that booting could take some time, for instance I had to wait 1 minute before the screen changed from “Hero” to “Android” and after that I needed to wait another minute for the phone to show login screen.

 [1]: http://wiki.github.com/loxK/android_vendor_community/compiling-for-htc-hero
 [2]: http://htcpedia.com/forum/showthread.php?t=1448
 [3]: http://files.coralic.nl/createAndroidEclairRepo.sh
 [4]: {{ site.baseurl }}/2009/10/25/creating-workspace-for-the-android-source/
 [5]: http://www.4shared.com/file/180010369/db272d/HERO21-18-Community-signed.html
 [6]: {{ site.baseurl }}/2010/01/25/how-to-create-update-zip-using-your-build-aka-system-img/
 [7]: http://files.coralic.nl/update-scriptEclair.txt