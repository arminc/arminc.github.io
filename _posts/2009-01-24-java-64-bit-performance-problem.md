---
title: Java 64 bit performance problem
layout: post
permalink: /2009/01/24/java-64-bit-performance-problem/
categories:
  - java
tags:
  - 64 bit
  - contains
  - equals
  - java
  - java 64 bit
  - performance problem
---
This is going to be a weird blog post so I am warning you. The reason why I am saying this is because I will try to go in to details about my weird performance problem but I am not able to say everything because &#8230;.. The short line of the story is like this, I got an Java application who is using an 3th party jar and this jar has weird performance issues when running 32bit and 64 bit JVM.  
<!--more-->

  
When I was doing some testing with the Java application I found out that when I used 32 bit JVM instead of 64 bit JVM the application was much faster. In the smaller size &#8220;things&#8221; the performance was almost the same but when the &#8220;things&#8221; got bigger the performance of 64 bit was much much lower then 32 bit in terms of time. You could say that at some point 32 bit was 3 times faster than 64 bit.

I started to investigate where the problem could be, I was able to trace the problem to one function. This function is actually very simple it takes two ArrayLists and then it loops trough array1 and at every iteration it asks the array2 to see if the iteration value of array1 could be found in array2. Something like this

<pre class="prettyprint">for(int i=0;i&gt;a.length;i++)
{
 b.contains(a.get(i));
}</pre>

When you look in to Java sources of ArrayList.contains you see:

<pre class="prettyprint">public boolean contains(Object o)
{
return indexOf(o) &gt;= 0;
}

public int	indexOf(Object o)
{
if (o == null)
{
for (int i = 0; i  &gt;  size; i++)
if (o.equals(elementData[i]))
return i;
}
return -1;
}</pre>

When you look in to Object.equals you see:

<pre class="prettyprint">public boolean equals(Object obj)
{
return (this == obj);
}</pre>

Nothing weird to find out here <img src='http://blog.coralic.nl/wp-includes/images/smilies/icon_sad.gif' alt=':(' class='wp-smiley' /> (these are the standard Java functions) and still this function is determining the performance of 64 bit in a very big negative way. I tried replacing this

<pre class="prettyprint">for(int i=0;i &lt; a.length;i++)
{
b.contains(a.get(i));
}</pre>

with this

<pre class="prettyprint">for(int i=0;i &lt; a.length;i++)
{
for(int j=0;j &lt; b.length;j++)
{
b.get(j).equals(a.get(i));
}
}</pre>

The performance stays the same so I changed it to this

<pre class="prettyprint">for(int i=0;i &lt; a.length;i++)
{
 for(int j=0;j &lt; b.length;j++)
 {
  b.get(j) == (a.get(i));
 }
}
</pre>

And guess what this almost touches the performance of 32 bit. I haven&#8217;t figured out what the problem is. It could be that objects contained in the ArrayList are handled very differently in 32 bit as in 64 bit and that this is causing problems, but it still doesn&#8217;t really explain whey using o.equals shows a performance drop and == not when at the end both are doing the same in this case.

I have found an article about IBMs JVM 64bit performance throughput and memory improvements where the writer tries to explain and show the differences between 32bit 64bit old en new.