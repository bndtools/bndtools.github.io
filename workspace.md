---
---

# Workspace

Bndtools is based on the _bnd workspace_ model as described in the [concepts](concepts.html). In its most simple form
this means that there is a single directory that contains all the projects. This directory generally matches
the `.git` workspace, the gradle workspace, and the Eclipse workspace.

Using the bnd workspace means that you can work almost full time in Eclipse while a continuous integration build
with, for example, Github Actions using Gradle is automatically supported.

This page contains a number of videos that explain how to get started with the workspace model. It is assumed 
that you have a Java VM installed and that Eclipse is running with the [latest Bndtools](installation.md).

If you try this out, it is highly recommended to have the Java 1.8 VM installed as default.

## TL;DR

If the 15 minute of videos is too much time, you can find a workspace that contains the work done in the
videos at:

    https://github.com/aQute-os/com.example

## Install

The following video shows how to install a workspace from a template and start a _playground_ project with the 
Apache Felix Gogo shell.

<iframe width="560" height="315" src="https://www.youtube.com/embed/N5pX01XTCBE" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Hello World Gogo Command

At the end of the previous video, we had Gogo running. The following video shows how to write a simple Hello World 
Gogo command. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/0Z7EklHaugg" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### API & Provider Project

The basic model of OSGi is to develop services that have a distinct, separate, API from the providers. This video shows
how to create this API and a simple provider and then run the provider in the playground.

<iframe width="560" height="315" src="https://www.youtube.com/embed/s-erxgdkjlk" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### External Dependencies

In this video an alternative implementation is developed that uses the API from the previous video but depends on
Mozilla Rhino to do the execution of the evaluation expression. It shows how to add a dependency from Maven
Central to the workspace.

<iframe width="560" height="315" src="https://www.youtube.com/embed/2lbDpldOn9I" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
</iframe>

### Executable JARs

In this video we export the Rhino and Simple Eval providers into an _Executable JAR_. This is a JAR that contains all its
dependencies, including the framework. For this, we create an application project and an application bndrun file. After
testing, we export it to an executable JAR. This JAR is then verified from the command line and shown that you can
extract the contents to the file system. As a bonus, the executable JAR is stored and ran as a Docker container.

<iframe width="560" height="315" src="https://www.youtube.com/embed/QYEhlWmvcyU" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
</iframe>
 
### Gradle Integration
 
Software build on your laptop does not count. To develop software professionally, all artifacts must be buildable on an independent server. This is normally called
_continuous integration_ (CI). However, it is not possible to run an IDE on a remote server, you need a _build tool_. With bnd workspaces, there comes an
implicit Gradle build. A plugin in Gradle ensures that whatever is done in the IDE is done identically in the CI build by Gradle.
 
Although you rarely have to use Gradle as a normal developer, this video demonstrates how to run Gradle from the command line.
 
<iframe width="560" height="315" src="https://www.youtube.com/embed/YtUVSJQ2gwE" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 
 
### Github & Actions

Github provides the almost perfect software engineering environment! In this video we'll take our workspace so far
and move it to a Github repository. The workspace template we used, [bndtools.workspace.min](https://github.com/bndtools/bndtools.workspace.min) 
contains a `.github/workflows/build.yml` file. This file is a trigger for Github Actions to automatically build the workspace
on every pull request or build.

<iframe width="560" height="315" src="https://www.youtube.com/embed/c0OLbr7bwQg" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 