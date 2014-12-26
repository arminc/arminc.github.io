---
title: WAS and JACL scripting
layout: post
permalink: /2008/10/31/was-and-jacl-scripting/
categories:
  - other
tags:
  - AdminConfig
  - application server
  - IBM
  - jacl
  - scripting
  - WAS
description: Ever wondered how you could automate the processes of configuring WebSphere application server? If so I am going to give you two simple examples.
---
Ever wondered how you could automate the processes of configuring WebSphere application server? If so I am going to give you two simple examples.

**How to change some variables in WAS?**

In this script we are going to change the initialHeapSize and maximumHeapSize of the JVM. Look at the script belove:

{% highlight bash %}
set serverName "server1"
set nodeName "testwas"
set initialHeapSize [list initialHeapSize 256]
set maximumHeapSize [list maximumHeapSize 1024]
set server [$AdminConfig getid /Node:$nodeName/Server:$serverName/]
set jvm [$AdminConfig list JavaVirtualMachine $server]
set jvmAttrs [list $initialHeapSize $maximumHeapSize]
$AdminConfig modify $jvm $jvmAttrs
$AdminConfig save
{% endhighlight %}

What are we doing actually, lets break down the script. Here we are just initializing some variables just like other languages.

{% highlight bash %}
set serverName "server1"
set nodeName "testwas"
set initialHeapSize [list initialHeapSize 256]
set maximumHeapSize [list maximumHeapSize 1024
{% endhighlight %}

With the AdminConfig object in WAS we are getting the configuration ID of the server.

{% highlight bash %}set server [$AdminConfig getid /Node:$nodeName/Server:$serverName/{% endhighlight %}

Here we are looking up the JVM belonging to the server and storing the configuration ID.

{% highlight bash %}set jvm [$AdminConfig list JavaVirtualMachine $server{% endhighlight %}

Creating a new array with our variables we had.

{% highlight bash %}set jvmAttrs [list $initialHeapSize $maximumHeapSize{% endhighlight %}

With the help of AdminConfig object we are editing our found JVM with the options we have stored in our variables.

{% highlight bash %}$AdminConfig modify $jvm $jvmAttrs{% endhighlight %}

At the end we save the modified settings.

{% highlight bash %}$AdminConfig save{% endhighlight %}

**How to stop an Enterprise Application in WAS using a JACL script?**

With this script we are going to stop an running application in WAS.

{% highlight bash %}
set appName "someApp"
set node "tmp_node"
set server "server1"
set cell "tmp_cell";
set appManager [$AdminControl queryNames cell=$cell,node=$node,type=ApplicationManager,process=$server,*]
$AdminControl invoke $appManager stopApplication $appName
{% endhighlight %}

The first four lines initialize variables, the second line queries configuration ID of the ApplicationManager object.

{% highlight bash %}set appManager [$AdminControl queryNames cell=$cell,node=$node,type=ApplicationManager,process=$server,*{% endhighlight %}

The last line is actually executing the command to stop the application.

{% highlight bash %}$AdminControl invoke $appManager stopApplication $appName{% endhighlight %}

**Now that we have two scripts what do we do with them?**

Save the two scripts for example like, SetVars.jacl and StopApp.jacl. To use the scripts we need to make use of the /WAS_INSTALL_MAP/bin/wsadmin.sh. It is importen to keep in mind that the WAS server has to be **running** to be able to do this.

Execute one of the scripts:

{% highlight bash %}/opt/WAS/bin/wsadmin.sh -f /home/tmp/tmpscripts/SetVars.jacl -profileName TmpProfile{% endhighlight %}

If you want to learn more about JACL scripts and wsadmin look [here][1].

 [1]: http://publib.boulder.ibm.com/infocenter/wasinfo/v6r0/index.jsp?topic=/com.ibm.websphere.express.doc/info/exp/ae/welc_ref_adm_script.html