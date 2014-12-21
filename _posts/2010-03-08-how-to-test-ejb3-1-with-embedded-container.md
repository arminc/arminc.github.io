---
title: How to test EJB3.1 with embedded container?
layout: post
permalink: /2010/03/08/how-to-test-ejb3-1-with-embedded-container/
categories:
  - Java
tags:
  - ejb
  - ejb3.1
  - embedded
  - embedded container
---
This is how you can test your EJB3.1 or the one I made [here][1] using an new embedded container provided in the new EJB. You can download the full package to test this [here][2]<!--more-->

We start off with creating an pom.xml so we can start using maven.

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
		&lt;/plugins&gt;
	&lt;/build&gt;
&lt;/project&gt;
</pre>

Now we take the sources from [here][1] and copy them to src/main/java/nl/coralic/blog/ejb31/

The presistance.xml from that sample goes here src/main/resources/META-INF

To be able to run the embedded container you need an implementation of it, I am using glassfish ones. You need the domain.xml in here glassfish/domains/domain1/config and you need the ds\_jdbc\_ra in glassfish/lib/install/applications/_\_ds\_jdbc\_ra. Without domain.xml and the configuration files in the ds\_jdbc_ra your embedded container is not able to use database (derby).

domain.xml sample

<pre class="brush: xml; title: ; notranslate" title="">&lt;domain log-root="${com.sun.aas.instanceRoot}/logs" application-root="${com.sun.aas.instanceRoot}/applications" version="10.0"&gt;
  &lt;system-applications /&gt;
  &lt;applications /&gt;
  &lt;resources&gt;
    &lt;jdbc-resource pool-name="__TimerPool" jndi-name="jdbc/__TimerPool" object-type="system-admin" /&gt;
    &lt;jdbc-resource pool-name="DerbyPool" jndi-name="jdbc/itemDataBase" /&gt;
    &lt;jdbc-connection-pool name="__TimerPool" datasource-classname="org.apache.derby.jdbc.EmbeddedXADataSource" res-type="javax.sql.XADataSource"&gt;
      &lt;property value="${com.sun.aas.instanceRoot}/lib/databases/ejbtimer" name="databaseName" /&gt;
      &lt;property value=";create=true" name="connectionAttributes" /&gt;
    &lt;/jdbc-connection-pool&gt;
    &lt;jdbc-connection-pool name="DerbyPool" datasource-classname="org.apache.derby.jdbc.EmbeddedXADataSource" res-type="javax.sql.XADataSource"&gt;
     &lt;property value="${com.sun.aas.instanceRoot}/lib/databases/default" name="databaseName" /&gt;
       &lt;property value=";create=true" name="connectionAttributes" /&gt;
     &lt;/jdbc-connection-pool&gt;
  &lt;/resources&gt;
  &lt;servers&gt;
    &lt;server name="server" config-ref="server-config"&gt;
      &lt;resource-ref ref="jdbc/__TimerPool" /&gt;
      &lt;resource-ref ref="jdbc/itemDataBase" /&gt;
    &lt;/server&gt;
  &lt;/servers&gt;
 &lt;configs&gt;
   &lt;config name="server-config"&gt;
     &lt;http-service&gt;
        &lt;access-log rotation-interval-in-minutes="15" rotation-suffix="yyyy-MM-dd" /&gt;
        &lt;virtual-server id="server"&gt;&lt;/virtual-server&gt;
        &lt;property value="false" name="accessLoggingEnabled" /&gt;
      &lt;/http-service&gt;
      &lt;iiop-service&gt;
        &lt;orb use-thread-pool-ids="thread-pool-1" /&gt;
        &lt;iiop-listener address="0.0.0.0" port="3700" id="orb-listener-1" /&gt;
        &lt;iiop-listener security-enabled="true" address="0.0.0.0" port="3820" id="SSL"&gt;
          &lt;ssl cert-nickname="s1as" /&gt;
        &lt;/iiop-listener&gt;
        &lt;iiop-listener security-enabled="true" address="0.0.0.0" port="3920" id="SSL_MUTUALAUTH"&gt;
          &lt;ssl cert-nickname="s1as" client-auth-enabled="true" /&gt;
        &lt;/iiop-listener&gt;
      &lt;/iiop-service&gt;
      &lt;admin-service type="das-and-server" system-jmx-connector-name="system"&gt;
        &lt;jmx-connector enabled="false" auth-realm-name="admin-realm" security-enabled="false" address="0.0.0.0" port="8686" name="system" /&gt;
        &lt;das-config autodeploy-enabled="false" dynamic-reload-enabled="true" deploy-xml-validation="full" autodeploy-dir="${com.sun.aas.instanceRoot}/autodeploy" /&gt;
        &lt;property value="/admin" name="adminConsoleContextRoot" /&gt;
        &lt;property value="${com.sun.aas.installRoot}/lib/install/applications/admingui.war" name="adminConsoleDownloadLocation" /&gt;
        &lt;property value="${com.sun.aas.installRoot}/.." name="ipsRoot" /&gt;
      &lt;/admin-service&gt;
      &lt;connector-service shutdown-timeout-in-seconds="30"&gt;
      &lt;/connector-service&gt;
      &lt;ejb-container steady-pool-size="0" max-pool-size="32" session-store="${com.sun.aas.instanceRoot}/session-store" pool-resize-quantity="8"&gt;
        &lt;ejb-timer-service /&gt;
      &lt;/ejb-container&gt;
      &lt;mdb-container steady-pool-size="0" max-pool-size="32" pool-resize-quantity="8" &gt;
      &lt;/mdb-container&gt;
      &lt;jms-service type="EMBEDDED" default-jms-host="default_JMS_host"&gt;
        &lt;jms-host name="default_JMS_host" host="localhost" port="7676" admin-user-name="admin" admin-password="admin"/&gt;
      &lt;/jms-service&gt;
      &lt;log-service file="${com.sun.aas.instanceRoot}/logs/server.log" log-rotation-limit-in-bytes="2000000"&gt;
        &lt;module-log-levels /&gt;
      &lt;/log-service&gt;
      &lt;security-service activate-default-principal-to-role-mapping="true" jacc="simple"&gt;
        &lt;auth-realm classname="com.sun.enterprise.security.auth.realm.file.FileRealm" name="admin-realm"&gt;
          &lt;property value="admin-keyfile" name="file" /&gt;
          &lt;property value="fileRealm" name="jaas-context" /&gt;
        &lt;/auth-realm&gt;
        &lt;auth-realm classname="com.sun.enterprise.security.auth.realm.file.FileRealm" name="file"&gt;
          &lt;property value="keyfile" name="file" /&gt;
          &lt;property value="fileRealm" name="jaas-context" /&gt;
        &lt;/auth-realm&gt;
        &lt;auth-realm classname="com.sun.enterprise.security.auth.realm.certificate.CertificateRealm" name="certificate" /&gt;
        &lt;jacc-provider policy-configuration-factory-provider="com.sun.enterprise.security.provider.PolicyConfigurationFactoryImpl" policy-provider="com.sun.enterprise.security.provider.PolicyWrapper" name="default"&gt;
          &lt;property value="${com.sun.aas.instanceRoot}/generated/policy" name="repository" /&gt;
        &lt;/jacc-provider&gt;
        &lt;jacc-provider policy-configuration-factory-provider="com.sun.enterprise.security.jacc.provider.SimplePolicyConfigurationFactory" policy-provider="com.sun.enterprise.security.jacc.provider.SimplePolicyProvider" name="simple" /&gt;
        &lt;audit-module classname="com.sun.enterprise.security.Audit" name="default"&gt;
          &lt;property value="false" name="auditOn" /&gt;
        &lt;/audit-module&gt;
        &lt;message-security-config auth-layer="SOAP"&gt;
          &lt;provider-config provider-id="XWS_ClientProvider" class-name="com.sun.xml.wss.provider.ClientSecurityAuthModule" provider-type="client"&gt;
            &lt;request-policy auth-source="content" /&gt;
            &lt;response-policy auth-source="content" /&gt;
            &lt;property value="s1as" name="encryption.key.alias" /&gt;
            &lt;property value="s1as" name="signature.key.alias" /&gt;
            &lt;property value="false" name="dynamic.username.password" /&gt;
            &lt;property value="false" name="debug" /&gt;
          &lt;/provider-config&gt;
          &lt;provider-config provider-id="ClientProvider" class-name="com.sun.xml.wss.provider.ClientSecurityAuthModule" provider-type="client"&gt;
            &lt;request-policy auth-source="content" /&gt;
            &lt;response-policy auth-source="content" /&gt;
            &lt;property value="s1as" name="encryption.key.alias" /&gt;
            &lt;property value="s1as" name="signature.key.alias" /&gt;
            &lt;property value="false" name="dynamic.username.password" /&gt;
            &lt;property value="false" name="debug" /&gt;
            &lt;property value="${com.sun.aas.instanceRoot}/config/wss-server-config-1.0.xml" name="security.config" /&gt;
          &lt;/provider-config&gt;
          &lt;provider-config provider-id="XWS_ServerProvider" class-name="com.sun.xml.wss.provider.ServerSecurityAuthModule" provider-type="server"&gt;
            &lt;request-policy auth-source="content" /&gt;
            &lt;response-policy auth-source="content" /&gt;
            &lt;property value="s1as" name="encryption.key.alias" /&gt;
            &lt;property value="s1as" name="signature.key.alias" /&gt;
            &lt;property value="false" name="debug" /&gt;
          &lt;/provider-config&gt;
          &lt;provider-config provider-id="ServerProvider" class-name="com.sun.xml.wss.provider.ServerSecurityAuthModule" provider-type="server"&gt;
            &lt;request-policy auth-source="content" /&gt;
            &lt;response-policy auth-source="content" /&gt;
            &lt;property value="s1as" name="encryption.key.alias" /&gt;
            &lt;property value="s1as" name="signature.key.alias" /&gt;
            &lt;property value="false" name="debug" /&gt;
            &lt;property value="${com.sun.aas.instanceRoot}/config/wss-server-config-1.0.xml" name="security.config" /&gt;
          &lt;/provider-config&gt;
        &lt;/message-security-config&gt;
      &lt;/security-service&gt;
      &lt;monitoring-service&gt;
        &lt;module-monitoring-levels /&gt;
      &lt;/monitoring-service&gt;
      &lt;transaction-service tx-log-dir="${com.sun.aas.instanceRoot}/logs" &gt;
      &lt;/transaction-service&gt;
      &lt;network-config&gt;
        &lt;protocols&gt;
        &lt;/protocols&gt;
        &lt;network-listeners&gt;
        &lt;/network-listeners&gt;
        &lt;transports&gt;
          &lt;transport name="tcp"&gt;&lt;/transport&gt;
        &lt;/transports&gt;
      &lt;/network-config&gt;
      &lt;thread-pools&gt;
          &lt;thread-pool name="http-thread-pool" max-queue-size="4096"&gt;&lt;/thread-pool&gt;
          &lt;thread-pool name="thread-pool-1" max-thread-pool-size="200"/&gt;
      &lt;/thread-pools&gt;
    &lt;/config&gt;
  &lt;/configs&gt;
  &lt;property name="administrative.domain.name" value="domain1"/&gt;
&lt;/domain&gt;
</pre>

Now that we have prepared everything we need to create an junit test to start our container and to test our bean.

<pre class="brush: java; title: ; notranslate" title="">package test;

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
		Map&lt;String, Object&gt; properties = new HashMap&lt;String, Object&gt;();
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
</pre>

All the required components ready to use, so lets start the test by running maven.

<pre class="brush: bash; title: ; notranslate" title="">mvn clean compile jar:jar test
</pre>

That&#8217;s it, this is all you have to do to test your EJB. Very easy and useful.

 [1]: http://blog.coralic.nl/2010/03/07/how-to-create-ejb-3-1/
 [2]: http://files.coralic.nl/ejb31EmbeddedCont.zip