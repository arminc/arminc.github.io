---
title: '10 Minutes Hands-On: Apache Camel'
layout: post
permalink: /2011/03/18/10-minutes-hands-on-apache-camel/
categories:
  - java
tags:
  - apache camel
  - camel
  - integration
description: Integration frameworks are getting more popular because you can easily integrate services or you can use them to integrate partial application parts to one application. To show you how easy it has become to integrate we did a 10 Minutes Hands-On at the It-Eye open space and this was the working result of that.
---
Original post can be found at [It-Eye][1]

Integration frameworks are getting more popular because you can easily integrate services or you can use them to integrate partial application parts to one application. To show you how easy it has become to integrate we did a 10 Minutes Hands-On at the It-Eye open space and this was the working result of that.



  
**What is Apache Camel?**  
Apache Camel is a powerful open source integration framework based on known Enterprise Integration Patterns with powerful Bean Integration.

Camel lets you create the Enterprise Integration Patterns to implement routing and mediation rules in either a Java based Domain Specific Language (or Fluent API), via Spring based Xml Configuration files or via the Scala DSL. This means you get smart completion of routing rules in your IDE whether in your Java, Scala or XML editor. [source][2]

[<img src="{{ site.baseurl }}/assets/files/jpg/camel-components.png" alt="" title="Business_Model_Canvas_1024" width="1024" height="683" class="aligncenter size-full wp-image-1061" />][3]

**What did we produce?**

As always a POM file:

{% highlight xml %}<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>nl.iteye</groupId>
    <artifactId>camel-example</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>jar</packaging>

    <name>camel-example</name>
    <url>http://maven.apache.org</url>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies> 
        <dependency> 
            <groupId>junit</groupId> 
            <artifactId>junit</artifactId> 
            <version>4.8.1</version> 
            <scope>test</scope> 
        </dependency> 
        <dependency> 
            <groupId>org.apache.camel</groupId> 
            <artifactId>camel-core</artifactId> 
            <version>2.6.0</version> 
        </dependency> 
        <dependency> 
            <groupId>org.apache.camel</groupId> 
            <artifactId>camel-test</artifactId> 
            <version>2.6.0</version> 
            <scope>test</scope> 
        </dependency> 
    </dependencies> 
</project>
{% endhighlight %}

And of course we created some code:

{% highlight java %}package nl.iteye.camelexample;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.component.mock.MockEndpoint;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.junit.Test;

public class CamelExampleTest extends CamelTestSupport {

    @Override
    protected RouteBuilder createRouteBuilder() throws Exception {
        return new RouteBuilder() {

            @Override
            public void configure() throws Exception {
                from("direct:startpoint").id("route1") //
                        .to("log:ex1.1?showAll=true") //
                        .convertBodyTo(String.class) //
                        .process(new Processor() {

                    @Override
                    public void process(Exchange exchng) throws Exception {
                        String body = exchng.getIn().getBody(String.class);
                        exchng.getOut().setBody(body.replaceAll("root", "testroot"));
                        exchng.getOut().setHeader("IS_PAYMENT", 1);

                    }
                }).to("log:ex1.2?showAll=true") //
                        .choice().when(header("IS_PAYMENT")//
                        .isEqualTo(1)).to("mock:endpoint2") //
                        .otherwise().to("mock:endpoint");
            }
        };
    }

    @Test
    public void test() throws InterruptedException {
        log.info("running test");
        MockEndpoint resultEndpoint = context.getEndpoint("mock:endpoint", MockEndpoint.class);
        MockEndpoint resultEndpoint2 = context.getEndpoint("mock:endpoint2", MockEndpoint.class);
        resultEndpoint2.expectedMessageCount(0);
        resultEndpoint2.expectedMessageCount(1);
        template.requestBody("direct:startpoint", "<root><name>abc</name></root>");
        resultEndpoint.assertIsSatisfied();
        resultEndpoint2.assertIsSatisfied();
    }
}
{% endhighlight %}

And that's it, but what does this example do.

  1. It Starts with a direct endpoint that receives a message
  2. t ads an id to the route, this can be used to manipulate the route with JMX
  3. Logs the message
  4. Converts the incoming message body to string
  5. It creates a custom processor
  1. Replaces the root element name
  2. Sets a header

  6. Logs the message
  7. Dispatches the messages to a endpoint based on the header

As you can see it is very simple to create routes, you can use a lot of pre build components and if those are not sufficient enough you can create your own. And for those that don't like to do this in java you can do the same in xml.

For more information look at:

[Apache Camel][2]  
[Maven][4]  
[Netbeans 7][5]  
[Junit][6]

 [1]: http://www.it-eye.nl/2011/03/18/10-minutes-hands-on-apache-camel/
 [2]: http://camel.apache.org/
 [3]: {{ site.baseurl }}/assets/files/jpg/camel-components.png
 [4]: http://maven.apache.org/
 [5]: http://netbeans.org/community/releases/70/
 [6]: http://www.junit.org/