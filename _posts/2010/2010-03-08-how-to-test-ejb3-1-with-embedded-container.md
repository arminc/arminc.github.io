---
title: How to test EJB3.1 with embedded container?
layout: post
permalink: /2010/03/08/how-to-test-ejb3-1-with-embedded-container/
categories:
  - java
tags:
  - ejb
  - ejb3.1
  - embedded
  - embedded container
description: This is how you can test your EJB3.1 or the one I made apost using an new embedded container provided in the new EJB. You can download the full package to test this.
---
This is how you can test your EJB3.1 or the one I made [here][1] using an new embedded container provided in the new EJB. You can download the full package to test this [here][2]

We start off with creating an pom.xml so we can start using maven.

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
		</plugins>
	</build>
</project>
{% endhighlight %}

Now we take the sources from [here][1] and copy them to src/main/java/nl/coralic/blog/ejb31/

The presistance.xml from that sample goes here src/main/resources/META-INF

To be able to run the embedded container you need an implementation of it, I am using glassfish ones. You need the domain.xml in here glassfish/domains/domain1/config and you need the ds_jdbc_ra in glassfish/lib/install/applications/__ds_jdbc_ra. Without domain.xml and the configuration files in the ds_jdbc_ra your embedded container is not able to use database (derby).

domain.xml sample

{% highlight xml %}<domain log-root="${com.sun.aas.instanceRoot}/logs" application-root="${com.sun.aas.instanceRoot}/applications" version="10.0">
  <system-applications />
  <applications />
  <resources>
    <jdbc-resource pool-name="__TimerPool" jndi-name="jdbc/__TimerPool" object-type="system-admin" />
    <jdbc-resource pool-name="DerbyPool" jndi-name="jdbc/itemDataBase" />
    <jdbc-connection-pool name="__TimerPool" datasource-classname="org.apache.derby.jdbc.EmbeddedXADataSource" res-type="javax.sql.XADataSource">
      <property value="${com.sun.aas.instanceRoot}/lib/databases/ejbtimer" name="databaseName" />
      <property value=";create=true" name="connectionAttributes" />
    </jdbc-connection-pool>
    <jdbc-connection-pool name="DerbyPool" datasource-classname="org.apache.derby.jdbc.EmbeddedXADataSource" res-type="javax.sql.XADataSource">
     <property value="${com.sun.aas.instanceRoot}/lib/databases/default" name="databaseName" />
       <property value=";create=true" name="connectionAttributes" />
     </jdbc-connection-pool>
  </resources>
  <servers>
    <server name="server" config-ref="server-config">
      <resource-ref ref="jdbc/__TimerPool" />
      <resource-ref ref="jdbc/itemDataBase" />
    </server>
  </servers>
 <configs>
   <config name="server-config">
     <http-service>
        <access-log rotation-interval-in-minutes="15" rotation-suffix="yyyy-MM-dd" />
        <virtual-server id="server"></virtual-server>
        <property value="false" name="accessLoggingEnabled" />
      </http-service>
      <iiop-service>
        <orb use-thread-pool-ids="thread-pool-1" />
        <iiop-listener address="0.0.0.0" port="3700" id="orb-listener-1" />
        <iiop-listener security-enabled="true" address="0.0.0.0" port="3820" id="SSL">
          <ssl cert-nickname="s1as" />
        </iiop-listener>
        <iiop-listener security-enabled="true" address="0.0.0.0" port="3920" id="SSL_MUTUALAUTH">
          <ssl cert-nickname="s1as" client-auth-enabled="true" />
        </iiop-listener>
      </iiop-service>
      <admin-service type="das-and-server" system-jmx-connector-name="system">
        <jmx-connector enabled="false" auth-realm-name="admin-realm" security-enabled="false" address="0.0.0.0" port="8686" name="system" />
        <das-config autodeploy-enabled="false" dynamic-reload-enabled="true" deploy-xml-validation="full" autodeploy-dir="${com.sun.aas.instanceRoot}/autodeploy" />
        <property value="/admin" name="adminConsoleContextRoot" />
        <property value="${com.sun.aas.installRoot}/lib/install/applications/admingui.war" name="adminConsoleDownloadLocation" />
        <property value="${com.sun.aas.installRoot}/.." name="ipsRoot" />
      </admin-service>
      <connector-service shutdown-timeout-in-seconds="30">
      </connector-service>
      <ejb-container steady-pool-size="0" max-pool-size="32" session-store="${com.sun.aas.instanceRoot}/session-store" pool-resize-quantity="8">
        <ejb-timer-service />
      </ejb-container>
      <mdb-container steady-pool-size="0" max-pool-size="32" pool-resize-quantity="8" >
      </mdb-container>
      <jms-service type="EMBEDDED" default-jms-host="default_JMS_host">
        <jms-host name="default_JMS_host" host="localhost" port="7676" admin-user-name="admin" admin-password="admin"/>
      </jms-service>
      <log-service file="${com.sun.aas.instanceRoot}/logs/server.log" log-rotation-limit-in-bytes="2000000">
        <module-log-levels />
      </log-service>
      <security-service activate-default-principal-to-role-mapping="true" jacc="simple">
        <auth-realm classname="com.sun.enterprise.security.auth.realm.file.FileRealm" name="admin-realm">
          <property value="admin-keyfile" name="file" />
          <property value="fileRealm" name="jaas-context" />
        </auth-realm>
        <auth-realm classname="com.sun.enterprise.security.auth.realm.file.FileRealm" name="file">
          <property value="keyfile" name="file" />
          <property value="fileRealm" name="jaas-context" />
        </auth-realm>
        <auth-realm classname="com.sun.enterprise.security.auth.realm.certificate.CertificateRealm" name="certificate" />
        <jacc-provider policy-configuration-factory-provider="com.sun.enterprise.security.provider.PolicyConfigurationFactoryImpl" policy-provider="com.sun.enterprise.security.provider.PolicyWrapper" name="default">
          <property value="${com.sun.aas.instanceRoot}/generated/policy" name="repository" />
        </jacc-provider>
        <jacc-provider policy-configuration-factory-provider="com.sun.enterprise.security.jacc.provider.SimplePolicyConfigurationFactory" policy-provider="com.sun.enterprise.security.jacc.provider.SimplePolicyProvider" name="simple" />
        <audit-module classname="com.sun.enterprise.security.Audit" name="default">
          <property value="false" name="auditOn" />
        </audit-module>
        <message-security-config auth-layer="SOAP">
          <provider-config provider-id="XWS_ClientProvider" class-name="com.sun.xml.wss.provider.ClientSecurityAuthModule" provider-type="client">
            <request-policy auth-source="content" />
            <response-policy auth-source="content" />
            <property value="s1as" name="encryption.key.alias" />
            <property value="s1as" name="signature.key.alias" />
            <property value="false" name="dynamic.username.password" />
            <property value="false" name="debug" />
          </provider-config>
          <provider-config provider-id="ClientProvider" class-name="com.sun.xml.wss.provider.ClientSecurityAuthModule" provider-type="client">
            <request-policy auth-source="content" />
            <response-policy auth-source="content" />
            <property value="s1as" name="encryption.key.alias" />
            <property value="s1as" name="signature.key.alias" />
            <property value="false" name="dynamic.username.password" />
            <property value="false" name="debug" />
            <property value="${com.sun.aas.instanceRoot}/config/wss-server-config-1.0.xml" name="security.config" />
          </provider-config>
          <provider-config provider-id="XWS_ServerProvider" class-name="com.sun.xml.wss.provider.ServerSecurityAuthModule" provider-type="server">
            <request-policy auth-source="content" />
            <response-policy auth-source="content" />
            <property value="s1as" name="encryption.key.alias" />
            <property value="s1as" name="signature.key.alias" />
            <property value="false" name="debug" />
          </provider-config>
          <provider-config provider-id="ServerProvider" class-name="com.sun.xml.wss.provider.ServerSecurityAuthModule" provider-type="server">
            <request-policy auth-source="content" />
            <response-policy auth-source="content" />
            <property value="s1as" name="encryption.key.alias" />
            <property value="s1as" name="signature.key.alias" />
            <property value="false" name="debug" />
            <property value="${com.sun.aas.instanceRoot}/config/wss-server-config-1.0.xml" name="security.config" />
          </provider-config>
        </message-security-config>
      </security-service>
      <monitoring-service>
        <module-monitoring-levels />
      </monitoring-service>
      <transaction-service tx-log-dir="${com.sun.aas.instanceRoot}/logs" >
      </transaction-service>
      <network-config>
        <protocols>
        </protocols>
        <network-listeners>
        </network-listeners>
        <transports>
          <transport name="tcp"></transport>
        </transports>
      </network-config>
      <thread-pools>
          <thread-pool name="http-thread-pool" max-queue-size="4096"></thread-pool>
          <thread-pool name="thread-pool-1" max-thread-pool-size="200"/>
      </thread-pools>
    </config>
  </configs>
  <property name="administrative.domain.name" value="domain1"/>
</domain>
{% endhighlight %}

Now that we have prepared everything we need to create an junit test to start our container and to test our bean.

{% highlight java %}package test;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.ejb.embeddable.EJBContainer;
import javax.naming.Context;
import javax.naming.NamingException;

import nl.coralic.blog.ejb31.*;

import org.junit.Test;

public class TestItem
{
	@Test
	public void saveAndGetKlant() throws NamingException, InterruptedException
	{
		Map<String, Object> properties = new HashMap<String, Object>();
		properties.put(EJBContainer.MODULES, new File("target/classes"));
		properties.put("org.glassfish.ejb.embedded.glassfish.installation.root", "glassfish");
		properties.put(EJBContainer.APP_NAME, "coralic");
		EJBContainer c = EJBContainer.createEJBContainer(properties);
		Context ic = c.getContext();
		ItemService itemService = (ItemService) ic.lookup("java:global/coralic/ItemService");
		Item item = new Item();
		item.setItemName("testname");
		itemService.save(item);

		System.out.println("Get all items from DB and show itemname for the first one: " + itemService.getItems().get(0).getItemName());

		c.close();
	}
}
{% endhighlight %}

All the required components ready to use, so lets start the test by running maven.

{% highlight bash %}mvn clean compile jar:jar test
{% endhighlight %}

That's it, this is all you have to do to test your EJB. Very easy and useful.

 [1]: {{ site.baseurl }}/2010/03/07/how-to-create-ejb-3-1/
 [2]: http://files.coralic.nl/ejb31EmbeddedCont.zip