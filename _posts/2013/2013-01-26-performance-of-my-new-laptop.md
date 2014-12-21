---
title: Performance of my new laptop
layout: post
permalink: /2013/01/26/performance-of-my-new-laptop/
categories:
  - linux
tags:
  - dell m4700
  - i7-3840qm
  - performance
description: Couple of days ago I got my new laptop (Dell M4700) to replace my old one. I was interested in how it performed compared to my old laptop, to make it more interesting I added my desktop (AMD) to the comparison as well.
---
Couple of days ago I got my new laptop (Dell M4700) to replace my old one. I was interested in how it performed compared to my old laptop, to make it more interesting I added my desktop (AMD) to the comparison as well. 

**My own Desktop**

*AMD Phenom II X6 1090T @ 3.20GHz (6 Cores), Memory: 8192MB, Disk: In Raid 0 = 250GB Seagate ST3250410AS + 250GB HDS722525VLSA80, Graphics: AMD Radeon HD 6800 1024MB*

**My old Laptop**

*Intel Core 2 Duo P8700, Memory: 4096MB, Disk: 120GB Intel SSD, Intel Mobile 4 IGP*

**My NEW Laptop**

*Intel Core i7-3840QM, Memory: 24GB, Disk: 120GB Intel SSD, Graphics: NVIDIA Quadro K2000M*

I am using [Phoronix Test Suite][1] for testing and i am running the &#8220;workstation&#8221; suite.

**The results:**

<table border="1">
  <tr>
    <th>
      Test
    </th>
    
    <th>
      Hardware
    </th>
    
    <th>
      Old laptop
    </th>
    
    <th>
      NEW laptop
    </th>
  </tr>
  
  <tr>
    <td>
      Apache Benchmark [system] more is better
    </td>
    
    <td>
      25364.12
    </td>
    
    <td>
      5968.28
    </td>
    
    <td>
      33537.00
    </td>
  </tr>
  
  <tr>
    <td>
      NGINX [system] more is better
    </td>
    
    <td>
      30298.94
    </td>
    
    <td>
      9993.08
    </td>
    
    <td>
      33702.74
    </td>
  </tr>
  
  <tr>
    <td>
      PostgreSQL [system] more is better
    </td>
    
    <td>
      236.85
    </td>
    
    <td>
      161
    </td>
    
    <td>
      2749.01
    </td>
  </tr>
  
  <tr>
    <td>
      PostMark [disk] more is better
    </td>
    
    <td>
      3571
    </td>
    
    <td>
      1621
    </td>
    
    <td>
      5875
    </td>
  </tr>
  
  <tr>
    <td>
      IOzone Write [disk] more is better
    </td>
    
    <td>
      62.10
    </td>
    
    <td>
      74.54
    </td>
    
    <td>
      127.21
    </td>
  </tr>
  
  <tr>
    <td>
      IOzone Read [disk] more is better
    </td>
    
    <td>
      4309.98
    </td>
    
    <td>
      257.97
    </td>
    
    <td>
      8748.12
    </td>
  </tr>
  
  <tr>
    <td>
      C-Ray [cpu] less is better
    </td>
    
    <td>
      58.72
    </td>
    
    <td>
      263.87
    </td>
    
    <td>
      46.26
    </td>
  </tr>
  
  <tr>
    <td>
      POV-Ray [cpu] less is better
    </td>
    
    <td>
      959
    </td>
    
    <td>
      1926
    </td>
    
    <td>
      668
    </td>
  </tr>
  
  <tr>
    <td>
      Crafty [cpu] less is better
    </td>
    
    <td>
      96.06
    </td>
    
    <td>
      210.88
    </td>
    
    <td>
      74.83
    </td>
  </tr>
  
  <tr>
    <td>
      PHPBench [system] more is better
    </td>
    
    <td>
      67250
    </td>
    
    <td>
      33087
    </td>
    
    <td>
      98749
    </td>
  </tr>
  
  <tr>
    <td>
      GraphicsMagick [cpu] more is better
    </td>
    
    <td>
      142
    </td>
    
    <td>
      54
    </td>
    
    <td>
      197
    </td>
  </tr>
  
  <tr>
    <td>
      OpenSSL [cpu] more is better
    </td>
    
    <td>
      104.13
    </td>
    
    <td>
      34.80
    </td>
    
    <td>
      126.07
    </td>
  </tr>
  
  <tr>
    <td>
      John The Ripper [cpu] more is better
    </td>
    
    <td>
      5418
    </td>
    
    <td>
      870
    </td>
    
    <td>
      5805
    </td>
  </tr>
  
  <tr>
    <td>
      MAFFT [cpu] less is better
    </td>
    
    <td>
      7.69
    </td>
    
    <td>
      36.25
    </td>
    
    <td>
      5.82
    </td>
  </tr>
  
  <tr>
    <td>
      Himeno [cpu] more is better
    </td>
    
    <td>
      625.87
    </td>
    
    <td>
      571.53
    </td>
    
    <td>
    </td>
  </tr>
  
  <tr>
    <td>
      HMMer [cpu] less is better
    </td>
    
    <td>
      14.34
    </td>
    
    <td>
      66.91
    </td>
    
    <td>
      10.83
    </td>
  </tr>
  
  <tr>
    <td>
      LAME MP3 Enc less is better
    </td>
    
    <td>
      19.47
    </td>
    
    <td>
      24.76
    </td>
    
    <td>
      13.31
    </td>
  </tr>
  
  <tr>
    <td>
      FFmpeg [cpu] less is better
    </td>
    
    <td>
      28.70
    </td>
    
    <td>
      45.39
    </td>
    
    <td>
      18.93
    </td>
  </tr>
  
  <tr>
    <td>
      LZMA Compres [cpu] less is better
    </td>
    
    <td>
      174.19
    </td>
    
    <td>
      307.11
    </td>
    
    <td>
      145.62
    </td>
  </tr>
  
  <tr>
    <td>
      BZIP2 Compres [cpu] less is better
    </td>
    
    <td>
      10.72
    </td>
    
    <td>
      47.46
    </td>
    
    <td>
      8.09
    </td>
  </tr>
  
  <tr>
    <td>
      NAS EP.B [cpu] more is better
    </td>
    
    <td>
      152.25
    </td>
    
    <td>
      31.41
    </td>
    
    <td>
      273.36
    </td>
  </tr>
</table>

My new lap seems to perform very well <img src='http://blog.coralic.nl/wp-includes/images/smilies/icon_smile.gif' alt=':)' class='wp-smiley' />

 [1]: http://www.phoronix-test-suite.com