---
title: WAS and JACL scripting
layout: post
permalink: /2008/10/31/was-and-jacl-scripting/
categories:
  - Other
tags:
  - AdminConfig
  - application server
  - IBM
  - jacl
  - scripting
  - WAS
---
Ever wondered how you could automate the processes of configuring WebSphere application server? If so I am going to give you two simple examples.

**How to change some variables in WAS?**<!--more-->

In this script we are going to change the initialHeapSize and maximumHeapSize of the JVM. Look at the script belove:

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      set serverName &#8220;server1&#8243;<br /> set nodeName &#8220;testwas&#8221;<br /> set initialHeapSize [list initialHeapSize 256]<br /> set maximumHeapSize [list maximumHeapSize 1024]<br /> set server [$AdminConfig getid /Node:$nodeName/Server:$serverName/]<br /> set jvm [$AdminConfig list JavaVirtualMachine $server]<br /> set jvmAttrs [list $initialHeapSize $maximumHeapSize]<br /> $AdminConfig modify $jvm $jvmAttrs<br /> $AdminConfig save
    </td>
  </tr>
</table>

What are we doing actually, lets break down the script. Here we are just initializing some variables just like other languages.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      set serverName &#8220;server1&#8243;<br /> set nodeName &#8220;testwas&#8221;<br /> set initialHeapSize [list initialHeapSize 256]<br /> set maximumHeapSize [list maximumHeapSize 1024]
    </td>
  </tr>
</table>

With the AdminConfig object in WAS we are getting the configuration ID of the server.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      set server [$AdminConfig getid /Node:$nodeName/Server:$serverName/]
    </td>
  </tr>
</table>

Here we are looking up the JVM belonging to the server and storing the configuration ID.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      set jvm [$AdminConfig list JavaVirtualMachine $server]
    </td>
  </tr>
</table>

Creating a new array with our variables we had.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      set jvmAttrs [list $initialHeapSize $maximumHeapSize]
    </td>
  </tr>
</table>

With the help of AdminConfig object we are editing our found JVM with the options we have stored in our variables.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      $AdminConfig modify $jvm $jvmAttrs
    </td>
  </tr>
</table>

At the end we save the modified settings.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      $AdminConfig save
    </td>
  </tr>
</table>

**How to stop an Enterprise Application in WAS using a JACL script?**

With this script we are going to stop an running application in WAS.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      set appName &#8220;someApp&#8221;<br /> set node &#8220;tmp_node&#8221;<br /> set server &#8220;server1&#8243;<br /> set cell &#8220;tmp_cell&#8221;<br /> set appManager [$AdminControl queryNames cell=$cell,node=$node,type=ApplicationManager,process=$server,*]<br /> $AdminControl invoke $appManager stopApplication $appName
    </td>
  </tr>
</table>

The first four lines initialize variables, the second line queries configuration ID of the ApplicationManager object.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      set appManager [$AdminControl queryNames cell=$cell,node=$node,type=ApplicationManager,process=$server,*]
    </td>
  </tr>
</table>

The last line is actually executing the command to stop the application.

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      $AdminControl invoke $appManager stopApplication $appName
    </td>
  </tr>
</table>

**Now that we have two scripts what do we do with them?**

Save the two scripts for example like, SetVars.jacl and StopApp.jacl. To use the scripts we need to make use of the /WAS\_INSTALL\_MAP/bin/wsadmin.sh. It is importen to keep in mind that the WAS server has to be **running** to be able to do this.

Execute one of the scripts:

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      /opt/WAS/bin/wsadmin.sh -f /home/tmp/tmpscripts/SetVars.jacl -profileName TmpProfile
    </td>
  </tr>
</table>

If you want to learn more about JACL scripts and wsadmin look [here][1].

 [1]: http://publib.boulder.ibm.com/infocenter/wasinfo/v6r0/index.jsp?topic=/com.ibm.websphere.express.doc/info/exp/ae/welc_ref_adm_script.html