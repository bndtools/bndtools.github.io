---
title: JAR Wrapping Tutorial
layout: prev-next-collection
noindex: true
---

This tutorial is under review. Feedback appreciated (PRs on [Github](https://github.com/bndtools/bndtools.github.io/tree/master/_tutorial_wrap))
{: .note }

## Why to wrap JAR files?

OSGi developers face a challenge when using third-party libraries that are not supplied as OSGi bundles. Though an increasing number of libraries are available from their original sources as OSGi bundles, and a large number are available as wrapped OSGi bundles from external repositories, it is still sometimes necessary to build such a wrapper ourselves. This tutorial details an approach to OSGi bundle production using bnd/bndtools/gradle. 

## What you learn in this tutorial.

In this quick start we learn how to _wrap_ a JAR to become a Bundle. Wrapping a JAR means that we need add the required OSGi manifest headers but also _design_ the contents of the bundle. Modularity is not about fences, modularity is about what you put inside those fences and what passages you allow. The bnd tool provides an overwhelming amount of instructions and features to create the Bundle you want; this tutorial tries to shine light on what forces are in play and what tools are available.

This tutorial teaches the wrapping from the perspective of a Bndtools user. For any command line zealots this should not be too hard to map to `vi` since all we do is write a `bnd.bnd` file in Bndtools, which is also usable in for example Maven. The key advantage of Bndtools is that it shows you the missing packages interactively. If you want to stay on the command line, then you could take a look at [bnd Wrapping](https://bnd.bndtools.org/chapters/390-wrapping.html).

In the coming chapters it is assumed you have a workspace ready. If you've no clue what we're talking about suggest you follow the [Quick Start] tutorial first.

**A disclaimer.** This wrapping tutorial is about learning to use wrapping bundles inside the OSGi enRoute tool chain, it is not about learning Java, Git, nor Eclipse. It is assumed that you have basic experience with these tools and that you have at least followed the [Quick Start] tutorial.

If you're just interested in the end result, you can look at the (archived) [osgi.enroute.examples.wrapping.dom4j.adapter] project.

If you have any questions about this wrapping tutorial, please discuss them in the [Forum].

## Sections

<div>
<table>
	<colgroup>
		<col style="width:50%">
		<col style="width:50%">
	</colgroup>
	<tbody>
{% for qs in site.tutorial_wrap %}{%unless qs.noindex%}<tr><td><a href="{{qs.url}}">{{qs.title}}</a></td><td>{{qs.summary}}</td></tr>
{%endunless%}{% endfor %}
	</tbody>
</table>
</div>


## End

So, you've finished this wrapping tutorial! What's next?

Well, first, since we're still in beta, we'd love feedback. Our most favorite feedback is a pull request on the documentation. We, and others like you, highly appreciate these kind of contributions.

If you've become interested in what bnd can do for you, then you could look at the [wrapping with bnd] chapter in the bnd manual.

However, running into real problems is the best way to learn a technology. If you run into problems, use the [Forum] to ask questions and get answers.

[forum]: https://bnd.discourse.group/
[Quick Start]: /qs/050-start
[wrapping with bnd]: https://bnd.bndtools.org/chapters/390-wrapping.html
[-conditionalpackage]: https://bnd.bndtools.org/instructions/conditionalpackage.html
[133 Service Loader Mediator Specification]: https://blog.osgi.org/2013/02/javautilserviceloader-in-osgi.html
[semanticaly versioned]: https://bnd.bndtools.org/chapters/170-versioning.html 
[135.3 osgi.contract Namespace]: https://blog.osgi.org/2013/08/osgi-contracts-wonkish.html
[BSD style license]: https://dom4j.sourceforge.net/dom4j-1.6.1/license.html
[supernodes of small worlds]: https://en.wikipedia.org/wiki/Small-world_network
[OSGiSemVer]: https://www.osgi.org/wp-content/uploads/SemanticVersioning.pdf
[osgi.enroute.examples.wrapping.dom4j.adapter]: https://github.com/osgi/osgi.enroute.examples/tree/485624f6cb66df91f668d6eb9a5c8e491312c8c4/osgi.enroute.examples.wrapping.dom4j.adapter