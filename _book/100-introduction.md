---
title: Introduction about OSGi enRoute Classic
layout: prev-next-collection
summary: Is OSGi enRoute for You?
noindex: true
---

The enRoute Classic section is a collection of in-depth tutorials and examples, helping you developing OSGi applications with bnd / bndtools.

<div>
<table>

{% for book in site.book %}{%unless book.noindex%}<tr><td><a href="{{book.url}}">{{book.title}}</a></td><td>{{book.summary}}</td></tr>
{%endunless%}{% endfor %}

</table>
</div>

## Why OSGi enRoute exists

We _strongly_ believe that OSGi's Service Oriented Systems is the best paradigm available today for software development. But we are also frustrated when we see how hard it is for people to cross the chasm to reach that new paradigm. Out of this frustration, the OSGi enRoute project was born.

This OSGi Alliance initiative is about removing the barriers to adoption. It is about creating an environment where development of applications is almost as easy to get started with as Ruby on Rails applications without loosing the key advantages of OSGi/Java for projects that grow beyond their initial size.

The following picture shows this idea. Where OSGi/Java provides a better development environment for large application development, it is hard to deny that it is a lot easier to get started with popular non-type safe languages like for example node.js or Ruby on Rails. It is the mission of OSGi enRoute to lower this threshold.

![Lowering the barriers](/img/book/why-enroute.png)

To lower the barriers OSGi enRoute provides:

* A profile of common services and extenders to base applications on
* A distribution with selected open source implementations for the profile
* A complete software development tool chain
* A catalog of service data sheets
* Tutorials
* Forum

## Is OSGi enRoute for You?

If you're a software developer then likely it is. The Service Oriented Systems (SOS) paradigm significantly simplifies building systems out of components; the holy grail of software development. In the eighties and nineties of the previous century Object Oriented Design (OOD) gave us a significant improvement in software productivity; SOS is about to do the same thing. SOS addresses many of the issues that OOD neglected and that have come to haunt us now that systems have become widely distributed.

If you're new to SOS then the ride might not be easy, even though you're very clever. Any paradigm shift is hard to make because you only make the transition once you look at your older code and say: 'What was I thinking?'. Before that moment you can only say: 'What are they thinking?'. 

That said, we've gone out of our way to make the transition as easy as possible. And you're worth it ... 

## Together We're Stronger 

We strive to be complete because a key problem for starters is how to assemble all the parts to just do a `Hello World`. But we actually also strive to become redundant over time. Not only are there a lot more smart people outside the OSGi Alliance than inside, we also feel that Service Oriented Programming is about assembling from many different sources. We therefore want this project to be a collaboration between many parties. This web site is hosted on [Github][enroute-doc] and pull-requests are very much welcomed. We also setup the profiles and the tool chain so that others, both commercial and open source companies, can extend the model.

If you're part of a project (commercial or open source) and want to participate in the OSGi enRoute project do not hesitate to contact us.

We're here to prime the pump.

## How to Get Started?

If you're new to OSGi we suggest you follow the [tutorials](/book/150-tutorials.html). If you're already into OSGi, you can check out the [services catalog](/book/400-services.html).

[enroute-doc]: https://github.com/bndtools/bndtools.github.io/tree/master/_book

