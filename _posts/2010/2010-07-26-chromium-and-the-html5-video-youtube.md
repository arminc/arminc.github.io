---
title: Chromium and the HTML5 video (Youtube)
layout: post
permalink: /2010/07/26/chromium-and-the-html5-video-youtube/
categories:
  - other
description: If you are like me and are using chromium (dev channel) instead of chrome you may have noticed that playing HTML5 video from youtube or others is not working. That is because the default chromium ships with free codecs only. So to fix this problem do the following.
---
If you are like me and are using chromium (dev channel) instead of chrome you may have noticed that playing HTML5 video from youtube or others is not working. That is because the default chromium ships with free codecs only. So to fix this problem do the following.

With your chromium try to watch this movie: 

<iframe width="560" height="315" src="https://www.youtube.com/embed/_nQDU7HOStc" frameborder="0" allowfullscreen></iframe>

If you are not able to play it do this, install the non free codec provided by chromium:

{% highlight bash %}sudo aptitude install chromium-codecs-ffmpeg-nonfree
{% endhighlight %}

Now restart chromium and you are off. Does it work now?