---
layout: default
title: Blog archive
permalink: /archive/
---
<div class="page-content wc-container">
	<h1>Archive - year</h1>
  	{% for post in site.posts %}
  		{% capture currentyear %}{{post.date | date: "%Y"}}{% endcapture %}
  		{% if currentyear != year %}
    		{% unless forloop.first %}</ul>{% endunless %}
    			<h5>{{ currentyear }}</h5>
    			<ul class="posts">
    			{% capture year %}{{currentyear}}{% endcapture %}
  		{% endif %}
    	<li><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></li>
	{% endfor %}

  <h1>Archive - category</h1>
  {% for category in site.categories %}
    <h5>{{ category | first }}</h5>
    <ul class="posts">
    {% for posts in category %}
      {% for post in posts %}
        <li><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a></li>
      {% endfor %}
    {% endfor %}
    </ul>
  {% endfor %}
</div>