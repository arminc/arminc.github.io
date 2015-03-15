---
title: How to use embedded glassfish maven plugin?
layout: post
permalink: /2010/03/09/how-to-use-embedded-glassfish-maven-plugin/
categories:
  - java
tags:
  - embedded glassfish maven plugin
  - glassfish
  - maven
description: You already know how to use embedded glassfish from junit now it's time to show you how to use the maven plugin to achieve the same.
---
You already know how to use embedded glassfish from junit now it's time to show you how to use the maven plugin to achieve the same.

You can download the full package [here][1].

As always we start off with pom.xml

{% highlight xml %}<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>coralic</groupId>
	<artifactId>ejbembeddedtest</artifactId>
	<packaging>war</packaging>
	<version>0.0.1-SNAPSHOT</version>
	<name>embeddedtest</name>
	<url>http://maven.apache.org</url>
	<dependencies>
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.7</version>
			<scope>test</scope>
		</dependency>
		<dependency>
			<groupId>org.glassfish.extras</groupId>
			<artifactId>glassfish-embedded-all</artifactId>
			<version>3.0</version>
			<scope>provided</scope>
		</dependency>
	</dependencies>
	<build>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>2.0.2</version>
				<configuration>
					<source>1.6</source>
					<target>1.6</target>
				</configuration>
			</plugin>
			<plugin>
				<groupId>org.glassfish</groupId>
				<artifactId>maven-embedded-glassfish-plugin</artifactId>
				<version>3.0</version>
				<configuration>
					<serverID>server</serverID>
					<name>server</name>
					<app>${project.build.directory}/${build.finalName}.war</app>
					<port>8888</port>
					<instanceRoot>${project.build.directory}/gfe-${maven.build.timestamp}
			</instanceRoot>
					<autoDelete>true</autoDelete>
					<configFile>${basedir}/domain.xml</configFile>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>
{% endhighlight %}

Then we place an web.xml in src/main/webapp/WEB-INF

{% highlight xml %}<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:web="http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" id="WebApp_ID" version="2.5">
  <display-name>EmbeddedGlassfishMavenPlugin</display-name>
  <welcome-file-list>
    <welcome-file>hello.html</welcome-file>
  </welcome-file-list>
</web-app>
{% endhighlight %}

Infortenatyl for this type of server we again need an domain.xml (use the one [here][2]) and copy next to pom.xml file.

Only thing left to do is create an hello.html file in src/main/webapp

{% highlight xml %}<html>
  <head>
    <title>Tutorial: HelloWorld</title>
  </head>
  <body>
    <h1>HelloWorld Tutorial</h1>
  </body>
</html>
{% endhighlight %}

To start the embedded glassfish server do

{% highlight bash %}mvn package embedded-glassfish:run
{% endhighlight %}

If you change something to hello.html while the embedded server is running you need to package and redeploy the application. How to do so, leave the embedded server running. Change something to hello.html. Open another commandline and fire up the following maven comamnd

{% highlight bash %}mvn package
{% endhighlight %}

Now go back to your commandline where the embedded server is running and press enter. Your application will be re-deployed.

To test your hello.html brows to <http://localhost:8888/server>

 [1]: {{ site.baseurl }}/assets/files/embeddedglassfishmavenplugin.zip
 [2]: {{ site.baseurl }}/2010/03/08/how-to-test-ejb3-1-with-embedded-container/