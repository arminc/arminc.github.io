---
title: Accessing internet from Ubuntu behind the ISA Server
author: admin
layout: post
permalink: /2008/10/26/accessing-internet-from-ubuntu-behind-the-isa-server/
categories:
  - Linux
tags:
  - ISA
  - Linux
  - NTLMAPS
  - proxy
  - WAS
---
When you are behind a ISA server in let&#8217;s say business network you can use Firefox to just surf the net. Because Firefox detects can detect the proxy settings and it will trow you the login screen. But when you need to be able to update your Ubuntu from that network or just proxy your whole Ubuntu PC/laptop you can use NTLMAPS to accomplish that.

<p style="margin-bottom:0" lang="en-US">
  What NTLMAPS actually does is connects to the ISA server and sets up a local proxy. By setting your Ubuntu to use the local proxy you are acutely surfing trough the proxy.
</p>

<p style="margin-bottom:0" lang="en-US">
  <!--more-->Step 1)
  
  <br /> Download <a title="NTLMAPS" href="http://ntlmaps.sourceforge.net/" target="_blank">NTLMAPS</a>
</p>

<pre>wget http://jaist.dl.sourceforge.net/sourceforge/ntlmaps/ntlmaps-0.9.9.0.1.tar.gz</pre>

Step 2)  
Unpack the tar file

<pre>tar xvfz  ntlmaps-0.9.9.0.1.tar.gz</pre>

Step 3)  
Install python

<pre>sudo apt-get install python</pre>

Step 4)  
Edit server.cfg

<pre>gedit server.cfg</pre>

Interesting things to edit in the server.cfg are:  
LISTEN_PORT (local port on witch your local proxy server will listen)  
PARENT_PROXY (IP address of the ISA server)  
PARENT\_PROXY\_PORT (port on witch the ISA server is listening mostly port 80)  
NT_DOMAIN (fill in the domain)  
USER (your domain user)  
PASSWORD (your domain user password)

Step 5)  
Start NTLMAPS

<pre>./main.py</pre>

Step 6)  
Setup your Ubuntu to use your local proxy. You can set the proxy setting for Ubuntu:

[<img class="alignnone size-medium wp-image-38" src="http://coralic.files.wordpress.com/2008/10/1.png?w=300" alt="" width="300" height="225" />][1]

[<img class="alignnone size-medium wp-image-39" src="http://coralic.files.wordpress.com/2008/10/2.png?w=300" alt="" width="300" height="225" />][2]

Now you are done, start using your Ubuntu behind the ISA server.

 [1]: http://coralic.files.wordpress.com/2008/10/1.png
 [2]: http://coralic.files.wordpress.com/2008/10/2.png