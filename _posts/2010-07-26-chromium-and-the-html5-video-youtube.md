---
title: Chromium and the HTML5 video (Youtube)
layout: post
permalink: /2010/07/26/chromium-and-the-html5-video-youtube/
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
categories:
  - Other
---
If you are like me and are using chromium (dev channel) instead of chrome you may have noticed that playing HTML5 video from youtube or others is not working. That is because the default chromium ships with free codecs only. So to fix this problem do the following.<!--more-->

With your chromium try to watch this movie: 

<span class='embed-youtube' style='text-align:center; display: block;'></span>

If you are not able to play it do this, install the non free codec provided by chromium:

<pre class="brush: bash; title: ; notranslate" title="">sudo aptitude install chromium-codecs-ffmpeg-nonfree
</pre>

Now restart chromium and you are off. Does it work now?