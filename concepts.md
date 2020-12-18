---
title: Concepts
description: Introduction to the basic bnd workspace model
---

Bndtools is an Eclipse plugin that used [bnd](bnd.html) under the hood to create [OSGi](https://www.osgi.org/) _bundles_. A bundle is a Java ARchive (JAR) that has a manifest with the OSGi metadata. Bndtools provides an IDE for developing these bundles with the least amount of work and maximum feedback.

## Workflow

Although Bndtools is flexible enough to support many different workflows it helps to understand the workflow we had in mind when we worked on bnd and Bndtools. The following picture outlines the archetypical parts:

![bnd workflow model](https://user-images.githubusercontent.com/200494/44081814-f090414a-9faf-11e8-8f83-d11da27990c6.png)

A core concept in OSGi is to create _components_ that only use (service) APIs. I.e. it is recommended to restrict the compilation (or build path) to dependencies that only carry an API, not an implementation. Since APIs are not sufficient to run the component, it is necessary to provide an _assembly_ that contains the components and dependencies that can provide the necessary implementations. In Bndtools this is a `bndrun` file although the `bnd` file can also act as such.

Bndtools is accompanied with a Gradle build that uses the same bnd that runs inside Eclipse for continuous integration.

An assembly is then tested and when accepted deployed. Bndtools can take a `bndrun` file and turn it into an _executable JAR_.

Since development is a continuous process, Bndtools also support _baselining_, a technique based on semantic versioning to get warned when changes in API are made that are not backward compatible.

## bnd

Bndtools is a user friendly driver of the [bnd](https://bnd.bndtools.org) library. bnd provides an abstract workspace/project model that Bndtools uses to tell Eclipse what to build. Since bnd has been growing up in parallel with OSGi itself it understands OSGi extremely well. It is an invaluable assistent for OSGi developers.

A unique aspect of bnd is that it is an _abstract_ build model. Because it is abstract, projects developed with Bndtools can also be built with Gradle without any extra effort. This is the perfect combination of a user friendly IDE and a solid continuous integration tool.

### Workspace/Repositories/Project Model

Bndtools uses the bnd _workspace_ model. A workspace is a directory on the file system that has the file `cnf/build.bnd`. All configuration of Bndtools is done through `bnd` files. A bnd file is an UTF-8 file using the venerable properties format. The `build.bnd` file is the _shared_ configuration. Any property defined in this file is shared between all projects.

Other directories in the workspace directory are project directories if they contain a `bnd.bnd` file. In that case, the OSGi Bundle Symbolic Name is the name of that directory.

Any properties defined in `build.bnd` can be overridden in the per project `bnd.bnd` file. Bndtools contains an easy to use editor that provides syntax highlighting for these bnd files.

_All_ information to build a workspace (that is, all projects in the workspace) is stored in these `bnd` files. No other information influences the result.

The following picture shows the inheritance structure of the different bndand bndrun files.

<img src="https://user-images.githubusercontent.com/200494/44082482-a4970a42-9fb1-11e8-962a-f9304ef4639c.png" style="width:300px;margin-left:auto;margin-right:auto;display:block">

### Repositories

External dependencies (e.g. Maven Central) are handled through _repositories_. Repositories are setup in the `build.bnd` file as _plugins_. bnd supports an extensive range of repositories:

- Workspace
- OSGi Repositories
- Local file system based
- Eclipse P2
- Maven

Repository plugins map the external world into a bundle world. A general concept in bnd is that the repositories define an exact set of dependencies and not support transitive dependencies. The reason that the for many very useful transitive dependencies are not supported is that they tend to make horrible OSGi systems.

Each project can depend on the bundles that are coming from the repositories. These bundles are explicitly listed in the `bnd.bnd` projects files.

<img src="https://user-images.githubusercontent.com/200494/44082642-1d1ef876-9fb2-11e8-8498-b1d722953d9a.png" style="width:300px;margin-left:auto;margin-right:auto;display:block">

### Builders

Bndtools will continuously build the bundles. Any change in the IDE, either a Java source file or a bnd file will automatically trigger a new build which will result in a new up to date JAR.

In OSGi, a bundle's _manifest_ must list what packages are required in runtime. bnd calculates this manifest by analyzing the bytecodes and finding out what dependencies are used. It uses the metadata available in the dependencies to handle versioning so that the developer can mostly ignore these details.

Any other metadata is also provided indirectly or explicitly in a bnd file. Each `bnd.bnd` file can set manifest headers for example.

### Run Files

Before you can run an OSGi framework it is necessary to create an _assembly_ of bundles to run. Bndtools provide unique support for this with the _bndrun_ files. Instead of listing bundles, the bndrun file contains _initial requirements_. The Bndtools editor makes it possible to use drag and drop to fill this list from the repositories and the workspace's projects. This support is based on the OSGi _resource_ model. Bndtools provides a resolver that then takes the initial requirements together with the framework and repositories and calculates a closure of bundles that can run together. This feature has no counterpart in any other tool.

### Debugging

Bndtools integrates the bnd launcher that is parameterized from the bndrun file. After running the resolver, the bndrun file editor shows a `Run` or `Debug` button that will launch the assembly. This launcher is completely integrated with the Eclipse debugging tools.

The Bndtools OSGi Run Launcher also supports an __Update bundles during runtime__, which causes Bndtools to continue watching for changes to bundles (or your launch file) in your workspace as it is rebuilt. When changes occur to your bundles, it will dynamically re-deploy the changed bundles into the running application once the build is complete. This makes it much easier to dynamically debug and develop your bundles.

### Testing

Normal JUnit testing is clearly fully supported with Bndtools and will work as expected. However, Bndtools also supports _OSGi integration testing_. In this case, the `bnd.bnd` file defines a set of bundles (which can be assembled with the resolver) that provide the runtime for the test. Except for the menu entry, this kind of integration testing is then identical to normal JUnit testing. That is, the developer can select a test class or test method and execute the test while the results are displayed in the JUnit view.

Bndtools also supports the continuous testing mode of bnd. If you configure your Bndtools launch configuration with __Continue running framework after tests have completed__, then rather than exiting at the end of the test, the framework remains active. The tester listens for newly-started (or re-started) test bundles, and re-runs the tests. With the latest version of the Bnd tester and the __Display JUnit results in IDE every time the tester reruns tests__ option selected, then each re-run of the tests will be displayed in the JUnit view. This feature can be combined with the __Update bundles during runtime__ to significantly speed up the develop-test cycle.

### Continuous Integration

Although developers spend the far majority of their time in an IDE, the most important part of a professional development takes place in the _continuous integration_. Only when a workspace is build from scratch is it possible to verify that a build is _repeatable_. That is, a product that is generated on a developer's desktop cannot be trusted.

For this reason, workspaces generally integrate a gradle build based on bnd. By using the same underlying abstract build model, it is virtually guaranteed that when Eclipse indicates that the workspace builds fine, it will also build on a remote server.

### Releasing

Bndtools provides an integrated release model. Although special tools are provided to release from the IDE it is highly recommended to only release from the continuous integration. bnd can release to most of its supported repositories. Maven is extensively supported, including signing.

### Deploying

Bndtools can export a bndrun file to an executable JAR. This is a JAR that can be executed in any Java VM. The JAR contains the framework and all required bundles. When it runs with the venerable `java -jar x.jar` command it will unpack itself and launch a framework. The continuous integration can build this executable JAR.

### Baselining

Once API is released to external repositories, Bndtools will track the version numbers and the binary compatibility of newer versions with the older versions. If the developer makes a change that is not compatible with the semantics of the versions then it will place an error on the place where the version is maintained and the offending code. For example, adding a method to an interface is not backward compatible and requires a n update to the version. In this case the new method will be marked as error until the corresponding version is updated.
