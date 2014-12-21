---
title: Creating chroot for arm on Ubuntu with rootstock
layout: post
permalink: /2010/08/12/creating-chroot-for-arm-on-ubuntu-with-rootstock/
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
categories:
  - Linux
tags:
  - chroot
  - chroot arm ubuntu
  - Ubuntu
  - ubuntu arm
---
Some of you may or may not be familiar with chroot, for those who are familiar with chroot good job and for those that aren&#8217;t shame on you. Just kidding please read this for some more info about [chroot][1].  
Now that we all know what chroot is, maybe it could be fun to create an chroot environment, and to make it more exciting we are not creating an x86 but an arm processor environment <img src='http://blog.coralic.nl/wp-includes/images/smilies/icon_smile.gif' alt=':)' class='wp-smiley' /> <!--more-->

There are tons of ways of doing this but this is how I am doing it. You can use this method on any ubuntu from 9.04 and higher, but keep in mind I am using 10.04 so if you get error&#8217;s try to blame it on that instead off me. So first thing we need to do is prep our own ubuntu machine to be able to build a chroot environment. To do so we install rootstock, and we do it like this:

<pre class="brush: bash; title: ; notranslate" title="">sudo aptitude install rootstock
</pre>

Now we can create a chroot with rootstock, this is an simple example of no nonsense chroot:

<pre class="brush: bash; title: ; notranslate" title="">sudo rootstock -f localhost --login ubuntu --password ubuntu --imagesize 1G --notarball
</pre>

If you wish to know what this all means I recommend you to do:

<pre class="brush: bash; title: ; notranslate" title="">man rootstock
</pre>

To be able to access this chroot environment we need to mount it like this:

<pre class="brush: bash; title: ; notranslate" title="">sudo mount -o loop IMG-FILE_NAME /mnt
sudo mount -t proc proc /mnt/proc
</pre>

Now we can enter our chroot:

<pre class="brush: bash; title: ; notranslate" title="">chroot /mnt /bin/bash
</pre>

Or exit it and umount it like this:

<pre class="brush: bash; title: ; notranslate" title="">sudo umount proc 
sudo umount /mnt
</pre>

So here you go small simple way of creating a chroot environment. Is that all you may ask your self, no it&#8217;s not, what we actually have created here above is a empty non fun chroot environment. So instead of that let&#8217;s try to make something more fun and exciting like have access to internet, have ssh server running, have an vncserver running. Here are the steps in how to do this.

Step 1, Create the image containing ssh tightvncserver lxde

<pre class="brush: bash; title: ; notranslate" title="">sudo rootstock -f localhost --login ubuntu --password ubuntu --imagesize 1G --notarball --dist lucid --seed ssh,tightvncserver,lxde,expect
</pre>

Step 2, Start the chroot environment. You can use my script from [here][2] or do this:

<pre class="brush: bash; title: ; notranslate" title="">sudo mount -o loop imgNAME /mnt
sudo mount -t proc proc /mnt/proc 
sudo mount -t devpts devpts /mnt/dev/pts
sudo su -c 'chroot /mnt /bin/bash'
</pre>

To be able to use SSH or VNC you need to configure some things. I have created an script that can do this for you, you can download it from [here][3].

Step 3, Configure:  
Open an new terminal and then:

<pre class="brush: bash; title: ; notranslate" title="">sudo cp config.sh /mnt
</pre>

Go back to your chroot and then:

<pre class="brush: bash; title: ; notranslate" title="">chmod +x config.sh
./config.sh
</pre>

Step 4, If you want to use SSH or VNC you will need to start those every time you login to your chroot. You can do this by running these command&#8217;s

<pre class="brush: bash; title: ; notranslate" title="">vncserver -geometry 800x600
/etc/init.d/ssh restart
</pre>

OPTIONAL: You can also add these commands to your bashrc script so that they will be executed for you. You can do this by running this, if you haven&#8217;t run step 3 yet you can also uncoment these two lines from my config.sh script.

<pre class="brush: bash; title: ; notranslate" title="">sed -i '1i vncserver -geometry 800x600' /root/.bashrc 
sed -i '1i /etc/init.d/ssh restart' /root/.bashrc
</pre>

Step 5, To quit the chroot just do the following or use my script from [here][4]:

<pre class="brush: bash; title: ; notranslate" title="">exit
sudo umount /mnt/dev/pts 
sudo umount /mnt/proc 
sudo umount /mnt
</pre>

You all are set now, you have an arm ubuntu image and you have configured it all that is left to do is use it.

As always there are people I would like to give credits to, and this time it&#8217;s [Nexus One Hacks][5].

**UPDATE** For those who don&#8217;t like to do all this here is an img I created: [Download][6]{.broken_link}

 [1]: http://en.wikipedia.org/wiki/Chroot
 [2]: http://files.coralic.nl/ArmChrootUbuntu/start.sh
 [3]: http://files.coralic.nl/ArmChrootUbuntu/config.sh
 [4]: http://files.coralic.nl/ArmChrootUbuntu/stop.sh
 [5]: http://nexusonehacks.net/nexus-one-hacks/how-to-install-ubuntu-on-your-nexus-oneandroid/
 [6]: http://www.megaupload.com/?d=YKUX4Q89