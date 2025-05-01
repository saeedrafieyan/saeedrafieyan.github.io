---
layout: cv
permalink: /cv/
title: CV
nav: true
nav_order: 5
cv_pdf: CV - Saeed Rafieyan.pdf
description: My working and academic CV.
toc:
  sidebar: left
---

{% for publication in site.data.resume.publications %}

  <div class="publication">
    <h3>{{ publication.name }}</h3>
    <p><strong>Journal:</strong> {{ publication.journal }}</p>
    <p><strong>Authors:</strong> {{ publication.authors }}</p>
    <p><strong>Publisher:</strong> {{ publication.publisher }}</p>
    <p><strong>Release Date:</strong> {{ publication.releaseDate }}</p>
    <p><a href="{{ publication.url }}" target="_blank">Read more</a></p>
  </div>
{% endfor %}
