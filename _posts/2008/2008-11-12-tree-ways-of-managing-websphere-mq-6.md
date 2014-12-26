---
title: Three ways of managing WebSphere MQ 6
layout: post
permalink: /2008/11/12/tree-ways-of-managing-websphere-mq-6/
categories:
  - other
tags:
  - commandline
  - eclipse
  - ies30
  - mq
  - mqjexplorer
  - runmqsc
  - websphere
description: I am using three ways or maybe I should say three tools in Linux to manage, monitor and configure MQ on the fly. I thought why not share my way of doing those tree things. So here they are, lets start with the most basic and standard one.
---
I am using three ways or maybe I should say three tools in Linux to manage, monitor and configure MQ on the fly. I thought why not share my way of doing those tree things. So here they are, lets start with the most basic and standard one.

**Commandline**  
The "runmqsc QMNAME"; command is the most basic command for monitoring and configuring MQ. It can also show you real time data about what is happening in MQ.

**Eclipse with plugin**  
These days IBM is shipping there MQ with eclipse who has an plugin for controlling MQ "ies30". I am not an big fan of this approach. Eclipse is just to big for this kind of things, and another bummer is they only have this for 32 bit platform and not for 64 bit.  
Never the less the tool performs oke and does everything you need to control MQ.

**MQJExplorer**  
This is my favorite tool and I use it a lot. It is not being developed anymore and it is quite old but I like it very much. The reason I like it very much is because it's small and it works in windows, linux and in 32 bit, 64 bit because it's java.

You can do almost anything you need as in "ies30" and it works fine and it's lightweight. Although not developed anymore you can still download it <a title="MQJExplorer" href="http://www.capitalware.biz/mq_tools.html" target="_blank">here</a>.

Maybe you where expecting more info about the tools than I wrote on this blog, but I think it's not necessary to do so. The reason why so is because you should just try them all and make your own opinion about what is best for you. I have days that I am using commandline and days I use one of the other two. It also depends where and how you are working. When I am doing some things remote I like to do it commandline and with MQJExplorer, but when I am working local I use "ies30" when I am on an 32 bit machine.