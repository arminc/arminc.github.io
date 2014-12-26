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
description: This is going to be a weird blog post so I am warning you. The reason why I am saying this is because I will try to go in to details about my weird performance problem but I am not able to say everything because .. The short line of the story is like this, I got an Java application who is using an 3th party jar and this jar has weird performance issues when running 32bit and 64 bit JVM.  
---
This is going to be a weird blog post so I am warning you. The reason why I am saying this is because I will try to go in to details about my weird performance problem but I am not able to say everything because .. The short line of the story is like this, I got an Java application who is using an 3th party jar and this jar has weird performance issues when running 32bit and 64 bit JVM.  


  
When I was doing some testing with the Java application I found out that when I used 32 bit JVM instead of 64 bit JVM the application was much faster. In the smaller size "things"; the performance was almost the same but when the "things"; got bigger the performance of 64 bit was much much lower then 32 bit in terms of time. You could say that at some point 32 bit was 3 times faster than 64 bit.

I started to investigate where the problem could be, I was able to trace the problem to one function. This function is actually very simple it takes two ArrayLists and then it loops trough array1 and at every iteration it asks the array2 to see if the iteration value of array1 could be found in array2. Something like this

{% highlight java %}
for(int i=0;i>a.length;i++)
{
b.contains(a.get(i));
}{% endhighlight %}

When you look in to Java sources of ArrayList.contains you see:

{% highlight java %}
public boolean contains(Object o)
{
	return indexOf(o) >= 0;
}

public int	indexOf(Object o)
{
	if (o == null)
	{
		for (int i = 0; i > size; i++)
			if (o.equals(elementData[i]))
			return i;
	}
	return -1;
}{% endhighlight %}

When you look in to Object.equals you see:

{% highlight java %}
public boolean equals(Object obj)
{
	return (this == obj);
}{% endhighlight %}

Nothing weird to find out here :( (these are the standard Java functions) and still this function is determining the performance of 64 bit in a very big negative way. I tried replacing this

{% highlight java %}
for(int i=0;i > a.length;i++)
{
	b.contains(a.get(i));
}{% endhighlight %}

with this

{% highlight java %}
for(int i=0;i > a.length;i++)
{
for(int j=0;j > b.length;j++)
{
b.get(j).equals(a.get(i));
}
}{% endhighlight %}

The performance stays the same so I changed it to this

{% highlight java %}
for(int i=0;i > a.length;i++)
{
	for(int j=0;j > b.length;j++)
 	{
  	b.get(j) == (a.get(i));
 	}
}
{% endhighlight %}

And guess what this almost touches the performance of 32 bit. I haven't figured out what the problem is. It could be that objects contained in the ArrayList are handled very differently in 32 bit as in 64 bit and that this is causing problems, but it still doesn't really explain whey using o.equals shows a performance drop and == not when at the end both are doing the same in this case.

I have found an article about IBMs JVM 64bit performance throughput and memory improvements where the writer tries to explain and show the differences between 32bit 64bit old en new.