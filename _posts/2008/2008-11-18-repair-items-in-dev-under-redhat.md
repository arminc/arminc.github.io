---
title: Repair items in /dev under RedHat
layout: post
permalink: /2008/11/18/repair-items-in-dev-under-redhat/
categories:
  - linux
tags:
  - /dev
  - makedev
  - ptmx
  - pty
  - random
  - redhat
  - ssh
  - tty
  - urandom
description: Everyone knows this but I have to say it again, DONT forget to backup your stuff. 
---
Everyone knows this but I have to say it again, DONT forget to backup your stuff. Because if you don't you could end up spending valuable time recovering or repairing things like I had to. I will spare you the details what went wrong here that made it necessary to repair my /DEV, but the head problem was that I could not login with SSH and that terminal was not starting properly. This was happening because some of the items in /DEV where gone. To repair those tings this is what I did.

I am not giving you a solution to ONE problem or anything like that here. I am showing you how you can recover or repair some stuff in /dev in RedHat.

Creating /dev/null

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      mknod -m 666 /<em>dev/null</em> c 1 3
    </td>
  </tr>
</table>

Creating /dev/console

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      mknod -m 622 console c 5 1
    </td>
  </tr>
</table>

Create /dev/random

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      mknod -m 0644 /dev/random c 1 8
    </td>
  </tr>
</table>

Create /dev/urandom

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      mknod -m 0644 /dev/urandom c 1 9
    </td>
  </tr>
</table>

For creating pty, ptmx and tty you need MAKEDEV that can be found in /sbin. If it's not there try to copy it from another machine like I did, and placing it in /sbin.

Create pty,tty,ptmx

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      ./sbin/MAKEDEV pty<br /> ./sbin/MAKEDEV tty<br /> ./sbin/MAKEDEV ptmx
    </td>
  </tr>
</table>