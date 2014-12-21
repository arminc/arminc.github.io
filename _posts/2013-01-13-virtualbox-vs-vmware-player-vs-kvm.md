---
title: VirtualBox vs VMware Player vs KVM
author: admin
layout: post
permalink: /2013/01/13/virtualbox-vs-vmware-player-vs-kvm/
categories:
  - Linux
tags:
  - kvm
  - performance
  - virtualbox
  - virtualbox vs vmware vs kvm
  - vmware
  - vmware player
---
I was testing the performance of [VirtualBox and VMware Player][1] when i thought maybe i should test one of the more bare metal hypervisors like xen, kvm or esxi. Xen needs more config than kvm and esxi is without actual host so i decided to try out kvm because it is the easiest one to setup.<!--more-->

The settings for this test are the same as for [VirtualBox][2].

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
      VMware Player(4 cores)
    </th>
    
    <th>
      KVM
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
      20555.10
    </td>
    
    <td>
      21621.75
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
      18968.06
    </td>
    
    <td>
      17577.74
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
      193.23
    </td>
    
    <td>
      1220.99??
    </td>
    
    <td>
      <font color="#F70707">151.61</font>
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
      213
    </td>
    
    <td>
      391
    </td>
    
    <td>
      <font color="#F70707">156</font>
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
      98.91??
    </td>
    
    <td>
      73.74??
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
      1083.34
    </td>
    
    <td>
      1174.45
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
      125.20
    </td>
    
    <td>
      <font color="#F70707">173.29</font>
    </td>
    
    <td>
      115.67
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
      777
    </td>
    
    <td>
      756
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
      <font color="#F70707">0.01??</font>
    </td>
    
    <td>
      0.01??
    </td>
    
    <td>
      0.01??
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
      48452
    </td>
    
    <td>
      49120
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
      89
    </td>
    
    <td>
      100
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
      21.27
    </td>
    
    <td>
      21.53
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
      3684
    </td>
    
    <td>
      <font color="#F70707">2768</font>
    </td>
    
    <td>
      3996
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
      14.75
    </td>
    
    <td>
      13.34
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
      558.65
    </td>
    
    <td>
      559.75
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
      21.58
    </td>
    
    <td>
      <font color="#F70707">25.25</font>
    </td>
    
    <td>
      19.26
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
      22.91
    </td>
    
    <td>
      22.66
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
      37.01
    </td>
    
    <td>
      36.10
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
      270.72
    </td>
    
    <td>
      263.37
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
      15.79
    </td>
    
    <td>
      <font color="#F70707">21.36</font>
    </td>
    
    <td>
      15.89
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
      110.69
    </td>
    
    <td>
      <font color="#F70707">78.73</font>
    </td>
    
    <td>
      116.16
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
      6199.18
    </td>
    
    <td>
      <font color="#F70707">5145.94</font>
    </td>
    
    <td>
      6749.69
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
      8976.57
    </td>
    
    <td>
      9050.65
    </td>
    
    <td>
      <font color="#F70707">7249.76</font>
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
      8548.39
    </td>
    
    <td>
      8694.84
    </td>
    
    <td>
      <font color="#F70707">7101.33</font>
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
      9292.04
    </td>
    
    <td>
      9437.53
    </td>
    
    <td>
      <font color="#F70707">8175.45</font>
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
      9511.68
    </td>
    
    <td>
      9626.59
    </td>
    
    <td>
      <font color="#F70707">8248.95</font>
    </td>
  </tr>
</table>

Overall KVM gives better performance than VirtualBox and VMware, i find it strange that the memory is the one that is slower. KVM gives better performance when looking at the rough power but when it comes to desktop (graphics) it really is behind the other two. There are options to speed it up but it is still not great. I would say use KVM for headless instances.

 [1]: http://blog.coralic.nl/2013/01/13/virtualbox-4-2-vs-vmware-player-5/
 [2]: http://blog.coralic.nl/2013/01/12/virtualbox-4-2-performance-in-ubuntu-12-04/