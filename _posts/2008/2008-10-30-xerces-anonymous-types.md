---
title: Xerces Anonymous types
layout: post
permalink: /2008/10/30/xerces-anonymous-types/
categories:
  - java
tags:
  - anonymous types
  - svn
  - xerces
description: What does everyone do when using open source project? UHM&#8230; find the binary and download it. Oke, that's not bad but it sometimes pays off to go and use the sources of that project. By sources I mean look at the CVS/SVN repository of the project. Why you may ask?
---
What does everyone do when using open source project? UHM&#8230; find the binary and download it. Oke, that's not bad but it sometimes pays off to go and use the sources of that project. By sources I mean look at the CVS/SVN repository of the project. Why you may ask?

The reason it pays is because sometimes in the repository you find the latest fixes that are not released yet. The same is with the this issue with xerces I stumbled upon.

**What is the problem?**

Anonymous type name is not assigned to the simple type definition of a complex type derived by restriction from a complex type with simple content.

Sample XSD:

<pre class="brush: xml; title: ; notranslate" title=""></pre>

Sample OUTPUT:

<pre>
There has been a schema validation error in "file:///home/.." on line number 23, column number 88. Error message: cvc-pattern-valid: Value '1' is not facet-valid with respect to pattern '([0-9]{6})' for type 'null'.
</pre>

**What is the fix?**

The fix is made by Michael Glavassevich in 2007 but has not been released jet. So while I was looking trough the sources I downloaded from the xerces site (zipped) to see if I can find the problem I found the solution on the net. The solution was already on the SVN trunk of xerces but was not released yet. The actual fix Michael made is in XSDComplexTypeTraverser.java

it replaces this

{% highlight java %}
fXSSimpleType = schemaFactory.createTypeRestriction(null,schemaDoc.fTargetNamespace,(short)0,baseValidator,null);
{% endhighlight %}

to this:

{% highlight java %}
String name = genAnonTypeName(simpleContentElement);
fXSSimpleType = schemaFactory.createTypeRestriction(name,schemaDoc.fTargetNamespace,(short)0,baseValidator,null);
if (fXSSimpleType instanceof XSSimpleTypeDecl) {
((XSSimpleTypeDecl)fXSSimpleType).setAnonymous(true); }
{% endhighlight %}

Sample OUTPUT now:

<pre>
There has been a schema validation error in "file:///home/..." on line number 23, column number 88. Error message: cvc-pattern-valid: Value '1' is not facet-valid with respect to pattern '([0-9]{6})' for type '#AnonType_nonNegativeInteger6CItemType'.
</pre>