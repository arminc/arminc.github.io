---
title: How to use embedded glassfish from junit?
layout: post
permalink: /2010/03/09/how-to-use-embedded-glassfish-from-junit/
categories:
  - java
tags:
  - ejb
  - ejb3.1
  - embedded
  - embedded glassfish
  - glassfish
description: In my previous post I explaind that with the new EJB you can use an embedded EJB container to test your EJB. But there is also another way and that is to use embedded glassfish that is started from inside an junit. The nice thing here is that it you can start an embedded glassfish with the container you need, with EJB or with WEB or both if you need.
---
In my previous [post][1] I explaind that with the new EJB you can use an embedded EJB container to test your EJB. But there is also another way and that is to use embedded glassfish that is started from inside an junit. The nice thing here is that it you can start an embedded glassfish with the container you need, with EJB or with WEB or both if you need.

You can get the whole package to get you started from [here][2].

Again we start of with an pom.xml for maven

{% highlight xml %}<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>coralic</groupId>
	<artifactId>ejbembeddedtest</artifactId>
	<packaging>jar</packaging>
	<version>0.0.1-SNAPSHOT</version>
	<name>ejbembeddedtest</name>
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
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-surefire-plugin</artifactId>
				<configuration>
					<includes>
						<include>**/*TestItemSuite.java</include>
					</includes>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>
{% endhighlight %}

Now we take the sources from [here][3] and copy them to src/main/java/nl/coralic/blog/ejb31/

The presistance.xml from that sample goes here src/main/resources/META-INF

If you have read my other post [“How to test EJB3.1 with embedded container?”][1]  you have seen that for an embedded container we needed an domain.xml and ds_jdbc_ra. Luckily using embedded glassfish this way we don't need that anymore. Two reasons for that:  
1)when you do your test glassfish does complain about that it can not find ds_jdbc_ra and then goes off and creates it for it self, so no problem here  
2)we don't need the domain.xml to tell glassfish how to configure it self because we can do that in our junit test

We need some junit to test our EJB, first we create an junit test.

{% highlight java %}package test;

import javax.naming.InitialContext;
import javax.naming.NamingException;

import nl.coralic.blog.ejb31.Item;
import nl.coralic.blog.ejb31.ItemService;

import org.glassfish.api.embedded.LifecycleException;
import org.junit.Test;

public class ItemTest {
	@Test
	public void addItem() throws NamingException, LifecycleException
	{
		InitialContext ic = new InitialContext();
		ItemService itemService = (ItemService)ic.lookup("java:global/ejbembeddedtest-0.0.1-SNAPSHOT/ItemService");
		Item item = new Item();
		item.setItemName("testname");
		itemService.save(item);

		System.out.println("Get all items from DB and show itemname for the first one: " + itemService.getItems().get(0).getItemName());

	}
}
{% endhighlight %}

And as last we create an junit suite that starts and stops our server and invokes our test.

{% highlight java %}package test;

import java.io.File;

import junit.framework.Test;
import junit.framework.TestSuite;

import org.glassfish.api.ActionReport;
import org.glassfish.api.admin.CommandRunner;
import org.glassfish.api.admin.ParameterMap;
import org.glassfish.api.deployment.DeployCommandParameters;
import org.glassfish.api.embedded.ContainerBuilder;
import org.glassfish.api.embedded.EmbeddedDeployer;
import org.glassfish.api.embedded.EmbeddedFileSystem;
import org.glassfish.api.embedded.LifecycleException;
import org.glassfish.api.embedded.Server;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses( { ItemTest.class })
public class TestItemSuite
{
	public static Server server;
	private static EmbeddedDeployer embdeployer;

	@SuppressWarnings("unchecked")
	@BeforeClass
	public static void setUp() throws LifecycleException
	{

		Server.Builder builder = new Server.Builder("coralicglassfish");
		EmbeddedFileSystem.Builder efsb = new EmbeddedFileSystem.Builder();
		efsb.installRoot(new File("target/glassfish/installroot"));
		efsb.instanceRoot(new File("target/glassfish/instanceroot"));
		efsb.autoDelete(true);
		EmbeddedFileSystem efs = efsb.build();
		builder.embeddedFileSystem(efs);

		Server server = builder.build();

		ContainerBuilder ejbContainer = server.createConfig(ContainerBuilder.Type.ejb);
		server.addContainer(ejbContainer);

		server.start();

		String com = "create-jdbc-connection-pool";
		ParameterMap props = new ParameterMap();
		props.add("datasourceclassname", "org.apache.derby.jdbc.EmbeddedDataSource");
		props.add("restype", "javax.sql.DataSource");
		props.add("ping", "true");
		props.add("property", "ConnectionAttributes=create\\=true:DatabaseName=target/itemDataBase");
		props.add("DEFAULT", "itemDataBase");
		CommandRunner run = server.getHabitat().getComponent(CommandRunner.class);
		ActionReport rep = server.getHabitat().getComponent(ActionReport.class);
		run.getCommandInvocation(com, rep).parameters(props).execute();

		String command = "create-jdbc-resource";
		ParameterMap par = new ParameterMap();
		par.add("connectionpoolid", "itemDataBase");
		par.add("jndi_name", "jdbc/itemDataBase");
		CommandRunner runner = server.getHabitat().getComponent(CommandRunner.class);
		ActionReport report = server.getHabitat().getComponent(ActionReport.class);
		runner.getCommandInvocation(command, report).parameters(par).execute();

		File fileToDeploye = new File("target/ejbembeddedtest-0.0.1-SNAPSHOT.jar");
		EmbeddedDeployer deployer = server.getDeployer();
		DeployCommandParameters params = new DeployCommandParameters();
		deployer.deploy(fileToDeploye, params);

	}

	public static Test suite()
	{
		TestSuite suite = new TestSuite("Test");
		// $JUnit-BEGIN$
		// $JUnit-END$
		return suite;
	}

	@AfterClass
	public static void tearDown() throws LifecycleException
	{
		if (embdeployer != null)
		{
			embdeployer.undeployAll();
		}
		if (server != null)
		{
			server.stop();
		}
	}
}
{% endhighlight %}

Everything need for this test is setup all you have to do is fire up the test with maven

{% highlight bash %}mvn clean compile jar:jar test
{% endhighlight %}

 [1]: {{ site.baseurl }}/2010/03/08/how-to-test-ejb3-1-with-embedded-container/
 [2]: http://files.coralic.nl/ejbe31mbeddedglassfish.zip
 [3]: {{ site.baseurl }}/2010/03/07/how-to-create-ejb-3-1/