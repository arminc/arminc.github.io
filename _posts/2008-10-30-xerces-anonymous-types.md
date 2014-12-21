---
title: Xerces Anonymous types
layout: post
permalink: /2008/10/30/xerces-anonymous-types/
categories:
  - Java
tags:
  - anonymous types
  - svn
  - xerces
---
What does everyone do when using open source project? UHM&#8230; find the binary and download it. Oke, that&#8217;s not bad but it sometimes pays off to go and use the sources of that project. By sources I mean look at the CVS/SVN repository of the project. Why you may ask?

The reason it pays is because sometimes in the repository you find the latest fixes that are not released yet. The same is with the this issue with xerces I stumbled upon.<!--more-->

**What is the problem?**

Anonymous type name is not assigned to the simple type definition of a complex type derived by restriction from a complex type with simple content.

Sample XSD:

<pre class="brush: xml; title: ; notranslate" title=""></pre>

Sample OUTPUT:

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      There has been a schema validation error in &#8220;file:///home/..&#8221; on line number 23, column number 88. Error message: cvc-pattern-valid: Value &#8217;1&#8242; is not facet-valid with respect to pattern &#8216;([0-9]{6})&#8217; for type &#8216;null&#8217;.
    </td>
  </tr>
</table>

**What is the fix?**

The fix is made by Michael Glavassevich in 2007 but has not been released jet. So while I was looking trough the sources I downloaded from the xerces site (zipped) to see if I can find the problem I found the solution on the net. The solution was already on the SVN trunk of xerces but was not released yet. The actual fix Michael made is in XSDComplexTypeTraverser.java

it replaces this

<pre class="brush: java; title: ; notranslate" title="">fXSSimpleType = schemaFactory.createTypeRestriction(null,schemaDoc.fTargetNamespace,(short)0,baseValidator,null);
</pre>

to this:

<pre class="brush: java; title: ; notranslate" title="">String name = genAnonTypeName(simpleContentElement);
fXSSimpleType = schemaFactory.createTypeRestriction(name,schemaDoc.fTargetNamespace,(short)0,baseValidator,null);
if (fXSSimpleType instanceof XSSimpleTypeDecl) {
((XSSimpleTypeDecl)fXSSimpleType).setAnonymous(true); }
</pre>

Sample OUTPUT now:

<table border="1" cellspacing="0" cellpadding="4" width="100%">
  <col width="256"></col> <tr>
    <td width="100%" valign="top">
      There has been a schema validation error in &#8220;file:///home/&#8230;&#8221; on line number 23, column number 88. Error message: cvc-pattern-valid: Value &#8217;1&#8242; is not facet-valid with respect to pattern &#8216;([0-9]{6})&#8217; for type &#8216;#AnonType_nonNegativeInteger6CItemType&#8217;.
    </td>
  </tr>
</table>