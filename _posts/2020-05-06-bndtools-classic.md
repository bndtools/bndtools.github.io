---
layout: post
title: Bndtools without OSGi?
description: Bndtools is the premier development tool OSGi applications. However, can it also be used to build plain old Java applications without OSGi?
comments: true
author: Peter Kriens
---

![beach](/assets/img/beach.jpg)

Even though I am acutely aware that as an insider I will tend to think Bndtools is better than it is, I cannot suppress the feeling that outsiders undervalue it. Since bnd started in late 1999, it has been a skunk works project for many years. When Neil Bartlett started the Bndtools Eclipse plugin, it took a great jump forward. However, in the last 5 years the project professionalized significantly because BJ Hargrave (IBM) took the helm because IBM build Websphere Liberty with Bndtools (with its included Gradle CI build), [a very large workspace](https://github.com/OpenLiberty/open-liberty/tree/integration/dev). The large size of liberty put a lot of pressure on the performance and usability of Bndtools & the accompanying Gradle plugin. Liferay was more or less forced to use Maven, this caused Ray Augé and Greg Gamerson to work hard on Maven plugins that provide the bnd functionality into the Maven world. However, the `bndrun` files, the assembly specifications have no good counterpart in the maven world and they decided to support this functionality in Bndtools. Stefan Bisschof and Clément Delgrange created a complete documentation system based on OSGi metadata in the bnd command line. Last but not least, father Krieg supported us with many improvements of Bndtools. Many people contributed to documentation & bug fixes. Personally, I got occupied with several customers that use Bndtools with quite large workspaces (300+ projects) and added many useful functions for the more embedded world. And we even have a plugin for Intellij that seems to support many Bndtools functions on the same workspace surprisingly well.

I think I can proudly claim Bndtools has grown up from a skunk work project to a shining open source project on a hill, [getting an A+ for one of the larger projects evaluated by LGTM](https://lgtm.com/projects/g/bndtools/bnd/context:java).

However, what people do not know that you can also use Bndtools to make standard Java applications. Why would anybody want to that?

I'd say that the primary reason is that we've never given up on the GUI. If you look at the situation in the Javascript world then you can see the enormous success of the _command line_. This is slowly trickling back into the Java world with things like Spring boot. Where the goal was _to get rid of the command line_ at the end of the previous millenium, it came back with a vengeance because we underestimated how hard it is to make good GUI applications. A command line app is magnitudes less complex than a GUI app. For something as complex as an IDE, it sadly turned out that often it felt it caused more problems than it solved. In 2000, Eclipse did a fantastic job as an IDE but there were several choices that severely handicapped its route to success.

The first reason was the enormous number of bad plugins. Lots of developers developed a quickly hacked plugin for Eclipse and dumped it on the innocent users. It got a lot better, but there have been times 90% of the plugins simply didn't work.

To be honest, I was one of those people. As with many things in software, it is very easy to get started and make something that looks like it works. It is really hard to make something that actually works for other users in industrial conditions. And to be even more honest, making a working plugin for Eclipse is incredibly hard work. The chaos that ensued because of the bad plugins has given Eclipse a bad name, a bad name that it has not yet recovered from. Recently I gave a course and one of the attendants was disgusted he had to use Eclipse instead of Intellij. At the first problem he ran into, he immediately felt vindicated that Eclipse was rubbish, and he did show some scars. Fortunately, he did turn around when he saw how productive Bndtools was, but sadly his frustrations based on real experiences ran deep.

However, the second reason was even more fundamental. The brilliant Eclipse developers simply forgot about _Continuous Integration_ (CI). With CI, the system must be build on another computer without the help of a user. However, the whole internal build structure was optimized for _interactivity_. In Eclipse, when you change a file, Eclipse will automatically build any dependencies. It uses an elaborate mechanism that tracks the changes on the file system. To make things work, you need to be fast for the user experience. This requires lots of caching, which makes things even more complex. Although the Eclipse codebase uses many of these parts brilliantly, I still find it hard to grasp how things should be done. Thank God, we've got more help nowadays from some Eclipse experts or people willing to find out in detail how things are supposed to be used.

Unfortunately, Eclipse's build architecture did not have a good command line version. Running Eclipse headless did not work very well. Around 2000, Ant was the java build tool of choice. Eclipse did include tooling to create Ant files but it was half hearted. Worse, many settings that affected the build were hidden in user settings, which is an assault against software engineering. For example, you could set the VM version in your user preferences, but there was no way to use that information in a CI build since this was only available to that user. This meant that developers fled to the upcoming Maven, and later Gradle CI tools.

You can argue that an IDE is optional but a CI build is mandatory. A product build on a user's machine is just not repeatable, and without repeatability you will always be struggling. When I worked at Ericsson in the nineties, we had to ensure we could build our products on a virginal machine. It was a lot of work, but in the end worth it. If your customer had a bug 2 years later, it was fantastic you could build the product against identical as the customer had it. If you have a mere website with continuous deployment, you also need to build in the cloud because you do not want the result to change depending on the developers that pushed it because they had a different user setting.

Last but not least, Eclipse had designed their own repository model, p2. P2 is overly complex and was very hard to use outside Eclipse because they had not specified an external format; an API (and complex library) was the only way to use it. This lack of usability gave the Java repository market away to Maven.

So the rest is history. The CI tools took off and became dominant over the IDE's and the IDEs submitted. Most IDEs are scaffolding around a CI tool nowadays. I recently used Android Studio (Intellij + Gradle) and was flabbergasted how primitive it felt. Being used to immediately see the result of _any_ change I made, however, small, I had to run a Gradle build for, what felt like, minor steps. Frequently wasting time chasing bugs that turned out to be a forgotten build step.

IDEs that adapt to CI tools introduce the problem of _fidelity_. Any discrepancy between the IDE and the CI is lethal ... for the IDE. One of the most annoying things in software development is breaking the build while your IDE is smiling happy. Yuck!

Since it is so easy to add functions to a command line tool, staying close became very hard. Sonatype started an Eclipse plugin called M2E that let maven run inside Eclipse, Gradle is still working on Buildship, an Eclipse build. Both have become a lot better in the past few years but they are still trying to drive a square pin through a round hole.

Although everybody in the IDE world either died or surrendered to the command line, there was one plugin that resisted. When I started bnd the requirement was to be able to use it in any piece of software that was interested. Therefore, the core _bndlib_ has zero external dependencies and has no code that tries to interact with the external world. It provides an internal build model, designed around properties, that tries to be declarative and not too imposing. A _driver_, like Gradle, Eclipse, or Ant, can take this model and without a lot of effort build a bnd workspace.

The bndlib library was developed almost from ground up to live in an Eclipse environment but also be used in a CI tool. I will not deny that at times it got hairy but today we're in extremely good shape. Some of the key features in Bndtools & the CI tool:

- Live! – Build all JARs continuously, finding errors and using actual dependencies. It is really hard to imagine how dynamic Bndtools is. With OSGi, debugging is a dream come true, you never have to restart the framework or perform a build step.
- Large Workspaces – Bndtools routinely handles hundreds of projects in a workspace. The Bndtools explorer makes easy to keep an overview.
- Repositories – Only environment that supports all repositories out of the box: Maven, P2, File system, OSGi XML. Since we support all popular formats, it is easy to port from an existing build. All repositories are visible in the searchable repository view.
- Errors/Warnings – Extensive reporting of errors and warnings, pointing right at where the problem is. Ok, most of the time.
- Decorations – Extensive set of decorations that show in detail what classes are components, packages, exported, etc.
- Quick Fixes – We are adding more and more quick fixes that adjust your build when you make a mistake.
- Assembly – Assembly of applications based on the Requirement/Capability model with a resolver. You have to use it to believe how great this is.
- Executable JARs – Can export to executable JARs that are easy to wrap in Docker containers
- CI – Out of the box parallel Gradle build with _every workspace_ for a 100% identical CI build
- Repeatable Builds – Make sure your build works the same today as in 5 years
- Baselining – Compare API changes to a previous release continuously, any violation is immediately reported on the code line that breaks the API.

So if you want to see a project that uses Bndtools without OSGi, you can take a look at [AlloyTools](https://github.com/alloytools/org.alloytools.alloy). I setup this project for a _formal specification_ language called Alloy, a hobby of mine. It is setup to build an executable JAR in [dist project](https://github.com/AlloyTools/org.alloytools.alloy/tree/master/org.alloytools.alloy.dist). Since Bndtools is a wizard in making JARs, it is quite easy to assembly the application out of the different projects and many native code parts.

This project was build on the old classpath model. However, since we have all the modularity information we can easily build a module path for [JPMS](https://en.wikipedia.org/wiki/Java_Platform_Module_System) on Java 15 ... If it was worth it?

If you open this workspace you will find out how easy and pleasant Bndtools is to use, even if it lacks OSGi.

<p style="margin-left:5rem">Peter Kriens</p>

_P.S. After I wrote this blog on my [own site](https://www.aQute.biz), someone contacted me. He said: "Nice article.", which usually means there is a "but". Yup, he then enumerated the many features that I had not listed yet. I'd just like to quote how he ended his mail: "These are all reasons to love Bndtools compared with other options (in fact, there are no other options with this feature set!)."_
