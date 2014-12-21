---
title: Build Eclair aka Android 2.1 for Hero from source
layout: post
permalink: /2010/01/28/build-eclair-aka-android-2-1-for-hero-from-source/
categories:
  - Android
---
First of all let met thank (loxK, kiall, jnwhiteh and Behnaam) because those guys are doing a very good job buy creating rom&#8217;s for Hero and posting there information on the net. This post is all about eclair and Hero. What you will see here is how to build eclair for Hero and how to create an update.zip so you can flash your Hero. <!--more-->

To do this you need couple of things, a workspace, eclair sources, hero vendor settings from the github [(provided by loxK, kiall and jnwhiteh)][1] and you need the HERO21 rom [(provided by loxK and Behnaam)][2].

Let&#8217;s start by creating an workspace, to make it easy for you guys I made an script that will do everything for you. You can download it [HERE][3]. Be CAREFULL if you already have used my other [script][4] you will already have an folder called myandroid in your home directory. If so then you have two choices you can delete the myandroid folder

<pre class="brush: bash; title: ; notranslate" title="">cd ~
rm -rf myandroid
</pre>

or you could replace the words “myandroid” to “myeclair” in the script.

So what does the script do, It installs required packages, setups folders, initializes the eclair repo, it initializes github repo (Hero vendor). Now that you have your workspace initialized it&#8217;s time to proceed.

Before we can compile we need to do two more things.  
**First:**  
I found some problems with the Hero vendor settings so I had to modify them, this is what I did.

<pre class="brush: bash; title: ; notranslate" title="">gedit ~/myandroid/vendor/community/products/AndroidProducts.mk
</pre>

Remove this:

<pre class="brush: bash; title: ; notranslate" title="">$(LOCAL_DIR)/community_hero_eu.mk \
</pre>

Now remove community\_hero\_eu.mk:

<pre class="brush: bash; title: ; notranslate" title="">rm ~/myandroid/vendor/community/products/ community_hero_eu.mk
</pre>

**Second:**  
Download the HERO21 rom from [HERE][5] and save it in “~/myandroid” as “update-hero.zip”. Now unzip the files needed by doing:

<pre class="brush: bash; title: ; notranslate" title="">cd ~/myandroid
pushd vendor/community/hero && ./unzip-files.sh && popd
</pre>

If everything worked well you are ready to build your eclair for Hero. Do the following:

<pre class="brush: bash; title: ; notranslate" title="">cd ~/myandroid
. build/envsetup.sh
lunch community_hero_us-eng
make -j4
</pre>

You will have to wait for some time, but if it all goes right you have just created eclair for Hero. Bear in mind that this is an clean Android no HTC no Google stuff!

It&#8217;s time to build an update.zip. There are two methods for that, you could run the following:

<pre class="brush: bash; title: ; notranslate" title="">make otapackage
</pre>

but this did not work for me.

Or you could create an update.zip from system.img as I did. I already have explained how to do this [here][6].  
There are some changes, use this [update-script][7], copy the boot.img from “~/myandroid/out/target/product/hero/system.img” to “~/update”

<pre class="brush: bash; title: ; notranslate" title="">cp ~/myandroid/out/target/product/hero/boot.img ~/update
</pre>

and as last don&#8217;t run this:

<pre class="brush: bash; title: ; notranslate" title="">zip -r update.zip system META-INF
</pre>

but run this instead:

<pre class="brush: bash; title: ; notranslate" title="">zip -r update.zip system META-INF boot.img
</pre>

When you finish signing your update.zip upload it to your phone, but DO NOT forget to make an backup with nandroid.  
Also BE AWARE that booting could take some time, for instance I had to wait 1 minute before the screen changed from “Hero” to “Android” and after that I needed to wait another minute for the phone to show login screen.

 [1]: http://wiki.github.com/loxK/android_vendor_community/compiling-for-htc-hero
 [2]: http://htcpedia.com/forum/showthread.php?t=1448
 [3]: http://files.coralic.nl/createAndroidEclairRepo.sh
 [4]: http://blog.coralic.nl/2009/10/25/creating-workspace-for-the-android-source/
 [5]: http://www.4shared.com/file/180010369/db272d/HERO21-18-Community-signed.html
 [6]: http://blog.coralic.nl/2010/01/25/how-to-create-update-zip-using-your-build-aka-system-img/
 [7]: http://files.coralic.nl/update-scriptEclair.txt