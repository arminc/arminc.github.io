---
title: VirtualBox 4.2 performance in Ubuntu 12.04
author: admin
layout: post
permalink: /2013/01/12/virtualbox-4-2-performance-in-ubuntu-12-04/
categories:
  - Linux
tags:
  - performance
  - Phoronix
  - Phoronix test suite
  - Ubuntu
  - virtualbox
  - workstation
---
I am using VirtualBox for a long time now, although i know there is an performance penalty i never bothered to check how big it was. I got curious and though maybe I should test this to see how it works out. This is not an scientific test or anything fancy just a simple tests that show a difference in performance between the hardware and VirtualBox 4.2. <!--more-->

**The machine I am running this test on is:**

*AMD Phenom II X6 1090T @ 3.20GHz (6 Cores), Memory: 8192MB, Disk: In Raid 0 = 250GB Seagate ST3250410AS + 250GB HDS722525VLSA80, Graphics: AMD Radeon HD 6800 1024MB*

**The VirtualBox:**

*AMD Phenom II X6 1090T @ 3.19GHz (6 Cores), Memory: 5120MB, Disk: 21GB VBOX HDD (on the raid disks), Graphics: InnoTek VirtualBox*

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
      VirtualBox(6 cores)
    </th>
    
    <th>
      Difference
    </th>
  </tr>
  
  <tr>
    <td>
      Apache Benchmark [system]
    </td>
    
    <td>
      25364.12
    </td>
    
    <td>
      <font color="#F70707">7079.97</font>
    </td>
    
    <td>
      72%
    </td>
  </tr>
  
  <tr>
    <td>
      NGINX [system]
    </td>
    
    <td>
      30298.94
    </td>
    
    <td>
      <font color="#F70707">11886.01</font>
    </td>
    
    <td>
      60%
    </td>
  </tr>
  
  <tr>
    <td>
      PostgreSQL [system]
    </td>
    
    <td>
      236.85
    </td>
    
    <td>
      <font color="#F70707">193.23</font>
    </td>
    
    <td>
      18%
    </td>
  </tr>
  
  <tr>
    <td>
      PostMark [disk]
    </td>
    
    <td>
      3571
    </td>
    
    <td>
      <font color="#F70707">213</font>
    </td>
    
    <td>
      94%
    </td>
  </tr>
  
  <tr>
    <td>
      IOzone Write [disk]
    </td>
    
    <td>
      62.10
    </td>
    
    <td>
      <font color="#F70707">41.22</font>
    </td>
    
    <td>
      33%
    </td>
  </tr>
  
  <tr>
    <td>
      IOzone Read [disk]
    </td>
    
    <td>
      4309.98
    </td>
    
    <td>
      <font color="#F70707">1068.72</font>
    </td>
    
    <td>
      75%
    </td>
  </tr>
  
  <tr>
    <td>
      C-Ray [cpu]
    </td>
    
    <td>
      58.72
    </td>
    
    <td>
      <font color="#F70707">125.20</font>
    </td>
    
    <td>
      113%
    </td>
  </tr>
  
  <tr>
    <td>
      POV-Ray [cpu]
    </td>
    
    <td>
      <font color="#F70707">959</font>
    </td>
    
    <td>
      817
    </td>
    
    <td>
      +14%
    </td>
  </tr>
  
  <tr>
    <td>
      Crafty [cpu]
    </td>
    
    <td>
      96.06
    </td>
    
    <td>
      <font color="#F70707">0.01 ??</font>
    </td>
    
    <td>
      ..
    </td>
  </tr>
  
  <tr>
    <td>
      PHPBench [system]
    </td>
    
    <td>
      67250
    </td>
    
    <td>
      <font color="#F70707">43562</font>
    </td>
    
    <td>
      35%
    </td>
  </tr>
  
  <tr>
    <td>
      GraphicsMagick [cpu]
    </td>
    
    <td>
      142
    </td>
    
    <td>
      <font color="#F70707">89</font>
    </td>
    
    <td>
      37%
    </td>
  </tr>
  
  <tr>
    <td>
      OpenSSL [cpu]
    </td>
    
    <td>
      104.13
    </td>
    
    <td>
      <font color="#F70707">19.20</font>
    </td>
    
    <td>
      81%
    </td>
  </tr>
  
  <tr>
    <td>
      John The Ripper [cpu]
    </td>
    
    <td>
      5418
    </td>
    
    <td>
      <font color="#F70707">3684</font>
    </td>
    
    <td>
      32%
    </td>
  </tr>
  
  <tr>
    <td>
      MAFFT [cpu]
    </td>
    
    <td>
      7.69
    </td>
    
    <td>
      <font color="#F70707">22.35</font>
    </td>
    
    <td>
      190%
    </td>
  </tr>
  
  <tr>
    <td>
      Himeno [cpu]
    </td>
    
    <td>
      625.87
    </td>
    
    <td>
      <font color="#F70707">518.17</font>
    </td>
    
    <td>
      17%
    </td>
  </tr>
  
  <tr>
    <td>
      HMMer [cpu]
    </td>
    
    <td>
      14.34
    </td>
    
    <td>
      <font color="#F70707">21.58</font>
    </td>
    
    <td>
      50%
    </td>
  </tr>
  
  <tr>
    <td>
      LAME MP3 Enc
    </td>
    
    <td>
      19.47
    </td>
    
    <td>
      <font color="#F70707">24.76</font>
    </td>
    
    <td>
      27%
    </td>
  </tr>
  
  <tr>
    <td>
      FFmpeg [cpu]
    </td>
    
    <td>
      28.70
    </td>
    
    <td>
      <font color="#F70707">41.94</font>
    </td>
    
    <td>
      46%
    </td>
  </tr>
  
  <tr>
    <td>
      LZMA Compres [cpu]
    </td>
    
    <td>
      174.19
    </td>
    
    <td>
      <font color="#F70707">286.20</font>
    </td>
    
    <td>
      64%
    </td>
  </tr>
  
  <tr>
    <td>
      BZIP2 Compres [cpu]
    </td>
    
    <td>
      10.72
    </td>
    
    <td>
      <font color="#F70707">15.79</font>
    </td>
    
    <td>
      47%
    </td>
  </tr>
  
  <tr>
    <td>
      NAS EP.B [cpu]
    </td>
    
    <td>
      152.25
    </td>
    
    <td>
      <font color="#F70707">110.69</font>
    </td>
    
    <td>
      27%
    </td>
  </tr>
  
  <tr>
    <td>
      NAS LU.A [cpu]
    </td>
    
    <td>
      7111.38
    </td>
    
    <td>
      <font color="#F70707">6199.18</font>
    </td>
    
    <td>
      12%
    </td>
  </tr>
  
  <tr>
    <td>
      Stream Copy [memory]
    </td>
    
    <td>
      9223.42
    </td>
    
    <td>
      <font color="#F70707">8976.57</font>
    </td>
    
    <td>
      2%
    </td>
  </tr>
  
  <tr>
    <td>
      Stream Scale [memory]
    </td>
    
    <td>
      8870.21
    </td>
    
    <td>
      <font color="#F70707">8548.39</font>
    </td>
    
    <td>
      3%
    </td>
  </tr>
  
  <tr>
    <td>
      Stream Add [memory]
    </td>
    
    <td>
      9717.47
    </td>
    
    <td>
      <font color="#F70707">9292.04</font>
    </td>
    
    <td>
      4%
    </td>
  </tr>
  
  <tr>
    <td>
      Triad [memory]
    </td>
    
    <td>
      9974.82
    </td>
    
    <td>
      <font color="#F70707">9511.68</font>
    </td>
    
    <td>
      4%
    </td>
  </tr>
</table>

Looking at the table i find the performance penalty very high actually, memory is the only part where the performance differences can be ignored. Does this mean i shouldn&#8217;t use VirtualBox, NO. It just means that if i am going to have any really heavy long running tasks i better not run them in an VM if i want speed. If you are running small tasks or daily stuff the performance drops are manageable and not always in the way.

 [1]: http://www.phoronix-test-suite.com