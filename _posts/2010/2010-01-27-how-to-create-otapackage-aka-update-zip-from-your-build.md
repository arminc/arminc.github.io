---
title: How to create otapackage (aka update.zip) from your build
layout: post
permalink: /2010/01/27/how-to-create-otapackage-aka-update-zip-from-your-build/
categories:
  - android
description: When you compile your android source and you want to create an automatic update.zip instead of your own then do this 
---
When you compile your android source and you want to create an automatic update.zip instead of your own then do this: 

{% highlight bash %}TARGET_NO_RADIOIMAGE=true make otapackage
{% endhighlight %}

You can leave the TARGET_NO_RADIOIMAGE=true out if you wish it just tells the make script to leave out the RADIOIMAGE.