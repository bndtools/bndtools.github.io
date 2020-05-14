---
layout: default
title: Blog Posts
---

You can submit blog post as a [PR](https://github.com/bndtools/bndtools.github.io/tree/master/_posts).

<table>
<colgroup>
        <col style="width:10%">
        <col style="width:70%">
        <col style="width:20%">
        <col>
</colgroup>
<tbody>
{% for page in site.posts %}
<tr class="item" onclick="location.href='{{page.url}}'">
	<td><p class="date">{{page.date | date: "%B %e, %Y"}}</p></td>
	<td><h3 class="title">{{page.title}}</h3>
           <p class="description">{{page.description}}</p></td>
        <td><p class="author">{{page.author}}</p></td>
</tr>
{% endfor %}
</tbody>
</table>
