---
title: How to create otapackage (aka update.zip) from your build
layout: post
permalink: /2010/01/27/how-to-create-otapackage-aka-update-zip-from-your-build/
categories:
  - Android
---
When you compile your android source and you want to create an automatic update.zip instead of your own then do this: <!--more-->

<pre class="brush: bash; title: ; notranslate" title="">TARGET_NO_RADIOIMAGE=true make otapackage
</pre>

You can leave the TARGET\_NO\_RADIOIMAGE=true out if you wish it just tells the make script to leave out the RADIOIMAGE.