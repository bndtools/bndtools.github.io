---
title: Tutorials
layout: default
---

This section is an entry to the hopefully growing collection of tutorials that OSGi enRoute provides. If you want to develop an additional tutorial, please submit a PR.

## Base Tutorial

![Thumbnail for Base Tutorial](/img/tutorial_base/debug-xray-1.png)
{: .thumb200-l }

The Base Tutorial is a very extensive tutorial that takes you to all the principles. It starts from scratch and it brings you all the way to a release cycle with continuous integration. It is absolutely worth the effort to go through this tutorial to really learn OSGi.

[Go to the Base Tutorial](/tutorial_base/050-start.html)

{: style='clear:both;' }

## IoT Tutorial

![Thumbnail for IoT Tutorial](/img/tutorial_iot/exploring-led-breadboard-1.png)
{: .thumb200-l }

The Internet of Things ... a concept that has as many definitions as there are things you can connect to the Internet. However, most definitions place an emphasis on the _edge devices_ and the _gateways_, which is of course right in the realm that was the raison d'être of OSGi already so long ago.

This tutorial uses OSGi enRoute to develop an application for a [Raspberry Pi][pi]. The Raspberry Pi is a formidable machine that would put many laptops to shame a few years ago. The OS is Linux and it has lots of inputs and outputs. For OSGi enRoute, we've developed a number of bundles that allow you to play with the Raspberry. This tutorial will explain how to get started with the Raspberry Pi and then show how to do interesting things.

[Go to the IoT Tutorial](/tutorial_iot/050-start.html)

{: style='clear:both;' }

## Distributed OSGi with Zookeeper

![Thumbnail for IoT Tutorial](/img/tutorial_rsa/rsa-service-0.png)
{: .thumb200-l }

This tutorial takes you through the steps to build a trivial Chat application using distributed OSGi. We first build a service API for a Chat client and use this API in an implementation. Then we add a command to test the implementation. After this works, we run a Zookeeper server from Bndtools. This Zookeeper server is used by the Amdatu Distributed OSGi implementation to distribute the Chat services. To finish it off, we create a client in the browser. 

[Go to the Distributed OSGi with Zookeeper Tutorial](/tutorial_rsa/050-start.html)

{: style='clear:both;' }

## Maven Bnd Repository

![Thumbnail for Maven Tutorial](/tutorial_maven/img/maven.gif)
{: .thumb200-l }
The Maven Bnd Repository Plugin provides full bi-drectional access to the local Maven repository, remote repositories like Maven Central, and company wide repositories like Nexus and Artifactory. In this tutorial we take the plugin for a ride. We first use the plugin to get access to Maven Central resources. Then we setup the build that all JARs end up in the local Maven repository so that they can be used by any Maven project. We then show how to link in Maven projects. Last but not least we demonstrate how to release snapshots and releases to Maven Central.


[Go to the Maven Tutorial](/tutorial_maven/050-start.html)

{: style='clear:both;' }

## JAR Wrapping Tutorial

In this quick start we learn how to _wrap_ a JAR to become a Bundle. Wrapping a JAR means that we need add the required OSGi manifest headers but also _design_ the contents of the bundle.

[Go to the JAR Wrapping Tutorial](/tutorial_wrap/050-start.html)

{: style='clear:both;' }

[pi]: https://www.raspberrypi.org/


