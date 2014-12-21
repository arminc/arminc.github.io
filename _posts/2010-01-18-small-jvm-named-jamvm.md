---
title: Small JVM named Jamvm
layout: post
permalink: /2010/01/18/small-jvm-named-jamvm/
categories:
  - java
tags:
  - compile jamvm
  - gnu classes
  - jamvm
  - jvm
  - small jvm
---
Some of you may have heard about Jamvm, for all others, Jamvm is an very small opensource JVM. You may ask your self why do I need it, now there are couple of reasons you would like to use Jamvm. For example you want to run java on an mobile device or a router with very limited space on it, or you want to distribute your Java application but don&#8217;t want to depend on installed Java. At the end possibilities are endless. In this post I am going to show you how to compile and use JVM. <!--more-->

To use Jamvm we need to download and compile it:

<pre>wget http://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%201.5.4/jamvm-1.5.4.tar.gz?use_mirror=ovh
tar xvf jamvm-1.5.4.tar.gz
cd jamvm-1.5.4/
./configure
make
sudo make install
</pre>

The default installation location is /usr/local. If you need more info or want to change options please look in to the INTALL doc.

Now that we have jamvm compiled we need to make it work. Jamvm uses GNU classpath. GNU classpath is available as source [here][1] but can be also installed as binary:

<pre>sudo aptitude install classpath classpath-common classpath-gtkpeer
</pre>

I was going to show you how to compile GNU classes here but after countless tries on my own machine with different java versions I just gave up, I could not get it to compile. To get it to work I just installed the binary version and used that.

To show you how jamvm works and to show you that you can bring it&#8217;s complete size down I create an zip file. The zip contains the following:  
HelloWorldApp = prints Hello World  
jamvm = jamvm binary  
run.sh = bash script to run HelloWorlApp  
classes.zip = zip file containing classes needed by jamvm  
glibj.zip = gnu classpath classes, I striped this from 9MB to 1.3MB in 5 minutes, you can go further by only using what you really really need.  
3x.so = 3 so libraries needed by jamvm, these are from my 64bit Ubuntu machine

Just run run.sh and you will see “Hello World!”

[DOWNLOAD the zip here! ][2]

Some additional info, I tried adding HelloWorldApp to classpath so jamvm can run it but for some reason I needed to add it to -Xbootclasspath instead of classpath.

 [1]: http://www.gnu.org/software/classpath/downloads/downloads.html
 [2]: http://files.coralic.nl/jamvm.zip