---
title: How to create EJB 3.1
layout: post
permalink: /2010/03/07/how-to-create-ejb-3-1/
categories:
  - java
tags:
  - ejb
  - ejb3.1
  - persistance.xml
description: This post describes how to create an simple Entity and Session bean with EJB3.1. As some of you know EJB 3.1 is ready to use and makes the world much easier for the developers. No more xml configuration files except “persistence.xml”. Everything can be done using annotations and if you decide to use xml configuration files they overrule the annotations.
---
This post describes how to create an simple Entity and Session bean with EJB3.1. As some of you know EJB 3.1 is ready to use and makes the world much easier for the developers. No more xml configuration files except “persistence.xml”. Everything can be done using annotations and if you decide to use xml configuration files they overrule the annotations.

  
I am telling you using EJB now is as easy as programming POJOs. This is how you define an simple Entity bean.

{% highlight java %}
package nl.coralic.blog.ejb31;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

@Entity
@NamedQuery(name=Item.findAll,query="SELECT item from Item item")
public class Item
{
	public final static String findAll = "nl.coralic.blog.ejb31.findAll";

	@Id
    	@GeneratedValue(strategy = GenerationType.AUTO)
    	private Long itemid;

	private String itemName;

	public String getItemName()
	{
		return itemName;
	}

	public void setItemName(String itemName)
	{
		this.itemName = itemName;
	}

	public Long getItemid()
	{
		return itemid;
	}
}
{% endhighlight %}

And this is how you define an simple Session bean.

{% highlight java %}package nl.coralic.blog.ejb31;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ItemService
{
	@PersistenceContext(unitName = "itemDataBase")
	EntityManager em;

	public void save(Item item)
	{
		this.em.persist(item);
	}

	public Item findItem(long id)
	{
		return this.em.find(Item.class, id);
	}

	public List<Item> getItems()
	{
		return this.em.createNamedQuery(Item.findAll).getResultList();
	}

	public void delete(long itemid)
	{
		Item item = findItem(itemid);
		if (item != null)
		{
			em.remove(item);
		}
	}
}
{% endhighlight %}

To be able to save the entity you need some kind of an persistence, this is an example of the persistance.xml

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<persistence version="2.0" xmlns="http://java.sun.com/xml/ns/persistence" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_2_0.xsd">
  <persistence-unit name="itemDataBase" transaction-type="JTA">
    <provider>org.eclipse.persistence.jpa.PersistenceProvider</provider>
    <jta-data-source>jdbc/itemDataBase</jta-data-source>
    <properties>
      <property name="eclipselink.ddl-generation" value="drop-and-create-tables"/>
    </properties>
  </persistence-unit>
</persistence>
{% endhighlight %}

This is it, this is all you need to create an ejb jar file that is deployable to the server.