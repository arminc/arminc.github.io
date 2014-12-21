---
title: VirtualBox 4.2 vs VMware Player 5
layout: post
permalink: /2013/01/13/virtualbox-4-2-vs-vmware-player-5/
categories:
  - linux
tags:
  - performance
  - virtualbox
  - virtualbox 4.2
  - virtualbox vs vmware
  - vmware
  - vmware player
description: Yesterday i tested the performance of [VirtualBox][1] and i thought it should be nice to see how it compares against the famous VMware. I chose to test the VMware Player instead of the workstation because it is free. The first big difference between VirtualBox and VMware Player was that the Player did not allow more than 4 cpu's to be assigned. 
---
Yesterday i tested the performance of [VirtualBox][1] and i thought it should be nice to see how it compares against the famous VMware. I chose to test the VMware Player instead of the workstation because it is free. The first big difference between VirtualBox and VMware Player was that the Player did not allow more than 4 cpu's to be assigned. 

I was to lazy to retest VirtualBox with 4 cores so i am comparing VMware Player with 4 cores against VirtualBox with 6 cores on the same machine. The settings for VMware are the same as for the [VirtualBox][1]. 

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
      1220.99??
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
      391
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
      9050.65
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
      8694.84
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
      9437.53
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
      9626.59
    </td>
  </tr>
</table>

Looking at the results i think the conclusion is that VMware Player gives better performance than VirtualBox. Because of the 4 cores in VMware in stead of 6 in VirtualBox it looses almost all of the cpu tests. 

VMware player lacks some of the features VirtualBox has but if you don't need those maybe it is a better choice?

 [1]: http://blog.coralic.nl/2013/01/12/virtualbox-4-2-performance-in-ubuntu-12-04/