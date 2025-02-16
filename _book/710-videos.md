---
title: Videos
layout: prev-next-collection
summary: Some video tutorials or presentations.
---

<div>
<ol>

{% for t in site.videos %}<li><a href="{{t.url}}">{{t.title}}</a> – {{t.summary}}</li>
{% endfor %}

</ol>
</div>

