---
title: Bndtools FAQ
description: Frequently Asked Questions
author: Neil Bartlett
---


How Can I Depend on a Plain JAR File at Build Time?
===================================================

Sometimes it is useful to add a plain JAR file to the build-time dependencies of a project. For example we may want to use a "pure" API JAR to build against, but use a different artefact at runtime. Or we may be planning to embed the dependency in our bundle.

Plain JAR files should be added to the Build Path using the `version=file` attribute. Unfortunately there is currently no GUI support for this attribute so you will have to edit the *Source* tab:

    -buildpath: libs/servlet-api-3.0.jar;version=file

Note that this approach is better than using Eclipse's *Add to Build Path* action, because the latter will not be visible when the project is built offline using ANT; i.e. a project that compiles in Eclipse may not compile in ANT. Using the `-buildpath` approach ensures that both Eclipse and ANT build the project in exactly the same way.
