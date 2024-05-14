---
layout: default
title: Research Sponsors
---

We are so thankful to the many funders of our group's work, past and present!

{% if site.data.sponsors %}
<div class="sponsors d-flex flex-wrap flex-md-row flex-column justify-content-around align-items-center">
  {% for item in site.data.sponsors %}
    {% assign sponsor=item[1] %}
    {% include sponsor.html sponsor=sponsor %}
  {% endfor %}
</div>
{% endif %}
