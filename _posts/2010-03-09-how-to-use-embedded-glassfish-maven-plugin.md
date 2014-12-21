---
title: How to use embedded glassfish maven plugin?
layout: post
permalink: /2010/03/09/how-to-use-embedded-glassfish-maven-plugin/
categories:
  - Java
tags:
  - embedded glassfish maven plugin
  - glassfish
  - maven
---
You already know how to use embedded glassfish from junit now it&#8217;s time to show you how to use the maven plugin to achieve the same.<!--more-->

You can download the full package [here][1].

As always we start off with pom.xml

<pre class="brush: xml; title: ; notranslate" title="">&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"&gt;
	&lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
	&lt;groupId&gt;coralic&lt;/groupId&gt;
	&lt;artifactId&gt;ejbembeddedtest&lt;/artifactId&gt;
	&lt;packaging&gt;war&lt;/packaging&gt;
	&lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;
	&lt;name&gt;embeddedtest&lt;/name&gt;
	&lt;url&gt;http://maven.apache.org&lt;/url&gt;
	&lt;dependencies&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;junit&lt;/groupId&gt;
			&lt;artifactId&gt;junit&lt;/artifactId&gt;
			&lt;version&gt;4.7&lt;/version&gt;
			&lt;scope&gt;test&lt;/scope&gt;
		&lt;/dependency&gt;
		&lt;dependency&gt;
			&lt;groupId&gt;org.glassfish.extras&lt;/groupId&gt;
			&lt;artifactId&gt;glassfish-embedded-all&lt;/artifactId&gt;
			&lt;version&gt;3.0&lt;/version&gt;
			&lt;scope&gt;provided&lt;/scope&gt;
		&lt;/dependency&gt;
	&lt;/dependencies&gt;
	&lt;build&gt;
		&lt;plugins&gt;
			&lt;plugin&gt;
				&lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
				&lt;artifactId&gt;maven-compiler-plugin&lt;/artifactId&gt;
				&lt;version&gt;2.0.2&lt;/version&gt;
				&lt;configuration&gt;
					&lt;source&gt;1.6&lt;/source&gt;
					&lt;target&gt;1.6&lt;/target&gt;
				&lt;/configuration&gt;
			&lt;/plugin&gt;
			&lt;plugin&gt;
				&lt;groupId&gt;org.glassfish&lt;/groupId&gt;
				&lt;artifactId&gt;maven-embedded-glassfish-plugin&lt;/artifactId&gt;
				&lt;version&gt;3.0&lt;/version&gt;
				&lt;configuration&gt;
					&lt;serverID&gt;server&lt;/serverID&gt;
					&lt;name&gt;server&lt;/name&gt;
					&lt;app&gt;${project.build.directory}/${build.finalName}.war&lt;/app&gt;
					&lt;port&gt;8888&lt;/port&gt;
					&lt;instanceRoot&gt;${project.build.directory}/gfe-${maven.build.timestamp}
			&lt;/instanceRoot&gt;
					&lt;autoDelete&gt;true&lt;/autoDelete&gt;
					&lt;configFile&gt;${basedir}/domain.xml&lt;/configFile&gt;
				&lt;/configuration&gt;
			&lt;/plugin&gt;
		&lt;/plugins&gt;
	&lt;/build&gt;
&lt;/project&gt;
</pre>

Then we place an web.xml in src/main/webapp/WEB-INF

<pre class="brush: xml; title: ; notranslate" title="">&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/javaee" xmlns:web="http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" id="WebApp_ID" version="2.5"&gt;
  &lt;display-name&gt;EmbeddedGlassfishMavenPlugin&lt;/display-name&gt;
  &lt;welcome-file-list&gt;
    &lt;welcome-file&gt;hello.html&lt;/welcome-file&gt;
  &lt;/welcome-file-list&gt;
&lt;/web-app&gt;
</pre>

Infortenatyl for this type of server we again need an domain.xml (use the one [here][2]) and copy next to pom.xml file.

Only thing left to do is create an hello.html file in src/main/webapp

<pre class="brush: xml; title: ; notranslate" title="">&lt;html&gt;
  &lt;head&gt;
    &lt;title&gt;Tutorial: HelloWorld&lt;/title&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;h1&gt;HelloWorld Tutorial&lt;/h1&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

To start the embedded glassfish server do

<pre class="brush: bash; title: ; notranslate" title="">mvn package embedded-glassfish:run
</pre>

If you change something to hello.html while the embedded server is running you need to package and redeploy the application. How to do so, leave the embedded server running. Change something to hello.html. Open another commandline and fire up the following maven comamnd

<pre class="brush: bash; title: ; notranslate" title="">mvn package
</pre>

Now go back to your commandline where the embedded server is running and press enter. Your application will be re-deployed.

To test your hello.html brows to <http://localhost:8888/server>{.broken_link}

 [1]: http://files.coralic.nl/embeddedglassfishmavenplugin.zip
 [2]: http://blog.coralic.nl/2010/03/08/how-to-test-ejb3-1-with-embedded-container/