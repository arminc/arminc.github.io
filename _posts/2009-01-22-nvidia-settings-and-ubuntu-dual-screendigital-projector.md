---
title: nvidia-settings and Ubuntu (dual screen,digital projector)
layout: post
permalink: /2009/01/22/nvidia-settings-and-ubuntu-dual-screendigital-projector/
categories:
  - linux
tags:
  - dual screen
  - nvidia
  - nvidia-settings
  - second screen
  - ubuntu
---
<!-- 	 	 -->

Couple of days ago i needed to connect digital projector and an second screen to my laptop. I found out that when you have an nvidia graphics card you can use a nice graphical utility to do this instead of manual approach with xorg.

Just install:

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <tr>
    <td width="100%" valign="top">
      sudo apt-get install nvidia-settings
    </td>
  </tr>
</table>

and then start with:

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      nvidia-settings.
    </td>
  </tr>
</table>

With this tool you are able to change settings, detect external displays and attach them very easily. This settings tool helped me so I thought I would just spread the word.