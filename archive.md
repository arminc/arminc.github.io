---
layout: default
title: Blog archive
---
<div class="page-content wc-container">
  <h1>Blog Archive</h1>  
  {% for post in site.posts %}
  	{{ post.date }}
{% endfor %}
</div>