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

If you try this out, it is recommended to have the Java 1.8 VM installed as default.

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/2lbDpldOn9I" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
