---
title: Smarter backdoors
author: admin
layout: post
permalink: /2010/01/19/smarter-backdoors/
categories:
  - Other
tags:
  - backdoor
  - smarter backdoor
---
In this post you can find my thoughts about today&#8217;s backdoors and the way I think backdoors could be made. To many backdoors these days work fast and effective but are most of the time dumb and get detected easily. I am going to try to tell you my vision on how to make the backdoors smart.<!--more-->

**What is an backdoor?**  
A backdoor is a peace of software that gets installed on a victims PC. The goal of this peace of software is to retrieve valuable information and get it to the backdoor owner. Sometimes these backdoors also sit there and wait for backdoor owners command&#8217;s.  
There are many many reasons backdoors are used, the one I just described is one that I think needs improvments. If you want to know about different types of backdoors or there goals just google on backdoor types/trojan types.

**How do now day&#8217;s backdoors work?**  
There are endless ways of how backdoors work on the victims PC&#8217;s and because I am not writing an hacking tutorial here I will spare you the details. But its worth to mention some of the methods used:  
- Hidden services  
- Injected code in existing services/applications

**How do now day&#8217;s backdoors communicate with the backdoor owner?**  
Most of the backdoors you here about use IRC for communicating between the backdoor owner and the backdoor. Others use ftp, mail or some other protocol.

**So how can we make the backdoors smarter?**  
You might think what&#8217;s wrong with the way backdoors work right now? The problem is that they can be detected easily by firewalls or by IDS (intrusion detection systems) and if you have a better backdoor you need an human to spot it. But at the end they all do something that is to suspicions and that&#8217;s how they get caught.  
To get an backdoor smart you need to solve these issues:  
- Retrieve wanted information without being caught  
- Stay unseen on the PC  
- Don&#8217;t get caught when communicating

As I said I am not writing an hacking tutorial so I will skip the “Retrieve wanted information without being caught” and the “Stay unseen on the PC” part and concentrate on the “Don&#8217;t get caught when communicating”.

The communication can be broken down in to two:  
- Backdoor owner wants to give an command to the backdoor  
- Backdoor has some information it wants to give to the backdoor owner

**How to send/retrieve commands without being detected?**  
You want to send or have the backdoor retrieve the command but you don&#8217;t want to be suspicious on the network. What you need is “[steganography][1]”, this means hide your text(command) in something else. This can be a website, photo, mp3 or anything else.  
Most backdoors also make an mistake of generating traffic on the network on the suspicious times. Don&#8217;t visit pages at 22:00 when everyone is out of office. Don&#8217;t hide your messages or commands on obvious mostly forbidden pages (facebook, myspace), don&#8217;t send email&#8217;s trough or to mostly forbiden mail servers (hotmail).  
What I am trying to say is, hide your messages and let your backdoor adapt it self to the environment. Don&#8217;t do anything that an real person would not do.

**How to send the information unseen to the backdoor owner?**  
Now this is a tricky part, it&#8217;s much easier for the backdoor to get command&#8217;s but it&#8217;s much harder to send the information back. There are two things here that play a crucial role. One is how do I get my message out and the second one that is very very import is volume of the message. Let&#8217;s face it it&#8217;s much easier to hide 2 words than it&#8217;s to hide this whole blog post.  
So to be unseen we need to find a way to make the backdoor loose all the irrelevant information and just bring us the most necessary information. But on the other hand we also need to find ways of getting the message out. One of the orthodox way&#8217;s could be by using [DNS][2]. Others could be by creating algoritam&#8217;s that can create normal text with hidden message in it and post these messages to blog&#8217;s or binpaste.

This post is just an representation of my thoughts, I have put some of them on paper and submitted it here on my blog. I could go on for a long time about this but I spared you of that. This is not an how to hack or this is how you need to, this is just thinking what is possible NOW. Let&#8217;s call it outside the box thinking.

 [1]: http://en.wikipedia.org/wiki/Steganography
 [2]: https://dgl.cx/wikipedia-dns