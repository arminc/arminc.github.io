---
title: Coding size or language syntax, does it matter?
layout: post
permalink: /2011/09/07/coding-size-or-language-syntax-does-it-matter/
categories:
  - other
tags:
  - code
  - code size
  - syntax
description: There are lot of programming languages in the world, there is one for everybody. All those languages have something in common and that is that they are trying to help you solve a problem. But they all try to do it there own way.  
---
Original post can be found at [It-Eye][1]

There are lot of programming languages in the world, there is one for everybody. All those languages have something in common and that is that they are trying to help you solve a problem. But they all try to do it there own way.  
Every company has struggled one way or another to chose what programming language to use for a project. If they haven't then they probably chose what they already have been using. For those that have been choosing most of the time they were looking at things like, can we find experts, is the language fast, secure, does it help us solve our problems faster and tools for the language. But have we ever looked at code size or language syntax and decided on that as well? Probably not, but should we? 

Let's look at some “'Hello World” coding examples. [Source][2]

Java

{% highlight java %}class HelloWorld {
  static public void main( String args[] ) {
    System.out.println( "Hello World!" );
  }
}
{% endhighlight %}

C#

{% highlight csharp %}class HelloWorld
{
    static void Main()
    {
        System.Console.WriteLine("Hello, World!");
    }
}
{% endhighlight %}

C++

{% highlight c++ %}#include <iostream.h>

main()
{
    cout << "Hello World!" << endl;
    return 0;
}
{% endhighlight %}

Scala

{% highlight scala %}object HelloWorld with Application {
     Console.println("Hello world!");
}
{% endhighlight %}

Python

{% highlight python %}print "Hello World"
{% endhighlight %}

We can see that Java, C# and C++ pretty much look the same, Scala is a little bit smaller and python the smallest. Warning: This is not a scientific comparison but one to help understand the point.

So would it matter that a software engineer only needs to write one line instead of 3 or 4? Is he going to be more productive, more creative? How about code maintainability, readability? 

Does the code size and syntax really matter? 

I would say, in most cases it does not. The reason why I think that is because for most languages we have great tools that do a lot for the software engineer so you don't need to write all those lines, most of them get generated or added on the fly anyway. Regarding code maintainability and readability, no programming language has yet been discovers that makes a bad software engineer do those things good.  
What matters is that the programming language should allow the software engineer to focus on his problem instead of breaking his mind about programming details. This is also the reason why languages like Scala, Groovy, Ruby are getting popular. Looking at these languages you could conclude that it seems that syntax definitely can matter sometimes.

 [1]: http://www.it-eye.nl/2011/09/07/coding-size-or-language-syntax-does-it-matter/
 [2]: http://www.roesler-ac.de/wolfram/hello.htm