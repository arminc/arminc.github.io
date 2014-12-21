---
title: Apache 2.4 vs Nginx 1.4
layout: post
permalink: /2013/05/12/apache-2-4-vs-nginx-1-4/
categories:
  - linux
tags:
  - apache
  - compare
  - nginx
  - performance
---
Having setup [Apache 2.4][1] and [Nginx 1.4][2] I wanted to see how they performed. I am not trying to do a scientific performance test here, I am just interested in how Nginx behaves because I haven&#8217;t used it before.<!--more-->

I took a simple page with a table, some JavaScript and CSS in a separate file. I am running the tests using Apache JMeter.

<table border="1">
  <tr>
    <th>
      Server
    </th>
    
    <th>
      Samples
    </th>
    
    <th>
      Average
    </th>
    
    <th>
      Median
    </th>
    
    <th>
      90% line
    </th>
    
    <th>
      min
    </th>
    
    <th>
      max
    </th>
    
    <th>
      error %
    </th>
    
    <th>
      Throughput
    </th>
    
    <th>
      KB/sec
    </th>
  </tr>
  
  <tr>
    <td colspan=10 BGCOLOR=CECBCB> 1 user, 1000 times</td>
  </tr>
  
  <tr>
    <td>
      apache
    </td>
    
    <td>
      1000
    </td>
    
    <td>
      2
    </td>
    
    <td>
      3
    </td>
    
    <td>
      4
    </td>
    
    <td>
      1
    </td>
    
    <td>
      7
    </td>
    
    <td>
    </td>
    
    <td>
      303
    </td>
    
    <td>
      1122
    </td>
  </tr>
  
  <tr>
    <td>
      nginx
    </td>
    
    <td>
      1000
    </td>
    
    <td>
      2
    </td>
    
    <td>
      2
    </td>
    
    <td>
      3
    </td>
    
    <td>
    </td>
    
    <td>
      6
    </td>
    
    <td>
    </td>
    
    <td>
      355
    </td>
    
    <td>
      1301
    </td>
  </tr>
  
  <tr>
    <td colspan=10 BGCOLOR=CECBCB> 10 users, 1000 times</td>
  </tr>
  
  <tr>
    <td>
      apache
    </td>
    
    <td>
      10000
    </td>
    
    <td>
      2
    </td>
    
    <td>
      2
    </td>
    
    <td>
      3
    </td>
    
    <td>
      1
    </td>
    
    <td>
      13
    </td>
    
    <td>
    </td>
    
    <td>
      3013
    </td>
    
    <td>
      11147
    </td>
  </tr>
  
  <tr>
    <td>
      nginx
    </td>
    
    <td>
      10000
    </td>
    
    <td>
      2
    </td>
    
    <td>
      3
    </td>
    
    <td>
      4
    </td>
    
    <td>
      1
    </td>
    
    <td>
      8
    </td>
    
    <td>
    </td>
    
    <td>
      2617
    </td>
    
    <td>
      9571
    </td>
  </tr>
  
  <tr>
    <td colspan=10 BGCOLOR=CECBCB> 100 users, 1000 times</td>
  </tr>
  
  <tr>
    <td>
      apache
    </td>
    
    <td>
      100000
    </td>
    
    <td>
      20
    </td>
    
    <td>
      14
    </td>
    
    <td>
      30
    </td>
    
    <td>
      1
    </td>
    
    <td>
      441
    </td>
    
    <td>
    </td>
    
    <td>
      4583
    </td>
    
    <td>
      16952
    </td>
  </tr>
  
  <tr>
    <td>
      nginx
    </td>
    
    <td>
      100000
    </td>
    
    <td>
      33
    </td>
    
    <td>
      19
    </td>
    
    <td>
      37
    </td>
    
    <td>
    </td>
    
    <td>
      1805
    </td>
    
    <td>
    </td>
    
    <td>
      2800
    </td>
    
    <td>
      10239
    </td>
  </tr><td colspan=10 BGCOLOR=CECBCB> 1000 users, 1000 times</td> </tr> 
  
  <tr>
    <td>
      apache
    </td>
    
    <td>
      1000000
    </td>
    
    <td>
      211
    </td>
    
    <td>
      194
    </td>
    
    <td>
      238
    </td>
    
    <td>
      1
    </td>
    
    <td>
      7508
    </td>
    
    <td>
    </td>
    
    <td>
      4629
    </td>
    
    <td>
      17124
    </td>
  </tr>
  
  <tr>
    <td>
      nginx
    </td>
    
    <td>
      1000000
    </td>
    
    <td>
      265
    </td>
    
    <td>
      28
    </td>
    
    <td>
      181
    </td>
    
    <td>
    </td>
    
    <td>
      248243
    </td>
    
    <td>
      0.05
    </td>
    
    <td>
      2647
    </td>
    
    <td>
      9678
    </td>
  </tr><td colspan=10 BGCOLOR=CECBCB> 10000 users, 10 times</td> </tr> 
  
  <tr>
    <td>
      apache
    </td>
    
    <td>
      100000
    </td>
    
    <td>
      596
    </td>
    
    <td>
      37
    </td>
    
    <td>
      704
    </td>
    
    <td>
    </td>
    
    <td>
      31064
    </td>
    
    <td>
      49
    </td>
    
    <td>
      3035
    </td>
    
    <td>
      7783
    </td>
  </tr>
  
  <tr>
    <td>
      nginx
    </td>
    
    <td>
      100000
    </td>
    
    <td>
      575
    </td>
    
    <td>
      3
    </td>
    
    <td>
      144
    </td>
    
    <td>
    </td>
    
    <td>
      32559
    </td>
    
    <td>
      53
    </td>
    
    <td>
      2823
    </td>
    
    <td>
      6920
    </td>
  </tr>
</table>

Looking at the results it seems that in the beginning there is no big difference. The difference starts with bigger numbers where Nginx shows higher average numbers because it fails to respond or responds very late in some cases. Although the average numbers are high because of the reasons managed you can see that most calls are handled faster. 

Nginx is supposed to use less resources so I used the “uptime” command before starting the test and right after the test, here are the results (measured only for test: 1000 users, 1000 times):

<table border="1">
  <tr>
    <th>
      Server
    </th>
    
    <th>
      Average load before the test
    </th>
    
    <th>
      Average load after the test
    </th>
  </tr>
  
  <tr>
    <td>
      apache
    </td>
    
    <td>
      1,55, 0,33, 0,11
    </td>
    
    <td>
      18,74, 9,97, 4,02
    </td>
  </tr>
  
  <tr>
    <td>
      apache
    </td>
    
    <td>
      0,69, 0,16, 0,05
    </td>
    
    <td>
      1,02, 0,77, 0,36
    </td>
  </tr>
</table>

It clearly shows that Nginx uses less CPU than Apache for the same work, the difference is so big you can see it by just looking at the system monitor.

I like what I see from Nginx and I am definitely going to play more with it.

 [1]: http://blog.coralic.nl/2013/05/11/apache-2-4-on-ubuntu-13-04-from-source/
 [2]: http://blog.coralic.nl/2013/05/12/nginx-1-4-on-ubuntu-13-04-from-source/