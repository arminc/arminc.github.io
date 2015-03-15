---
title: Creating chroot for arm on Ubuntu with rootstock
layout: post
permalink: /2010/08/12/creating-chroot-for-arm-on-ubuntu-with-rootstock/
categories:
  - linux
tags:
  - chroot
  - chroot arm ubuntu
  - ubuntu
  - ubuntu arm
description: Some of you may or may not be familiar with chroot, for those who are familiar with chroot good job and for those that aren't shame on you.
---
Some of you may or may not be familiar with chroot, for those who are familiar with chroot good job and for those that aren't shame on you. Just kidding please read this for some more info about [chroot][1].  
Now that we all know what chroot is, maybe it could be fun to create an chroot environment, and to make it more exciting we are not creating an x86 but an arm processor environment :)

There are tons of ways of doing this but this is how I am doing it. You can use this method on any ubuntu from 9.04 and higher, but keep in mind I am using 10.04 so if you get error's try to blame it on that instead off me. So first thing we need to do is prep our own ubuntu machine to be able to build a chroot environment. To do so we install rootstock, and we do it like this:

{% highlight bash %}sudo aptitude install rootstock
{% endhighlight %}

Now we can create a chroot with rootstock, this is an simple example of no nonsense chroot:

{% highlight bash %}sudo rootstock -f localhost --login ubuntu --password ubuntu --imagesize 1G --notarball
{% endhighlight %}

If you wish to know what this all means I recommend you to do:

{% highlight bash %}man rootstock
{% endhighlight %}

To be able to access this chroot environment we need to mount it like this:

{% highlight bash %}sudo mount -o loop IMG-FILE_NAME /mnt
sudo mount -t proc proc /mnt/proc
{% endhighlight %}

Now we can enter our chroot:

{% highlight bash %}chroot /mnt /bin/bash
{% endhighlight %}

Or exit it and umount it like this:

{% highlight bash %}sudo umount proc 
sudo umount /mnt
{% endhighlight %}

So here you go small simple way of creating a chroot environment. Is that all you may ask your self, no it's not, what we actually have created here above is a empty non fun chroot environment. So instead of that let's try to make something more fun and exciting like have access to internet, have ssh server running, have an vncserver running. Here are the steps in how to do this.

Step 1, Create the image containing ssh tightvncserver lxde

{% highlight bash %}sudo rootstock -f localhost --login ubuntu --password ubuntu --imagesize 1G --notarball --dist lucid --seed ssh,tightvncserver,lxde,expect
{% endhighlight %}

Step 2, Start the chroot environment. You can use my script from [here][2] or do this:

{% highlight bash %}sudo mount -o loop imgNAME /mnt
sudo mount -t proc proc /mnt/proc 
sudo mount -t devpts devpts /mnt/dev/pts
sudo su -c 'chroot /mnt /bin/bash'
{% endhighlight %}

To be able to use SSH or VNC you need to configure some things. I have created an script that can do this for you, you can download it from [here][3].

Step 3, Configure:  
Open an new terminal and then:

{% highlight bash %}sudo cp config.sh /mnt
{% endhighlight %}

Go back to your chroot and then:

{% highlight bash %}chmod +x config.sh
./config.sh
{% endhighlight %}

Step 4, If you want to use SSH or VNC you will need to start those every time you login to your chroot. You can do this by running these command's

{% highlight bash %}vncserver -geometry 800x600
/etc/init.d/ssh restart
{% endhighlight %}

OPTIONAL: You can also add these commands to your bashrc script so that they will be executed for you. You can do this by running this, if you haven't run step 3 yet you can also uncoment these two lines from my config.sh script.

{% highlight bash %}sed -i '1i vncserver -geometry 800x600' /root/.bashrc 
sed -i '1i /etc/init.d/ssh restart' /root/.bashrc
{% endhighlight %}

Step 5, To quit the chroot just do the following or use my script from [here][4]:

{% highlight bash %}exit
sudo umount /mnt/dev/pts 
sudo umount /mnt/proc 
sudo umount /mnt
{% endhighlight %}

You all are set now, you have an arm ubuntu image and you have configured it all that is left to do is use it.

As always there are people I would like to give credits to, and this time it's [Nexus One Hacks][5].

**UPDATE** For those who don't like to do all this here is an img I created: [Download][6]

 [1]: http://en.wikipedia.org/wiki/Chroot
 [2]: {{ site.baseurl }}/assets/files/ArmChrootUbuntu/start.sh
 [3]: {{ site.baseurl }}/assets/files/ArmChrootUbuntu/config.sh
 [4]: {{ site.baseurl }}/assets/files/ArmChrootUbuntu/stop.sh
 [5]: http://nexusonehacks.net/nexus-one-hacks/how-to-install-ubuntu-on-your-nexus-oneandroid/
 [6]: http://www.megaupload.com/?d=YKUX4Q89