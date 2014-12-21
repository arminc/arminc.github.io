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
---
In my previous [post][1] I explaind that with the new EJB you can use an embedded EJB container to test your EJB. But there is also another way and that is to use embedded glassfish that is started from inside an junit. The nice thing here is that it you can start an embedded glassfish with the container you need, with EJB or with WEB or both if you need.<!--more-->

You can get the whole package to get you started from [here][2].

Again we start of with an pom.xml for maven

<pre class="brush: xml; title: ; notranslate" title="">&lt;project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd"&gt;
	&lt;modelVersion&gt;4.0.0&lt;/modelVersion&gt;
	&lt;groupId&gt;coralic&lt;/groupId&gt;
	&lt;artifactId&gt;ejbembeddedtest&lt;/artifactId&gt;
	&lt;packaging&gt;jar&lt;/packaging&gt;
	&lt;version&gt;0.0.1-SNAPSHOT&lt;/version&gt;
	&lt;name&gt;ejbembeddedtest&lt;/name&gt;
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
				&lt;groupId&gt;org.apache.maven.plugins&lt;/groupId&gt;
				&lt;artifactId&gt;maven-surefire-plugin&lt;/artifactId&gt;
				&lt;configuration&gt;
					&lt;includes&gt;
						&lt;include&gt;**/*TestItemSuite.java&lt;/include&gt;
					&lt;/includes&gt;
				&lt;/configuration&gt;
			&lt;/plugin&gt;
		&lt;/plugins&gt;
	&lt;/build&gt;
&lt;/project&gt;
</pre>

Now we take the sources from [here][3] and copy them to src/main/java/nl/coralic/blog/ejb31/

The presistance.xml from that sample goes here src/main/resources/META-INF

If you have read my other post “How to test EJB3.1 with embedded container?” [http://blog.coralic.nl/2010/03/08/how-to-test-ejb3-1-with-embedded-container/] you have seen that for an embedded container we needed an domain.xml and ds\_jdbc\_ra. Luckily using embedded glassfish this way we don&#8217;t need that anymore. Two reasons for that:  
1)when you do your test glassfish does complain about that it can not find ds\_jdbc\_ra and then goes off and creates it for it self, so no problem here  
2)we don&#8217;t need the domain.xml to tell glassfish how to configure it self because we can do that in our junit test

We need some junit to test our EJB, first we create an junit test.

<pre class="brush: java; title: ; notranslate" title="">package test;

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
</pre>

And as last we create an junit suite that starts and stops our server and invokes our test.

<pre class="brush: java; title: ; notranslate" title="">package test;

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
</pre>

Everything need for this test is setup all you have to do is fire up the test with maven

<pre class="brush: bash; title: ; notranslate" title="">mvn clean compile jar:jar test
</pre>

 [1]: http://blog.coralic.nl/2010/03/08/how-to-test-ejb3-1-with-embedded-container/
 [2]: http://files.coralic.nl/ejbe31mbeddedglassfish.zip
 [3]: http://blog.coralic.nl/2010/03/07/how-to-create-ejb-3-1/