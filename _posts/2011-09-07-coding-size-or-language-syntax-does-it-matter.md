---
title: Coding size or language syntax, does it matter?
author: admin
layout: post
permalink: /2011/09/07/coding-size-or-language-syntax-does-it-matter/
aktt_notify_twitter:
  - yes
aktt_tweeted:
  - 1
categories:
  - Other
tags:
  - code
  - code size
  - syntax
---
Original post can be found at [It-Eye][1]

There are lot of programming languages in the world, there is one for everybody. All those languages have something in common and that is that they are trying to help you solve a problem. But they all try to do it there own way.  
Every company has struggled one way or another to chose what programming language to use for a project. If they haven&#8217;t then they probably chose what they already have been using. For those that have been choosing most of the time they were looking at things like, can we find experts, is the language fast, secure, does it help us solve our problems faster and tools for the language. But have we ever looked at code size or language syntax and decided on that as well? Probably not, but should we? <!--more-->

Let&#8217;s look at some “&#8217;Hello World” coding examples. [Source][2]

Java

<pre class="brush: java; title: ; notranslate" title="">class HelloWorld {
  static public void main( String args[] ) {
    System.out.println( "Hello World!" );
  }
}
</pre>

C#

<pre class="brush: csharp; title: ; notranslate" title="">class HelloWorld
{
    static void Main()
    {
        System.Console.WriteLine("Hello, World!");
    }
}
</pre>

C++

<pre class="brush: cpp; title: ; notranslate" title="">#include &lt;iostream.h&gt;

main()
{
    cout &lt;&lt; "Hello World!" &lt;&lt; endl;
    return 0;
}
</pre>

Scala

<pre class="brush: scala; title: ; notranslate" title="">object HelloWorld with Application {
     Console.println("Hello world!");
}
</pre>

Python

<pre class="brush: python; title: ; notranslate" title="">print "Hello World"
</pre>

We can see that Java, C# and C++ pretty much look the same, Scala is a little bit smaller and python the smallest. Warning: This is not a scientific comparison but one to help understand the point.

So would it matter that a software engineer only needs to write one line instead of 3 or 4? Is he going to be more productive, more creative? How about code maintainability, readability? 

Does the code size and syntax really matter? 

I would say, in most cases it does not. The reason why I think that is because for most languages we have great tools that do a lot for the software engineer so you don&#8217;t need to write all those lines, most of them get generated or added on the fly anyway. Regarding code maintainability and readability, no programming language has yet been discovers that makes a bad software engineer do those things good.  
What matters is that the programming language should allow the software engineer to focus on his problem instead of breaking his mind about programming details. This is also the reason why languages like Scala, Groovy, Ruby are getting popular. Looking at these languages you could conclude that it seems that syntax definitely can matter sometimes.

 [1]: http://www.it-eye.nl/2011/09/07/coding-size-or-language-syntax-does-it-matter/
 [2]: http://www.roesler-ac.de/wolfram/hello.htm